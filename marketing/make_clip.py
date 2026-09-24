#!/usr/bin/env python3
"""
make_clip.py — maakt een verticale 1080x1920 TikTok-clip voor Duski uit een app-screenshot.
Tekst via PIL (ffmpeg hier heeft geen drawtext), beeld+geluid via ffmpeg.
Audio = gesynthetiseerde bruine ruis (on-thema voor een slaapgeluiden-app, rechtenvrij).

Gebruik:
  python3 make_clip.py --shot <screenshot.png> --hook "HOOK" --sub "Onderregel" --out clips/xx.mp4
"""
import argparse, os, subprocess, sys, tempfile
from PIL import Image, ImageDraw, ImageFont

W, H = 1080, 1920
HOOK_FONT = "/System/Library/Fonts/Supplemental/Arial Black.ttf"
BODY_FONT = "/System/Library/Fonts/Supplemental/Arial Bold.ttf"
FFMPEG = "/opt/homebrew/bin/ffmpeg"

def wrap(draw, text, font, max_w):
    words, lines, cur = text.split(), [], ""
    for w in words:
        t = (cur + " " + w).strip()
        if draw.textlength(t, font=font) <= max_w:
            cur = t
        else:
            if cur: lines.append(cur)
            cur = w
    if cur: lines.append(cur)
    return lines

def rounded_scrim(base, box, radius=28, fill=(0, 0, 0, 140)):
    x0, y0, x1, y1 = box
    scr = Image.new("RGBA", base.size, (0, 0, 0, 0))
    ImageDraw.Draw(scr).rounded_rectangle(box, radius=radius, fill=fill)
    return Image.alpha_composite(base, scr)

def make_overlay(hook, sub, out_png):
    img = Image.new("RGBA", (W, H), (0, 0, 0, 0))
    hook_font = ImageFont.truetype(HOOK_FONT, 78)
    sub_font  = ImageFont.truetype(BODY_FONT, 46)
    brand_font = ImageFont.truetype(HOOK_FONT, 40)
    d = ImageDraw.Draw(img)

    # HOOK bovenaan
    lines = wrap(d, hook, hook_font, W - 200)
    line_h = 96
    total_h = line_h * len(lines)
    top = 190
    img = rounded_scrim(img, (70, top - 34, W - 70, top + total_h + 34))
    d = ImageDraw.Draw(img)
    y = top
    for ln in lines:
        tw = d.textlength(ln, font=hook_font)
        d.text(((W - tw) / 2, y), ln, font=hook_font, fill=(255, 255, 255, 255),
               stroke_width=3, stroke_fill=(0, 0, 0, 200))
        y += line_h

    # ONDERREGEL + merk + CTA onderaan
    bottom_y = H - 430
    img = rounded_scrim(img, (60, bottom_y - 30, W - 60, H - 150), radius=32, fill=(0, 0, 0, 150))
    d = ImageDraw.Draw(img)
    # merk
    brand = "DUSKI"
    bw = d.textlength(brand, font=brand_font)
    d.text(((W - bw) / 2, bottom_y), brand, font=brand_font, fill=(255, 176, 60, 255))
    # subregel (gewrapt)
    y = bottom_y + 70
    for ln in wrap(d, sub, sub_font, W - 200):
        tw = d.textlength(ln, font=sub_font)
        d.text(((W - tw) / 2, y), ln, font=sub_font, fill=(235, 235, 235, 255))
        y += 60
    # CTA
    cta = "Gratis op Google Play"
    cw = d.textlength(cta, font=sub_font)
    d.text(((W - cw) / 2, y + 8), cta, font=sub_font, fill=(255, 176, 60, 255))

    img.save(out_png)

def make_clip(shot, hook, sub, out, dur=12):
    os.makedirs(os.path.dirname(out) or ".", exist_ok=True)
    tmp = tempfile.NamedTemporaryFile(suffix=".png", delete=False).name
    make_overlay(hook, sub, tmp)
    fps = 30
    fc = (
        # geblurde vulling als achtergrond (geen zwarte balken)
        f"[0:v]scale={W}:{H}:force_original_aspect_ratio=increase,crop={W}:{H},boxblur=40:2,setsar=1[bg];"
        # scherpe screenshot
        f"[0:v]scale=-2:1560,setsar=1[fg];"
        # lichte verticale drift voor 'leven' (betrouwbaar, geen zoompan)
        f"[bg][fg]overlay=(W-w)/2:'(H-h)/2+24*sin(t/2.5)'[base];"
        f"[base][1:v]overlay=0:0[v];"
        f"[2:a]lowpass=f=700,volume=0.7,afade=t=in:st=0:d=1.5,afade=t=out:st={dur-1.5}:d=1.5[a]"
    )
    cmd = [FFMPEG, "-y",
           "-loop", "1", "-framerate", str(fps), "-t", str(dur), "-i", shot,
           "-loop", "1", "-framerate", str(fps), "-t", str(dur), "-i", tmp,
           "-f", "lavfi", "-t", str(dur), "-i", "anoisesrc=color=brown:amplitude=0.5:sample_rate=44100",
           "-filter_complex", fc,
           "-map", "[v]", "-map", "[a]", "-t", str(dur),
           "-c:v", "libx264", "-pix_fmt", "yuv420p", "-r", str(fps), "-preset", "veryfast",
           "-c:a", "aac", "-b:a", "128k", "-movflags", "+faststart", out]
    subprocess.run(cmd, check=True)
    os.unlink(tmp)
    print("OK:", out)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--shot", required=True)
    ap.add_argument("--hook", required=True)
    ap.add_argument("--sub", required=True)
    ap.add_argument("--out", required=True)
    ap.add_argument("--dur", type=int, default=12)
    a = ap.parse_args()
    make_clip(a.shot, a.hook, a.sub, a.out, a.dur)
