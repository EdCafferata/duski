import subprocess, sys
from PIL import Image, ImageDraw, ImageFont
from frames import bg
HB="/System/Library/Fonts/Supplemental/Arial Black.ttf"; B="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
F="/opt/homebrew/bin/ffmpeg"; W,H=1080,1920
SHOT="/Volumes/Backup-Ed/AI/duski/AppStore/Screenshots/en-US/iPhone 6.7 Display/2-mixer.png"
def wrap(d,t,f,mw):
    out,cur=[], ""
    for w in t.split():
        x=(cur+" "+w).strip()
        if d.textlength(x,font=f)<=mw: cur=x
        else: out.append(cur); cur=w
    return out+[cur]
def card(path,hook,sub):
    im=bg(W,H,seed=7,bright=0.9).convert("RGBA")
    s=Image.open(SHOT).convert("RGBA"); sw=640; s=s.resize((sw,int(s.height*sw/s.width)))
    m=Image.new("L",s.size,0); ImageDraw.Draw(m).rounded_rectangle((0,0,s.width,s.height),radius=60,fill=255)
    im.paste(s,((W-sw)//2,560),m)
    d=ImageDraw.Draw(im); f=ImageFont.truetype(HB,74); y=170
    for ln in wrap(d,hook,f,W-140):
        d.text(((W-d.textlength(ln,font=f))/2,y),ln,font=f,fill="white",stroke_width=4,stroke_fill="black"); y+=92
    # onderbalk
    ov=Image.new("RGBA",(W,H)); ImageDraw.Draw(ov).rounded_rectangle((50,1490,W-50,1790),radius=36,fill=(0,0,0,185)); im=Image.alpha_composite(im,ov)
    d=ImageDraw.Draw(im); fs=ImageFont.truetype(B,44); y=1520
    for ln in wrap(d,sub,fs,W-160):
        d.text(((W-d.textlength(ln,font=fs))/2,y),ln,font=fs,fill="white"); y+=58
    fb=ImageFont.truetype(HB,46); t="DUSKI  ·  iPhone & Android"
    d.text(((W-d.textlength(t,font=fb))/2,1710),t,font=fb,fill=(255,176,60))
    im.convert("RGB").save(path)
def audio(snd,sec,out,gain):
    p=subprocess.run(f"./gen/duskigen {snd} {sec} | {F} -v error -y -f f32le -ar 48000 -ac 1 -i - -af volume={gain}dB -ac 2 {out}",shell=True,check=True)
def render(segs,out):
    # segs: [(png,wav,sec)]
    parts=[]
    for i,(png,wav,sec) in enumerate(segs):
        o=f"out/_seg{i}.mp4"
        subprocess.run([F,"-v","error","-y","-loop","1","-framerate","30","-i",png,"-i",wav,"-t",str(sec),
            "-vf",f"scale=1188:-1,zoompan=z='min(1+on/{sec*30}*0.06,1.06)':x='iw/2-(iw/zoom/2)':y='ih/2-(ih/zoom/2)':d=1:s={W}x{H}:fps=30",
            "-c:v","libx264","-pix_fmt","yuv420p","-preset","medium","-crf","20","-c:a","aac","-b:a","160k",o],check=True)
        parts.append(o)
    open("out/_list.txt","w").write("".join(f"file '{p.split('/')[-1]}'\n" for p in parts))
    subprocess.run([F,"-v","error","-y","-f","concat","-safe","0","-i","out/_list.txt","-af","afade=t=in:d=0.3","-c:v","copy","-c:a","aac","-b:a","160k",out],check=True)
if __name__=="__main__":
    card("out/s1.png","Babies spent 9 months listening to this","Womb sounds + heartbeat, generated live on your phone. No loops, volume-limited baby mode.")
    audio("baarmoeder",25,"out/s1.wav",4); render([("out/s1.png","out/s1.wav",25)],"out/short-1-womb.mp4")
    card("out/s2a.png","This is white noise...","Bright and hissy. Now listen to the next one.")
    card("out/s2b.png","...and this is brown noise","Deeper and softer. Which one helps YOU sleep? Comment white or brown.")
    audio("wit",11,"out/s2a.wav",-10); audio("bruin",14,"out/s2b.wav",-4)
    render([("out/s2a.png","out/s2a.wav",11),("out/s2b.png","out/s2b.wav",14)],"out/short-2-white-vs-brown.mp4")
    card("out/s3.png","Rain sounds that never loop","Every drop is synthesised live by the app. Mix rain, noise and heartbeat into your own sleep sound.")
    audio("regen",25,"out/s3.wav",0); render([("out/s3.png","out/s3.wav",25)],"out/short-3-rain.mp4")
    print("klaar")
