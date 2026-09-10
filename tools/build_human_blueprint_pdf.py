"""Build the source-bound Korean human blueprint. Not a runtime screenshot maker."""
from pathlib import Path
import hashlib
import json
import re
from io import BytesIO
from xml.sax.saxutils import escape
from PIL import Image as PILImage
from reportlab.lib import colors
from reportlab.lib.pagesizes import A4, landscape
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.utils import ImageReader
from reportlab.platypus import SimpleDocTemplate, Paragraph, Table, TableStyle, PageBreak, Spacer, Flowable
from pypdf import PdfReader

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'docs/superpowers/specs/2026-09-11-human-blueprint.md'
RULES = ROOT / 'docs/superpowers/specs/2026-09-10-shared-spell-rules-design.md'
RESEARCH = ROOT / 'docs/planning/CARD_DUEL_REPLANNING_RESEARCH_2026-09-10.md'
ART = ROOT / 'output/imagegen/blueprint-20260911'
OUT = ROOT / 'output/pdf/GRIMOIRE_HUMAN_BLUEPRINT_20260911.pdf'
W, H = landscape(A4)
WIDTH = W - 76
INK = colors.HexColor('#203743')
NAVY = colors.HexColor('#132538')
GOLD = colors.HexColor('#a98041')
PAPER = colors.HexColor('#f5f0e4')
ASSETS = {k: ART / f'{k}.png' for k in ['main','classroom','greenhouse','festival','player','glyphs','props','ui','vfx','clock']}
ASSETS.update(peer=ART/'peer-style-alpha.png', tutor=ART/'tutor-alpha.png', duel=ROOT/'output/imagegen/card-duel/duel-background-candidate-01.png')
PDF_IMAGES = {}

def pdf_image(key):
    # Compress the derived document representation only; source asset bytes stay intact.
    if key not in PDF_IMAGES:
        img=PILImage.open(ASSETS[key])
        if img.mode=='RGB':
            encoded=BytesIO();img.save(encoded,format='JPEG',quality=90,subsampling=0);encoded.seek(0)
            PDF_IMAGES[key]=ImageReader(encoded)
        else:PDF_IMAGES[key]=ImageReader(str(ASSETS[key]))
    return PDF_IMAGES[key]

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

def draw_image(c, key, x, y, w, h):
    path = ASSETS[key]
    iw, ih = PILImage.open(path).size
    scale = min(w/iw, h/ih)
    c.drawImage(pdf_image(key), x+(w-iw*scale)/2, y+(h-ih*scale)/2, iw*scale, ih*scale, mask='auto')

def label(c, text, x, y, size=11, color=INK):
    c.setFillColor(color)
    c.setFont('KR', size)
    c.drawString(x,y,text)

def panel(c, x,y,w,h,text='',size=12):
    c.drawImage(pdf_image('ui'),x,y,w,h,mask='auto')
    if text:
        label(c,text,x+12,y+h/2-4,size,PAPER)

def glyph(c, index, x,y,size):
    iw,ih=PILImage.open(ASSETS['glyphs']).size
    c.saveState()
    p=c.beginPath();p.rect(x,y,size,size);c.clipPath(p,stroke=0)
    col,row=index%2,index//2
    c.drawImage(pdf_image('glyphs'),x-col*size,y-(1-row)*size,size*2,size*2)
    c.restoreState()

def tile(c,key,index,cols,rows,x,y,w,h):
    c.saveState();p=c.beginPath();p.rect(x,y,w,h);c.clipPath(p,stroke=0)
    col,row=index%cols,index//cols
    c.drawImage(pdf_image(key),x-col*w,y-(rows-1-row)*h,w*cols,h*rows,mask='auto')
    c.restoreState()

def screen(c,kind,x,y,w,h):
    scale=min(w/1280,h/720)
    c.saveState();c.translate(x+(w-1280*scale)/2,y+(h-720*scale)/2);c.scale(scale,scale)
    bg={'main':'main','dialogue':'classroom','event':'greenhouse','duel':'duel','festival':'festival','codex':'classroom','result':'festival','admission':'main','lesson':'classroom'}[kind]
    c.drawImage(pdf_image(bg),0,0,1280,720)
    if kind=='main':
        panel(c,50,505,450,130,'GRIMOIRE',38)
        for i,t in enumerate(['새 게임','이어하기','설정','도감','종료']):panel(c,80,410-i*66,320,56,t,22)
    elif kind in ['dialogue','admission','result']:
        draw_image(c,'player',65,160,430,490)
        draw_image(c,'tutor' if kind=='dialogue' else 'peer',785,160,430,490)
        panel(c,35,20,1210,220)
        label(c,'지도교수' if kind=='dialogue' else '동료 학생',555,202,24,PAPER)
        label(c,'같은 글자라도 어디에 쓰느냐에 따라 해야 할 일이 달라집니다.',85,146,24,PAPER)
        panel(c,95,46,460,60,'대상을 먼저 살펴본다',22)
        panel(c,710,46,460,60,'기록을 확인한다',22)
    elif kind=='codex':
        panel(c,55,65,1170,590)
        label(c,'주문 도감 · 배운 작용과 사용 기록',95,604,30,PAPER)
        for i,t in enumerate(['불씨','바람','막기','모으기']):
            glyph(c,i,100+i*284,275,230);label(c,t,100+i*284,237,24,PAPER)
        label(c,'모으는 바람 - 온실에서 꽃가루를 수집했다.',100,150,26,PAPER)
    else:
        if kind=='duel':
            draw_image(c,'player',35,180,360,460);draw_image(c,'peer',895,180,350,460)
            panel(c,24,642,380,58,'나 · 결계 16 / 16',23)
            panel(c,870,642,386,58,'동료 · 결계 16 / 16',23)
            panel(c,445,568,390,96,'예고: 흐름 공격 4',23)
        else:
            panel(c,24,642,790,58,'온실 · 원인 닫기 + 남은 꽃가루 수집' if kind=='event' else '실습 · 대상을 읽고 작용을 고르기',23)
            panel(c,850,642,405,58,'마력 6 · 위험 2 / 6' if kind=='event' else '마력 6',23)
            if kind=='event':
                tile(c,'props',2,4,2,810,235,110,220)
                tile(c,'props',4,4,2,1030,245,95,190)
                tile(c,'vfx',0,2,2,830,420,140,140)
            else:tile(c,'props',6 if kind=='festival' else 0,4,2,835,250,110,220)
            panel(c,700,565,540,56,'열린 장치 + 남은 꽃가루' if kind=='event' else '대상 상태를 살펴보기',20)
        panel(c,25,20,1230,214)
        for i,t in enumerate(['불씨','바람','막기','모으기']):
            glyph(c,i,52+i*147,76,104);label(c,t,60+i*147,47,20,PAPER)
        spell_label={'duel':'조합: 바람 + 막기','event':'조합: 바람 + 모으기','lesson':'선택: 불씨','festival':'선택: 불씨'}[kind]
        effect_label={'duel':'흐름 전환 · 자기 피해1 / 반격3','event':'수집 -2 / 누출 +1 · 마력2','lesson':'용기 데우기 · 마력1 / 시간1','festival':'등불 점화 · 마력1 / 시간1'}[kind]
        label(c,spell_label,670,172,22,PAPER)
        label(c,effect_label,670,125,20,PAPER)
        panel(c,675,35,230,60,'취소',22);panel(c,950,35,260,60,'시전',22)
    label(c,'설계 합성 / 실행 촬영 아님',850,710,13,PAPER)
    c.restoreState()

class Visual(Flowable):
    def __init__(self,kind,key=''):
        Flowable.__init__(self);self.kind=kind;self.key=key;self.width=WIDTH
        self.height= {'atlas':350,'screen':270,'flow':92}.get(kind,295)
        if kind=='screen' and key=='main':self.height=215
        if key=='ui':self.height=105
        if key=='clock':self.height=110
        if key=='props':self.height=285
        if key=='vfx':self.height=260
        if key=='glyphs':self.height=250
        if key=='portraits':self.height=250
    def draw(self):
        c=self.canv
        if self.kind=='screen':
            screen(c,self.key,0,0,self.width,self.height)
        elif self.kind=='atlas':
            keys=['main','admission','dialogue','lesson','duel','event','codex','festival','result']
            names=['메인','입학과 만남','대화','수업','연습 결투','온실 실습','도감','축제 준비','복기·마무리']
            tw=(self.width-24)/3;th=95
            for i,(key,name) in enumerate(zip(keys,names)):
                xx=(i%3)*(tw+12);yy=243-(i//3)*117
                screen(c,key,xx,yy,tw,th);label(c,name,xx,yy-13,9)
        elif self.kind=='flow':
            items=self.key.split('|');n=len(items);cw=(self.width-12*(n-1))/n
            for i,t in enumerate(items):
                xx=i*(cw+12);c.setFillColor(NAVY);c.roundRect(xx,25,cw,48,5,fill=1,stroke=0)
                label(c,t,xx+6,44,8 if n>7 else 11,PAPER)
                if i<n-1:label(c,'>',xx+cw+2,44,9,GOLD)
        elif self.key=='portraits':
            for i,k in enumerate(['player','peer','tutor']):
                c.setFillColor(colors.HexColor('#d9e3e1'));c.rect(i*255,18,245,232,fill=1,stroke=0)
                draw_image(c,k,i*255,18,245,232);label(c,['나 / 승인008 참고','동료 / 신규 후보','교수 / 신규 후보'][i],i*255+5,4,9)
        else:
            draw_image(c,self.key,0,0,self.width,self.height)

def main():
    for path in ASSETS.values():
        if not path.exists():raise FileNotFoundError(path)
    pdfmetrics.registerFont(TTFont('KR','C:/Windows/Fonts/malgun.ttf'))
    pdfmetrics.registerFont(TTFont('KRB','C:/Windows/Fonts/malgunbd.ttf'))
    body=ParagraphStyle('body',fontName='KR',fontSize=10.2,leading=16,spaceAfter=9,wordWrap='CJK',textColor=INK)
    cell=ParagraphStyle('cell',parent=body,fontSize=9.2,leading=14,spaceAfter=0)
    heads={1:ParagraphStyle('h1',parent=body,fontName='KRB',fontSize=23,leading=30,spaceAfter=16,keepWithNext=True),2:ParagraphStyle('h2',parent=body,fontName='KRB',fontSize=16,leading=23,spaceBefore=9,spaceAfter=12,keepWithNext=True),3:ParagraphStyle('h3',parent=body,fontName='KRB',fontSize=12,leading=18,spaceAfter=9,keepWithNext=True)}
    def markup(s):
        s=re.sub(r'\[([^]]+)\]\(([^)]+)\)',lambda m:m[1]+' ('+m[2]+')',s)
        return escape(s).replace('`','').replace('**','')
    def para(s,style=body):return Paragraph(markup(s),style)
    def parse(text,story):
        lines=text.strip().splitlines();i=0;code=False
        while i<len(lines):
            line=lines[i].strip();i+=1
            if not line:continue
            if line.startswith('```'):code=not code;continue
            if line.startswith('@'):
                typ,_,key=line[1:].partition(' ');story.extend([Visual(typ,key),Spacer(1,10)]);continue
            if line.startswith('|'):
                rows=[]
                while True:
                    raw=line.strip('|').split('|')
                    if not all(re.fullmatch(r'\s*:?-+:?\s*',x) for x in raw):rows.append([para(x.strip(),cell) for x in raw])
                    if i>=len(lines) or not lines[i].strip().startswith('|'):break
                    line=lines[i].strip();i+=1
                n=len(rows[0]);assert all(len(r)==n for r in rows)
                widths=[WIDTH/n]*n
                if n==2:widths=[WIDTH*.32,WIDTH*.68]
                table=Table(rows,colWidths=widths,repeatRows=1,hAlign='LEFT')
                table.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),colors.HexColor('#dee8e5')),('VALIGN',(0,0),(-1,-1),'TOP'),('LINEBELOW',(0,0),(-1,0),1,GOLD),('LINEBELOW',(0,1),(-1,-1),.3,colors.HexColor('#c5cfc9')),('LEFTPADDING',(0,0),(-1,-1),9),('RIGHTPADDING',(0,0),(-1,-1),9),('TOPPADDING',(0,0),(-1,-1),8),('BOTTOMPADDING',(0,0),(-1,-1),8)]))
                story.extend([table,Spacer(1,12)]);continue
            m=re.match(r'^(#{1,3}) (.*)',line)
            story.append(para(m[2],heads[len(m[1])]) if m else para(line))
    source=SOURCE.read_text(encoding='utf-8');rules=RULES.read_text(encoding='utf-8')
    story=[]
    for i,page in enumerate(source.split('<!-- page -->')):
        if i:story.append(PageBreak())
        parse(page,story)
    story.append(PageBreak());story.append(para('부록 A / 공통 규칙 원본',heads[1]))
    story.append(para('아래 규칙은 기존 책임 원본에서 직접 포함했다. 역사적 작업 상태·중간 조사 회차는 제외하고 실행 의미·예외·현재 수치와 진단 가정을 보존한다.'))
    for section in re.split(r'(?m)(?=^## \d+\.)',rules)[1:]:
        num=int(re.match(r'## (\d+)',section)[1])
        if num in [9,10,14,16]:continue
        if num==15:section=section.split('### 15.5')[0]
        if num==17:section=section.split('외부 재조회:')[0]
        parse(section,story)
    story.append(PageBreak());story.append(para('부록 B / 실제 자산 목록과 상태',heads[1]))
    metadata=[]
    for key,path in ASSETS.items():
        img=PILImage.open(path);a=img.getchannel('A') if 'A' in img.getbands() else None
        metadata.append(dict(id=key,path=path.relative_to(ROOT).as_posix(),size=list(img.size),mode=img.mode,sha256=sha(path),alpha_zero=a.histogram()[0] if a else 0,alpha_extrema=list(a.getextrema()) if a else None,status='GENERATED_CANDIDATE' if key!='duel' else 'USER_APPROVED_BACKGROUND_ONLY',runtime='NOT_RUN'))
    story.append(para('공통 폴더: output/imagegen/blueprint-20260911/ · duel만 output/imagegen/card-duel/ · 전체 경로/해시/알파는 PDF manifest 참조.',cell))
    parse('| 자산·규격 | 파일명 | 상태 |\n|---|---|---|\n'+'\n'.join(f"| {a['id']} / {a['size'][0]}×{a['size'][1]} / {a['mode']} | {Path(a['path']).name} | {'승인 배경 / 실행 미검증' if a['id']=='duel' else '후보 / 승인·실행 미검증'} |" for a in metadata),story)
    story.append(PageBreak());story.append(para('부록 C / 10작품 비교 원본',heads[1]))
    research_section=RESEARCH.read_text(encoding='utf-8').split('## 3. ')[1].split('## 4. ')[0]
    parse(research_section,story)
    def footer(c,doc):
        c.saveState();c.setFillColor(PAPER);c.rect(0,0,W,H,fill=1,stroke=0)
        label(c,'GRIMOIRE / HUMAN BLUEPRINT / DESIGN REVIEW',38,H-22,8,GOLD)
        c.setStrokeColor(GOLD);c.line(38,30,W-38,30)
        label(c,'2026.09.11 · 후보/기획과 실제 구현을 구분합니다',38,17,8)
        label(c,str(doc.page),W-62,17,9)
        c.restoreState()
    OUT.parent.mkdir(parents=True,exist_ok=True)
    staged=OUT.with_suffix('.building.pdf')
    SimpleDocTemplate(str(staged),pagesize=(W,H),leftMargin=38,rightMargin=38,topMargin=43,bottomMargin=43,title='GRIMOIRE 사람용 블루프린트',author='GRIMOIRE Project',pageCompression=1).build(story,onFirstPage=footer,onLaterPages=footer)
    p=PdfReader(staged);assert len(p.pages)>=45
    assert all(len(x.extract_text().strip())>35 for x in p.pages)
    staged.replace(OUT)
    receipt=dict(document_id='GRIMOIRE_HUMAN_BLUEPRINT_20260911',state='DESIGN_REVIEW',pages=len(p.pages),source_sha256=sha(SOURCE),rules_sha256=sha(RULES),research_sha256=sha(RESEARCH),generator_sha256=sha(Path(__file__)),pdf_sha256=sha(OUT),assets=metadata,render_review='PENDING',human_review='NOT_RUN',runtime='NOT_RUN')
    OUT.with_suffix('.manifest.json').write_text(json.dumps(receipt,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')
    print(json.dumps({k:v for k,v in receipt.items() if k!='assets'},ensure_ascii=False))

if __name__=='__main__':main()
