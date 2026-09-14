"""Produce a private, source-bound monthly report, not a second game design canon.

Only original user message records are extracted from the explicitly supplied session.
Raw sessions, account details and payment files are never copied into the repository.
"""
import argparse
from collections import defaultdict
from datetime import datetime, timezone, timedelta
import hashlib
import json
from pathlib import Path
import subprocess
from xml.sax.saxutils import escape

from PIL import Image as PILImage
from pypdf import PdfReader
from reportlab.lib import colors
from reportlab.lib.pagesizes import A4
from reportlab.lib.styles import ParagraphStyle
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, PageBreak, Image, Table, TableStyle

ROOT = Path(__file__).resolve().parents[1]
KST = timezone(timedelta(hours=9))


def digest(path):
    return hashlib.file_digest(path.open('rb'), 'sha256').hexdigest()


def git(*args):
    return subprocess.check_output(['git', *args], cwd=ROOT).decode('utf-8').strip()


def collect(month, session):
    now = datetime.now(KST).isoformat(timespec='seconds')
    commits = []
    for line in git('log', '--reverse', '--format=%H%x1f%aI%x1f%cI%x1f%s').splitlines():
        sha, authored, committed, subject = line.split('\x1f', 3)
        day = datetime.fromisoformat(committed).astimezone(KST).date().isoformat()
        if day.startswith(month):
            commits.append(dict(sha=sha, authored_at=authored, committed_at=committed,
                                day=day, subject=subject))
    prompts = defaultdict(list)
    # Fixed complete-line byte offsets and per-record hashes survive append-only growth.
    limit = session.stat().st_size
    with session.open('rb') as handle:
        while handle.tell() < limit:
            offset = handle.tell()
            raw = handle.readline()
            if handle.tell() > limit or not raw.endswith(b'\n'):
                break
            if b'"user_message"' not in raw and b'"user"' not in raw:
                continue
            try:
                item = json.loads(raw)
                payload = item.get('payload', {})
                if item.get('type') == 'event_msg' and payload.get('type') == 'user_message':
                    message = payload.get('message', '')
                elif item.get('type') == 'response_item' and payload.get('role') == 'user':
                    message = '\n'.join(c.get('text', '') for c in payload.get('content', []) if c.get('type') == 'input_text')
                else:
                    continue
                stamp = datetime.fromisoformat(item['timestamp'].replace('Z', '+00:00')).astimezone(KST)
                if not stamp.isoformat().startswith(month) or not isinstance(message, str):
                    continue
                # Reject environment/context payloads and enormous attachment dumps.
                if any(marker in message for marker in ['<environment_context>', '<permissions', '<recommended_plugins>', '# AGENTS.md instructions']):
                    continue
                if len(message) > 2200:
                    message = message[:900] + '\n[긴 입력의 앞부분 발췌; 원문 전체는 원본 기록 참조]'
                prompts[stamp.date().isoformat()].append(dict(
                    timestamp=stamp.isoformat(), text=message, byte_offset=offset,
                    raw_record_sha256=hashlib.sha256(raw).hexdigest()))
            except (ValueError, KeyError, TypeError):
                continue
    images = []
    names = ['story-main-entry-20260913.png', 'story-illustrations-player-20260913.png',
             'story-conversation-20260913.png', 'w01-save-failure-20260914.png',
             'w02-export-continue-20260914.png', 'w02-recovery-20260914.png']
    for name in names:
        p = ROOT / 'artifacts/local-validation' / name
        if p.is_file():
            with PILImage.open(p) as img:
                size = list(img.size)
            images.append(dict(path=p.relative_to(ROOT).as_posix(), sha256=digest(p),
                               size=size, capture_at='UNVERIFIED',
                               collected_at=now, mtime_observation=datetime.fromtimestamp(p.stat().st_mtime, KST).isoformat()))
    return dict(schema='grimoire-ai-work-evidence-v1', month=month, prepared_at=now,
                branch=git('branch', '--show-current'), source_head=git('rev-parse', 'HEAD'),
                origin_main=git('rev-parse', 'origin/main'), session_source=str(session),
                session_byte_limit=limit, commits=commits, prompts=dict(prompts), images=images,
                source_context_sha256=digest(ROOT / 'docs/ACTIVE_CONTEXT.md'),
                verification='RETROSPECTIVE_SOURCE_READBACK_NOT_TEST_RERUN',
                account='UNVERIFIED', billing='NOT_REVIEWED_NOT_ALLOCATED', human_review='NOT_RUN')


DAY_SUMMARIES = {
    '10': ('카드·공통 주문 재기획', '결투 중심 카드 규칙과 사건에서도 사용하는 주문 조합의 연결을 구체화했다.',
           '기존 별형/그리기 체계와 새 카드 방향의 경계가 필요했다.',
           '규칙·연구 문서와 카드 결투 도메인 변경 기록. 구현·그림 최종 승인·플레이 검수는 별개다.'),
    '11': ('사람용 블루프린트와 인물 시안', '블루프린트 파생 PDF와 시각 후보를 제작하고 사용자 피드백에 따라 인물 표현을 변경했다.',
           '게임 전체 설명과 캐릭터의 학생다운 인상·그림체 일관성을 검토할 자료가 필요했다.',
           '여러 시안은 탐색/거절/선택이 섞여 있다. 생성된 모든 그림이 최종 승인 또는 런타임 적용된 것은 아니다.'),
    '12': ('공통 주문과 학교 사건 연결', '주문 조합, 장면 대상 평가, 원자적 사건 효과와 복구 가능한 진행을 연결했다.',
           '결투 밖 실습·온실·축제에서도 동일 주문을 사용할 실제 소비처가 필요했다.',
           '도메인/사건 실행 코드와 회귀 시험이 추가됐다. 기기·사용자 플레이 완료를 의미하지 않는다.'),
    '13': ('이야기 진입과 인물 대화', '메뉴에서 이야기로 진입하고 대사 단위 진행·인물 삽화·하단 대화창을 연결했다.',
           '시스템 상태 보고처럼 보이는 설명을 등장인물이 직접 말하는 화면으로 바꿀 필요가 있었다.',
           '교실은 승인된 합성 화면을 임시 사용한다. 독립 배경/인물/표정 레이어는 아직 남아 있다.'),
    '14': ('저장 복구·Windows 검증·대화 식별자', '저장 실패 후 진행 차단, 배포 저장 위치 분리, 고정 대사 ID와 실제 Windows 실행 검증을 진행했다.',
           '저장 실패 시 진행/비용의 불일치와 개발 도구 참조가 배포에 섞이는 문제가 있었다.',
           '현재 기록은 브랜치 증거다. 보호 main 병합·전체 게임 완성·모바일·출시 승인을 주장하지 않는다.'),
}


def build(data, output):
    pdfmetrics.registerFont(TTFont('EvidenceKR', 'C:/Windows/Fonts/malgun.ttf'))
    pdfmetrics.registerFont(TTFont('EvidenceKRB', 'C:/Windows/Fonts/malgunbd.ttf'))
    styles = {
        'body': ParagraphStyle('body', fontName='EvidenceKR', fontSize=10, leading=16, spaceAfter=8, wordWrap='CJK'),
        'small': ParagraphStyle('small', fontName='EvidenceKR', fontSize=8, leading=12, spaceAfter=5, wordWrap='CJK'),
        'h1': ParagraphStyle('h1', fontName='EvidenceKRB', fontSize=23, leading=31, spaceAfter=20, textColor=colors.HexColor('#173849')),
        'h2': ParagraphStyle('h2', fontName='EvidenceKRB', fontSize=14, leading=21, spaceAfter=12, textColor=colors.HexColor('#173849')),
    }
    story = []
    def p(text, style='body'):
        return Paragraph(escape(str(text)).replace('\n', '<br/>'), styles[style])
    def add(text, style='body'):
        story.append(p(text, style))
    def new(title):
        if story:
            story.append(PageBreak())
        add(title, 'h1')
    def table(rows, widths):
        t = Table([[p(c, 'small') for c in r] for r in rows], colWidths=widths, repeatRows=1, hAlign='LEFT')
        t.setStyle(TableStyle([('BACKGROUND', (0,0), (-1,0), colors.HexColor('#e9eff2')),
                              ('VALIGN',(0,0),(-1,-1),'TOP'), ('BOTTOMPADDING',(0,0),(-1,-1),7),
                              ('TOPPADDING',(0,0),(-1,-1),7), ('LINEBELOW',(0,0),(-1,-1),0.3,colors.HexColor('#bdc8ce'))]))
        story.append(t)
    month = data['month']
    new('GRIMOIRE\nAI 활용 작업일지·증빙집')
    add(f'{month} 월간 누적본 · v1.0', 'h2')
    add('세계를 다시 쓰는 법 | 개발 과정과 결과물의 원본 대조를 위한 보조 보고서')
    add('보고 범위: 현재 브랜치에서 확인한 9월 10~14일 변경 기록 및 선택된 원본 입력·결과 자료. 9월 전체 작업의 완전 목록이나 비용 인정 증명서는 아니다.')
    add(f"기록 작성·자료 수집: {data['prepared_at']} (KST)\nPDF 발행: {datetime.now(KST).isoformat(timespec='seconds')}")
    add('이전 작업은 사후 정리입니다. Git 시각은 변경 기록 시각이며 실제 AI 사용 시작·종료 시각과 같다고 단정하지 않습니다. 입력 시각은 원본 세션에 기록된 시각입니다. 캡처의 정확한 시각을 재확인하지 못한 이미지는 미확인으로 표시합니다.')
    add('이 PDF는 블루프린트나 협회 지정 정산 양식을 대체하지 않습니다. 메일·협약서 원문 검토, 계약 체결, 비용 적격성 또는 제출 완료를 주장하지 않습니다.')
    add(f"기준 브랜치: {data['branch']}\n기준 HEAD: {data['source_head']}\n관찰 origin/main: {data['origin_main']}", 'small')
    new('01  날짜별 작업 찾아보기')
    rows = [['작업일 범위 / ID', '내용', '근거와 상태']]
    days = sorted(set(c['day'] for c in data['commits']))
    for day in days:
        title, _, _, state = DAY_SUMMARIES.get(day[-2:], ('변경 기록', '', '', 'Git 기록 참조'))
        count = sum(c['day'] == day for c in data['commits'])
        rows.append([day + '\nGR-' + day.replace('-', ''), title, f'{count}개 커밋 / 사후 정리\n{state}'])
    table(rows, [102, 135, 270])
    add('상세 증빙은 다음 날짜별 제목/작업 ID로 찾을 수 있습니다. 원본 입력은 선택 발췌이며 전체 AI 활용량을 뜻하지 않습니다.', 'small')
    for day in days:
        title, work, before, status = DAY_SUMMARIES.get(day[-2:], ('변경 기록', '', '', ''))
        new(f'{day}\n{title}')
        add('작업 ID: GR-' + day.replace('-', '') + ' | 기록 방식: 사후 정리', 'small')
        add('작업 전 상태', 'h2'); add(before)
        add('이번 변경과 기대효과', 'h2'); add(work)
        add('실제 반영 및 검수 경계', 'h2'); add(status)
        selected = data['prompts'].get(day, [])
        # Prefer substantive messages, not only short approvals.
        substantive = [q for q in selected if 25 <= len(q['text']) <= 950]
        shown = (substantive or selected)[-2:]
        add('입력 증빙 · 원본 텍스트 발췌', 'h2')
        if not shown:
            add('이 수집 범위에서 해당 날짜의 입력 원문을 추출하지 못했습니다. 커밋만으로 AI 사용 또는 입력 내용을 확정하지 않습니다.')
        for q in shown:
            add(q['timestamp'] + ' | 원본 byte offset ' + str(q['byte_offset']), 'small')
            add(q['text'][:360] + ('\n[이 페이지에서는 이후 생략; 부속 원본 목록 참조]' if len(q['text']) > 360 else ''), 'small')
            add('원본 레코드 SHA-256: ' + q['raw_record_sha256'], 'small')
        add('위 내용은 실제 요청 화면의 스크린샷이 아니라 저장된 입력 원문의 발췌입니다. 원본 화면 제출이 요구되면 별도 캡처가 필요합니다.', 'small')
        new(day + ' · 반영 이력')
        for c in [c for c in data['commits'] if c['day'] == day]:
            link = 'https://github.com/alsdmlals4-eng/GRIMOIRE-/commit/' + c['sha']
            text = escape(c['committed_at'] + ' | ' + c['sha'][:12]) + '<br/>' + escape(c['subject'])
            story.append(Paragraph(text + f' · <link href="{link}" color="#245b75">변경 원문</link>', styles['small']))
        add('작성 시각과 커밋 시각은 별도 JSON 원본 목록에 모두 보존합니다. 커밋의 존재만으로 사용자 검수·최종 이미지 승인·출시를 증명하지 않습니다.', 'small')
    captions = {
        'story-main-entry-20260913.png': '이야기 진입 메뉴의 실행 결과. 블루프린트 시안이 아닌 로컬 검증 캡처.',
        'story-illustrations-player-20260913.png': '인물 삽화가 연결된 대화 화면. 당시 중간 구현이며 최신 최종 아트의 완성 증거가 아님.',
        'story-conversation-20260913.png': '대사 단위 대화 진행의 로컬 검증 화면.',
        'w01-save-failure-20260914.png': '저장 실패 시 진행을 막는 복구 경계의 화면 증거.',
        'w02-export-continue-20260914.png': 'Windows export 이어하기 화면. 모바일 기기 검증과 별개.',
        'w02-recovery-20260914.png': '손상 저장 후 정상 보관본 복구 안내. 모든 저장 장애를 검증한 것은 아님.',
    }
    for i in range(0, len(data['images']), 2):
        new('02  실제 결과 화면 · ' + str(i // 2 + 1))
        for im in data['images'][i:i+2]:
            path = ROOT / im['path']
            w, h = im['size']
            scale = min(507 / w, 240 / h)
            story.append(Image(str(path), width=w*scale, height=h*scale))
            add(captions[path.name], 'small')
            add(im['path'] + '\nSHA-256: ' + im['sha256'], 'small')
            add('정확한 캡처 시각: 미확인 | 파일명상 날짜는 단서이며 날짜 인증이 아님. 자료 수집일: ' + im['collected_at'], 'small')
    new('03  검수 결과와 남은 구현')
    add('기존 검증 기록을 재열람한 결과이며, 이 증빙집을 만들면서 아래 게임 시험을 다시 수행한 것은 아닙니다.')
    table([['증거층', '현재 확인 가능한 범위'],
           ['문서/변경 기록', '현재 계획·Active Context·Git 변경 내역 확인. 최신 main과 작업 브랜치는 다름.'],
           ['자동 시험 (과거 기록)', 'Active Context는 관련 Godot 21 runners, 1384 assertions, 0 failures를 기록. 이 발행 작업에서 재실행하지 않음.'],
           ['실행 (과거 기록)', 'Windows export write/read 프로세스와 실제 화면 기록. export 편집기 종료 시 45 ObjectDB/22 resource leak 관찰은 미해결.'],
           ['데이터 보존 제한', '수정 전 인물 테스트가 기본 개발 저장 위치에 쓸 수 있었음. 턴 시작 전 저장 원본 불변은 입증되지 않음. 시험 격리 후의 hash 불변과 구분.'],
           ['사용자/기기/출시', '전체 사용자 플레이, 모바일, 성능, 접근성, 최종 아트, 출시 승인: NOT_RUN 또는 별도 미완료.']], [108, 399])
    add('잔여 작업 순서', 'h2')
    add('W03 분리 이미지 → W04 공통 대화 무대 → W05 사건 화면 → W06 결투 가독성 → W07 서사/도감 → W08 접근성/설정 → W09 소리/모션 → W10 블루프린트 갱신 → W11 통합/기기/사람 검증 → W12 장기 확장.')
    add('책임 원본: docs/ACTIVE_CONTEXT.md 및 docs/superpowers/plans/2026-09-14-remaining-work-design-implementation.md', 'small')
    new('04  이번 운영 변경 · 9월 14일')
    add('크로마키 이미지 제작', 'h2')
    add('사용자 최신 지시에 따라 앞으로 이미지 모델로 단색 크로마키 배경 원본을 생성한 뒤 배경을 제거합니다. 인물·UI 등 분리 자산은 RGB 원본과 RGBA 결과를 함께 보존하고, 가장자리 색 번짐·반투명 픽셀·작은 장식 손실을 확인합니다. 색상은 캐릭터 의상·눈·소품과 겹치지 않도록 선택합니다.')
    add('기존 체크무늬 RGB 실패본은 실제 알파가 없으며, 새 방식의 성공본으로 간주하지 않습니다. 이번 PDF 발행은 새 캐릭터 이미지 생성·최종 승인·런타임 적용의 증거가 아닙니다.')
    add('월간 작업 증빙의 분리', 'h2')
    add('게임 기획은 기존 블루프린트/책임 원본에 유지하고, 본 보고서는 원본을 날짜별로 연결하는 파생 문서로 관리합니다. 공용 생성기는 저장소에, 개인 입력 발췌·자료 목록·PDF는 로컬 증빙 영역에 보관합니다. 외부 제출이나 메일 회신은 수행하지 않습니다.')
    add('기록/발행 시점: ' + data['prepared_at'])
    new('05  서비스·계정·결제 증빙 찾아보기')
    table([['항목', '확인 / 미확인 경계'],
           ['Codex', '본 프로젝트 작업에 사용된 도구. 원본 세션의 선택 입력 발췌와 Git 결과를 날짜별로 연결. 실제 계정 식별정보·과금 모델은 미확인.'],
           ['이미지 생성', '프로젝트 제작 기록에 이미지 도구 입력·결과가 남아 있음. 모델 버전이 반환되지 않은 결과는 미확인 유지. 본 발행 작업에서 새 이미지를 생성하지 않음.'],
           ['결제 자료', '지정 폴더에 9월 14일 초기화.pdf가 존재함을 확인. 내용·금액·계정·지원 대상 여부·프로젝트별 배분은 검토하지 않았음.'],
           ['지원사업 양식', '사용자가 제공한 구성 지침을 참고. 실제 메일·협약서·협회 지정 정산 양식은 이 작업에서 직접 확인하지 않음.'],
           ['제출 상태', '로컬 문서 작성. 협회 제출·회신·서명하지 않음.']], [112, 395])
    add('제출 전 보완 항목', 'h2')
    add('① 실제 사용 계정 식별정보를 안전하게 연결 ② 필요 시 원본 요청 화면 캡처 ③ 영수증/결제와 서비스 사용 기간 대조 ④ 공유 구독 비용의 중복 합산 방지 ⑤ 협회 지정 양식 및 비용 인정 범위 확인 ⑥ 개인정보를 가린 제출용 사본 검수.')
    add('금액을 추정하거나 확인되지 않은 계정·결제일을 채우지 않았습니다. 같은 영수증을 작업별 비용으로 반복 합산하지 않습니다.')
    new('06  원본 위치와 기록 신뢰도')
    add('원본 로그 (로컬, 개인정보 포함 가능)', 'h2')
    add(data['session_source'], 'small')
    add(f"읽기 기준 byte 상한: {data['session_byte_limit']}\n발췌마다 원본 레코드의 byte offset과 SHA-256을 기록했습니다. 이는 원본 대조용 무결성 정보이며 공인 시각 인증 또는 변조 불가능성을 뜻하지 않습니다.")
    add('게임 책임 원본과 그림 기록', 'h2')
    for path in ['docs/ACTIVE_CONTEXT.md', 'docs/superpowers/specs/2026-09-10-shared-spell-rules-design.md',
                 'docs/superpowers/specs/2026-09-11-human-blueprint.md',
                 'output/imagegen/dialogue-stage-20260913/PRODUCTION_RECORD.md']:
        add(path, 'small')
    add('Active Context 수집 시 SHA-256: ' + data['source_context_sha256'], 'small')
    add('보관 및 정정 원칙', 'h2')
    add('PDF와 같은 이름의 .sources.json은 입력 발췌·커밋 시각·캡처 해시를 보관하는 로컬 부속 목록입니다. .publication.json은 출력 해시와 발행 시각을 기록합니다. 개인정보 검토 전 공개 저장소에 올리지 않습니다. 원본은 제거하지 않으며, 제출 후 오류 발견 시 새 버전과 정정 사유를 남깁니다.')
    add('이 문서는 확인 가능한 기록을 읽기 쉽게 묶은 보고서입니다. AI 사용량·지원금 정산·날짜의 법적 증명·게임 전체 완료에 대한 인증서가 아닙니다.')

    def footer(canvas, doc):
        canvas.setFont('EvidenceKR', 8)
        canvas.setFillColor(colors.HexColor('#667780'))
        canvas.drawString(44, 25, f'GRIMOIRE | {month} AI 활용 작업일지·증빙집 | 사후 정리 포함')
        canvas.drawRightString(A4[0]-44, 25, str(doc.page))
    SimpleDocTemplate(str(output), pagesize=A4, rightMargin=44, leftMargin=44,
                      topMargin=42, bottomMargin=42, title=f'GRIMOIRE {month} AI 활용 작업일지·증빙집',
                      author='GRIMOIRE development work records').build(story, onFirstPage=footer, onLaterPages=footer)
    reader = PdfReader(output)
    for page in reader.pages:
        if len((page.extract_text() or '').strip()) < 40:
            raise RuntimeError('Blank/near-empty PDF page detected')
    return len(reader.pages)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--month', required=True)
    parser.add_argument('--session', type=Path, required=True)
    parser.add_argument('--output', type=Path, required=True)
    args = parser.parse_args()
    if args.output.exists():
        raise SystemExit('Refusing to overwrite an issued PDF; choose a new version.')
    args.output.parent.mkdir(parents=True, exist_ok=True)
    data = collect(args.month, args.session)
    source = args.output.with_suffix('.sources.json')
    publication = args.output.with_suffix('.publication.json')
    if source.exists() or publication.exists():
        raise SystemExit('Existing evidence sidecar; choose a new version.')
    source.write_text(json.dumps(data, ensure_ascii=False, indent=2), encoding='utf-8')
    pages = build(data, args.output)
    publication.write_text(json.dumps(dict(pdf_sha256=digest(args.output), source_sha256=digest(source),
        generator_sha256=digest(Path(__file__)), pages=pages, issued_at=datetime.now(KST).isoformat(),
        text_check='PASS', visual_review='PENDING', human_review='NOT_RUN'), indent=2), encoding='utf-8')
    print(json.dumps(dict(output=str(args.output), pages=pages, commits=len(data['commits']),
                          prompt_days=list(data['prompts']), images=len(data['images'])), ensure_ascii=False))


if __name__ == '__main__':
    main()
