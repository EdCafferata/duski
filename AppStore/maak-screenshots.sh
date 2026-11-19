#!/bin/zsh
# Maakt de App Store-screenshots (onboarding + mixer) voor alle 8 talen op iPhone 6.9" en iPad Pro 13",
# en zet ze in AppStore/Screenshots/<locale>/<device>/. Uploaden daarna met: fastlane screenshots
# (kan alleen op een nog bewerkbare versie in ASC, dus pas als de volgende versie is aangemaakt).
set -e
cd "${0:A:h}/.."
OUT=$(mktemp -d); DD=$(mktemp -d)
IPH=${IPH:-"iPhone 17 Pro Max"}; IPAD=${IPAD:-"iPad Pro 13-inch (M5)"}

xcodebuild -project Duski.xcodeproj -scheme Duski -configuration Release \
  -destination 'generic/platform=iOS Simulator' -derivedDataPath "$DD" build -quiet
APP="$DD/Build/Products/Release-iphonesimulator/Duski.app"

shoot() { dev=$1; lang=$2; name=$3; shift 3
  xcrun simctl terminate "$dev" info.cafferata.duski 2>/dev/null || true
  xcrun simctl launch "$dev" info.cafferata.duski -AppleLanguages "($lang)" -AppleLocale "$lang" "$@" >/dev/null
  sleep 5; xcrun simctl io "$dev" screenshot --type=png "$OUT/$name" >/dev/null 2>&1; }

for dev in "$IPH" "$IPAD"; do
  xcrun simctl shutdown "$dev" 2>/dev/null || true; xcrun simctl boot "$dev"; xcrun simctl bootstatus "$dev" >/dev/null
  xcrun simctl status_bar "$dev" override --time 9:41 --batteryState charged --batteryLevel 100 --cellularBars 4 --wifiBars 3
  xcrun simctl uninstall "$dev" info.cafferata.duski 2>/dev/null || true; xcrun simctl install "$dev" "$APP"
  tag=$([[ $dev == iPad* ]] && echo ipad || echo iph)
  for pair in en-US:en nl-NL:nl de-DE:de fr-FR:fr es-ES:es it:it pt-BR:pt-BR ja:ja; do
    loc=${pair%%:*}; lang=${pair#*:}
    shoot "$dev" "$lang" "$tag~$loc~1-onboarding.png"
    shoot "$dev" "$lang" "$tag~$loc~2-mixer.png" -duski-leeftijdsgroep baby   # slaat onboarding over
  done
done

# iPhone 1320x2868 -> 1290x2796 (6.7"-slot); iPad: venstergreep rechtsonder wegpoetsen.
python3 - "$OUT" AppStore/Screenshots <<'EOF'
import sys, os, glob
from PIL import Image, ImageDraw
out, dst = sys.argv[1], sys.argv[2]
for f in glob.glob(f"{out}/*.png"):
    tag, loc, name = os.path.basename(f).split('~')
    im = Image.open(f).convert('RGB')
    if tag == 'iph':
        dev = "iPhone 6.7 Display"; im = im.resize((1290, 2796), Image.LANCZOS)
    else:
        dev = "iPad Pro (12.9-inch) (6th generation)"; W, H = im.size
        ImageDraw.Draw(im).rectangle((W-90, H-90, W, H), fill=im.getpixel((W-120, H-120)))
    os.makedirs(f"{dst}/{loc}/{dev}", exist_ok=True); im.save(f"{dst}/{loc}/{dev}/{name}")
EOF
echo "Klaar: $(find AppStore/Screenshots -name '*.png' | wc -l | tr -d ' ') screenshots"
