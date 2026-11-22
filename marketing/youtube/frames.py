from PIL import Image, ImageDraw, ImageFont, ImageFilter
import random, sys
HB="/System/Library/Fonts/Supplemental/Arial Black.ttf"; B="/System/Library/Fonts/Supplemental/Arial Bold.ttf"
def bg(w,h,seed=1,bright=1.0):
    random.seed(seed)
    im=Image.new("RGB",(w,h),(int(8*bright),int(10*bright),int(28*bright)))
    d=ImageDraw.Draw(im)
    for _ in range(int(w*h/9000)):
        x,y=random.randrange(w),random.randrange(h); r=random.choice([1,1,2])
        c=int(random.randint(60,140)*bright); d.ellipse((x,y,x+r,y+r),fill=(c,c,min(255,c+40)))
    # zachte maan
    m=Image.new("L",(w,h),0); ImageDraw.Draw(m).ellipse((w*0.70,h*0.12,w*0.70+h*0.22,h*0.12+h*0.22),fill=255)
    m=m.filter(ImageFilter.GaussianBlur(h*0.03))
    im.paste(Image.new("RGB",(w,h),(int(230*bright),int(210*bright),int(160*bright))),(0,0),m)
    return im
def centered(d,y,txt,font,w,fill):
    tw=d.textlength(txt,font=font); d.text(((w-tw)/2,y),txt,font=font,fill=fill)
def frame(path,title,sub):
    im=bg(1920,1080,bright=0.55); d=ImageDraw.Draw(im)
    centered(d,430,title,ImageFont.truetype(HB,84),1920,(150,150,170))
    centered(d,560,sub,ImageFont.truetype(B,40),1920,(110,110,130))
    centered(d,960,"DUSKI",ImageFont.truetype(HB,36),1920,(150,100,40))
    im.save(path)
def thumb(path,big,small):
    im=bg(1280,720,seed=3); d=ImageDraw.Draw(im)
    f=ImageFont.truetype(HB,118 if len(big)<14 else 96)
    y=210
    for line in big.split("\n"):
        tw=d.textlength(line,font=f); d.text((70,y),line,font=f,fill=(255,255,255),stroke_width=4,stroke_fill=(0,0,0)); y+=f.size+10
    d.text((74,y+20),small,font=ImageFont.truetype(B,52),fill=(255,190,90),stroke_width=3,stroke_fill=(0,0,0))
    d.text((74,630),"DUSKI",font=ImageFont.truetype(HB,44),fill=(255,176,60))
    im.save(path)
if __name__=="__main__":
    frame("out/white-frame.png","White Noise for Babies","10 hours · dim screen · gentle, steady sound")
    thumb("out/white-thumb.png","WHITE NOISE\nFOR BABIES","10 HOURS · calm sleep")
