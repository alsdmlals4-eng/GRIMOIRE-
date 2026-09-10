"""Render the card-duel review owner; never reuse historical runtime captures."""
from pathlib import Path
import hashlib
import json
import re
from xml.sax.saxutils import escape

from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib import colors
from reportlab.lib.styles import ParagraphStyle
from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, PageBreak
from pypdf import PdfReader

ROOT = Path(__file__).resolve().parents[1]
SOURCE = ROOT / 'docs/superpowers/specs/2026-09-10-card-duel-blueprint.md'
OUTPUT = ROOT / 'output/pdf/GRIMOIRE_CARD_DUEL_BLUEPRINT_2026-09-10.pdf'


def main():
    source = SOURCE.read_text(encoding='utf-8').replace('\r\n', '\n')
    pages = source.split('<!-- page -->')
    assert len(pages) == 10
    assert 'DESIGN_REVIEW' in source and 'NOT_RUN' in source
    pdfmetrics.registerFont(TTFont('Korean', 'C:/Windows/Fonts/malgun.ttf'))
    pdfmetrics.registerFont(TTFont('KoreanBold', 'C:/Windows/Fonts/malgunbd.ttf'))
    body = ParagraphStyle('Body', fontName='Korean', fontSize=9, leading=14, spaceAfter=7, wordWrap='CJK', textColor=colors.HexColor('#26374a'))
    cell = ParagraphStyle('Cell', parent=body, fontSize=8, leading=12, spaceAfter=0)
    headings = {
        1: ParagraphStyle('H1', parent=body, fontName='KoreanBold', fontSize=19, leading=26, spaceAfter=17),
        2: ParagraphStyle('H2', parent=body, fontName='KoreanBold', fontSize=16, leading=22, spaceAfter=15),
        3: ParagraphStyle('H3', parent=body, fontName='KoreanBold', fontSize=11, leading=16, spaceBefore=8, spaceAfter=8),
    }
    def para(text, style=body):
        return Paragraph(escape(text).replace('`', ''), style)

    story = []
    width = A4[0] - 84
    for index, page in enumerate(pages):
        if index:
            story.append(PageBreak())
        lines = page.strip().splitlines()
        i = 0
        while i < len(lines):
            line = lines[i].strip()
            if not line:
                i += 1
                continue
            if line.startswith('|'):
                rows = []
                while i < len(lines) and lines[i].strip().startswith('|'):
                    raw = lines[i].strip().strip('|').split('|')
                    if not all(re.fullmatch(r'\s*:?-+:?\s*', c) for c in raw):
                        rows.append([para(c.strip(), cell) for c in raw])
                    i += 1
                n = len(rows[0])
                table = Table(rows, colWidths=[width/n]*n, repeatRows=1, hAlign='LEFT')
                table.setStyle(TableStyle([
                    ('BACKGROUND', (0,0), (-1,0), colors.HexColor('#e5edf1')),
                    ('VALIGN', (0,0), (-1,-1), 'TOP'),
                    ('BOX', (0,0), (-1,-1), .4, colors.HexColor('#acbac4')),
                    ('INNERGRID', (0,0), (-1,-1), .25, colors.HexColor('#cad4dc')),
                    ('LEFTPADDING', (0,0), (-1,-1), 6),
                    ('RIGHTPADDING', (0,0), (-1,-1), 6),
                    ('TOPPADDING', (0,0), (-1,-1), 6),
                    ('BOTTOMPADDING', (0,0), (-1,-1), 6),
                ]))
                story.extend([table, Spacer(1,10)])
                continue
            match = re.match(r'^(#{1,3}) (.*)', line)
            story.append(para(match[2], headings[len(match[1])]) if match else para(line))
            i += 1

    def footer(canvas, doc):
        canvas.saveState()
        canvas.setFont('Korean', 8)
        canvas.setFillColor(colors.HexColor('#6d7a86'))
        canvas.drawString(42, 24, 'GRIMOIRE / DESIGN REVIEW / 2026-09-10')
        canvas.drawRightString(A4[0]-42, 24, str(doc.page))
        canvas.restoreState()

    OUTPUT.parent.mkdir(parents=True, exist_ok=True)
    SimpleDocTemplate(str(OUTPUT), pagesize=A4, rightMargin=42, leftMargin=42, topMargin=38, bottomMargin=42).build(story, onFirstPage=footer, onLaterPages=footer)
    reader = PdfReader(OUTPUT)
    assert len(reader.pages) == 10, f'Unexpected pagination: {len(reader.pages)}'
    for number, page in enumerate(reader.pages, 1):
        text = page.extract_text()
        assert f'{number:02d}.' in text, f'Missing page heading: {number}'
    receipt = {
        'source': SOURCE.relative_to(ROOT).as_posix(),
        'source_sha256_utf8_lf': hashlib.sha256(source.encode()).hexdigest(),
        'pdf': OUTPUT.relative_to(ROOT).as_posix(),
        'pdf_sha256': hashlib.sha256(OUTPUT.read_bytes()).hexdigest(),
        'page_count': len(reader.pages),
        'content_state': 'DESIGN_REVIEW',
        'text_and_page_check': 'PASS',
        'visual_review': 'NOT_RUN',
        'runtime_human_device': 'NOT_RUN',
    }
    OUTPUT.with_suffix('.json').write_text(json.dumps(receipt, ensure_ascii=False, indent=2)+'\n', encoding='utf-8')
    print(json.dumps(receipt, ensure_ascii=False))


if __name__ == '__main__':
    main()
