"""Machine checks and contact sheets for rendered blueprint pages; no art generation."""
from pathlib import Path
import hashlib
import json
from PIL import Image, ImageOps, ImageDraw
from pypdf import PdfReader

ROOT = Path(__file__).resolve().parents[1]
pdf = ROOT / 'output/pdf/GRIMOIRE_HUMAN_BLUEPRINT_20260911.pdf'
manifest = json.loads(pdf.with_suffix('.manifest.json').read_text(encoding='utf-8'))
assert hashlib.sha256(pdf.read_bytes()).hexdigest() == manifest['pdf_sha256']
pages = PdfReader(pdf).pages
renders = sorted((ROOT / 'tmp/pdfs/grimoire-blueprint').glob('finalcheck-*.png'))
assert len(renders) == len(pages), (len(renders),len(pages))
for batch in range((len(pages)+11)//12):
    contact = Image.new('RGB',(1600,4*310),'#b9c0c4')
    for slot,path in enumerate(renders[batch*12:(batch+1)*12]):
        thumb=ImageOps.contain(Image.open(path).convert('RGB'),(525,280))
        x=(slot%3)*533;y=(slot//3)*310
        contact.paste(thumb,(x,y+22));ImageDraw.Draw(contact).text((x+8,y+5),path.stem,fill='black')
    contact.save(renders[0].parent/f'review-contact-{batch}.jpg',quality=92)
regions=json.loads((ROOT/'output/imagegen/blueprint-20260911/atlas-regions.json').read_text())
for sheet in regions['sheets']:
    width,height=Image.open(ROOT/'output/imagegen/blueprint-20260911'/sheet['file']).size
    assert [width,height]==sheet['size']
    assert sum(r['region'][2]*r['region'][3] for r in sheet['regions'])==width*height
    for r in sheet['regions']:
        x,y,w,h=r['region'];assert 0<=x<x+w<=width and 0<=y<y+h<=height
for asset in manifest['assets']:
    assert hashlib.sha256((ROOT/asset['path']).read_bytes()).hexdigest()==asset['sha256']
print(json.dumps({'pages':len(pages),'renders':len(renders),'asset_hashes':len(manifest['assets']),'atlas_regions':sum(len(s['regions']) for s in regions['sheets']),'empty_pages':sum(len(p.extract_text().strip())<35 for p in pages),'human':'NOT_RUN'},indent=2))
