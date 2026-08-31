from pathlib import Path
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import A4, landscape
from reportlab.pdfbase import pdfmetrics
from reportlab.pdfbase.ttfonts import TTFont
from reportlab.lib.utils import ImageReader
from reportlab.pdfbase.pdfmetrics import stringWidth


ROOT = Path(r"C:\Users\user\Documents\GitHub\Ninza\GRIMOIRE-")
OUT = ROOT / "output" / "pdf" / "grimoire_HUMAN_GAME_BLUEPRINT_20260830.pdf"
FONT = Path(r"C:\Windows\Fonts\NotoSansKR-VF.ttf")
VISUAL = ROOT / "assets" / "reference" / "visual" / "GRIMOIRE_visual_direction_approved_2026-08-25.png"
GREENHOUSE = ROOT / "assets" / "art" / "backgrounds" / "greenhouse" / "bg_greenhouse_field_base.webp"
HUB = ROOT / "assets" / "reference" / "visual" / "GRIMOIRE_academy_hub_magic_writing_planning_reference_2026-08-30.png"
CLASS = ROOT / "assets" / "reference" / "visual" / "GRIMOIRE_class_direct_glyph_learning_planning_reference_2026-08-30.png"
PRACTICUM = ROOT / "assets" / "reference" / "visual" / "GRIMOIRE_first_guided_greenhouse_practicum_planning_reference_2026-08-30.png"
BATTLE = ROOT / "assets" / "reference" / "visual" / "GRIMOIRE_protective_battle_practicum_planning_reference_2026-08-30.png"
FESTIVAL = ROOT / "assets" / "reference" / "visual" / "GRIMOIRE_festival_light_thread_canopy_planning_reference_2026-08-30.png"

W, H = landscape(A4)
M = 38

NAVY = "#111B38"
NAVY_2 = "#1B2A50"
CREAM = "#F7F1E5"
INK = "#17213B"
GOLD = "#D9AF63"
GOLD_LIGHT = "#F0D89B"
BLUE = "#91B4EA"
BLUE_DARK = "#496C9C"
GREEN = "#76BFA8"
RED = "#D87878"
SLATE = "#54607A"
PALE_BLUE = "#E6EEFB"
PALE_GREEN = "#E6F3ED"
PALE_GOLD = "#FCF2D9"


def col(c, value):
    c.setFillColor(value)


def stroke(c, value):
    c.setStrokeColor(value)


def wrap(text, font, size, width):
    words = list(text) if " " not in text else text.split(" ")
    lines, current = [], ""
    for word in words:
        joiner = "" if (not current or " " not in text) else " "
        trial = current + joiner + word
        if current and stringWidth(trial, font, size) > width:
            lines.append(current)
            current = word
        else:
            current = trial
    if current:
        lines.append(current)
    return lines


def text(c, x, y, value, size=12, color=INK, font="Noto", width=None, leading=None, max_lines=None):
    c.setFont(font, size)
    col(c, color)
    if width is None:
        c.drawString(x, y, value)
        return y - size
    leading = leading or size * 1.48
    lines = wrap(value, font, size, width)
    if max_lines:
        lines = lines[:max_lines]
    for line in lines:
        c.drawString(x, y, line)
        y -= leading
    return y


def pill(c, x, y, label, kind="plan"):
    colors = {
        "plan": (PALE_GOLD, INK),
        "base": (PALE_BLUE, BLUE_DARK),
        "intent": ("#EEEAF9", "#5C4A88"),
        "review": ("#FBE8E6", "#A44B4B"),
        "visual": (PALE_GREEN, "#377D67"),
    }
    fill, ink = colors[kind]
    c.setFont("Noto", 8.5)
    w = stringWidth(label, "Noto", 8.5) + 16
    col(c, fill)
    c.roundRect(x, y - 15, w, 17, 8, fill=1, stroke=0)
    col(c, ink)
    c.drawCentredString(x + w / 2, y - 10.5, label)
    return w


def rect(c, x, y, w, h, fill, radius=14, border=None):
    col(c, fill)
    if border:
        stroke(c, border)
        c.setLineWidth(0.8)
        c.roundRect(x, y, w, h, radius, fill=1, stroke=1)
    else:
        c.roundRect(x, y, w, h, radius, fill=1, stroke=0)


def frame(c, x, y, w, h, border="#DFE4ED", radius=14):
    stroke(c, border)
    c.setLineWidth(0.8)
    c.roundRect(x, y, w, h, radius, fill=0, stroke=1)


def card(c, x, y, w, h, title, body, accent=GOLD, body_size=10.2, badge=None, badge_kind="plan"):
    rect(c, x, y, w, h, "#FFFFFF", 14, "#DFE4ED")
    col(c, accent)
    c.roundRect(x, y + h - 5, w, 5, 3, fill=1, stroke=0)
    text(c, x + 16, y + h - 25, title, 12.5, INK, "Noto", w - 32, 16, 2)
    if badge:
        pill(c, x + 16, y + h - 54, badge, badge_kind)
        body_y = y + h - 78
    else:
        body_y = y + h - 54
    text(c, x + 16, body_y, body, body_size, SLATE, "Noto", w - 32, body_size * 1.42, 5)


def line(c, x1, y1, x2, y2, color=BLUE_DARK, width=1.5, arrow=True):
    stroke(c, color)
    c.setLineWidth(width)
    c.line(x1, y1, x2, y2)
    if arrow:
        from math import atan2, cos, sin
        angle = atan2(y2 - y1, x2 - x1)
        ah = 7
        for d in (2.6, -2.6):
            c.line(x2, y2, x2 - ah * cos(angle + d), y2 - ah * sin(angle + d))


def section(c, number, part, title, question, status=None, status_kind="plan"):
    col(c, CREAM)
    c.rect(0, 0, W, H, fill=1, stroke=0)
    col(c, NAVY)
    c.rect(0, H - 78, W, 78, fill=1, stroke=0)
    text(c, M, H - 30, f"GRIMOIRE  |  {part}", 9.3, GOLD_LIGHT)
    text(c, M, H - 58, title, 22, "#FFFFFF", "Noto")
    if status:
        pill(c, W - M - 118, H - 32, status, status_kind)
    text(c, M, H - 101, question, 15, NAVY, "Noto", W - 2 * M, 22, 2)
    c.setFont("Noto", 8.5)
    col(c, SLATE)
    c.drawString(M, 19, "GRIMOIRE-HGB-20260830-01  |  R1  |  사용자 최종 검수 대기")
    c.drawRightString(W - M, 19, f"{number:02d} / 28")


def image_cover(c, path, x, y, w, h, alpha=1.0):
    if path.exists():
        c.saveState()
        c.setFillAlpha(alpha)
        c.drawImage(ImageReader(str(path)), x, y, w, h, preserveAspectRatio=True, anchor='c', mask='auto')
        c.restoreState()


def cover(c):
    col(c, NAVY)
    c.rect(0, 0, W, H, fill=1, stroke=0)
    image_cover(c, HUB, 0, 0, W, H, 0.33)
    col(c, "#0B1330")
    c.setFillAlpha(0.68)
    c.rect(0, 0, W, H, fill=1, stroke=0)
    c.setFillAlpha(1)
    pill(c, M, H - 48, "사용자 최종 검수 대기", "review")
    text(c, M, H - 136, "GRIMOIRE", 15, GOLD_LIGHT)
    text(c, M, H - 196, "세계를 다시 쓰는 법", 33, "#FFFFFF")
    text(c, M, H - 234, "Human Game Blueprint", 16, BLUE)
    text(c, M, H - 290, "수업에서 배운 글자를 직접 써서,", 18, "#FFFFFF")
    text(c, M, H - 320, "축제와 현장의 문제를 책임 있게 바꾸는 마법학교 성장 경험", 18, "#FFFFFF")
    rect(c, M, 84, W - 2 * M, 112, "#162447", 18)
    text(c, M + 22, 166, "장기 검수 범위", 11, GOLD_LIGHT)
    text(c, M + 22, 136, "수업  →  지도 실습  →  선택형 실전  →  축제의 통제 응용", 16, "#FFFFFF")
    text(c, M + 22, 108, "→  후속 현장 책임  →  마도서 복기  →  첫 세계 개정", 16, "#FFFFFF")
    text(c, M, 40, "R1 · 2026.08.30 · 사람이 이해하고 결정하기 위한 파생 검수본", 9.5, BLUE)


def page2(c):
    section(c, 2, "PART 1  약속과 전체 여정", "한 페이지 비전", "나는 이 학교에서 어떤 마법사가 되는가?", "기획 확인")
    card(c, M, 335, 242, 104, "플레이어 판타지", "관찰한 근거를 바탕으로 직접 글자를 쓰고 주문을 설계해, 현장 문제의 규칙을 책임 있게 바꾸는 학생.", GOLD)
    card(c, M + 258, 335, 242, 104, "반복 판단", "지금 무엇을 먼저 지킬까? 이 주문이 남길 비용과 미확인은 무엇일까?", BLUE)
    card(c, M + 516, 335, 250, 104, "기억할 결과", "안전한 예시를 따라 하던 학생이 자기 원리를 쓰고, 작은 세계 개정을 책임지는 순간.", GREEN)
    text(c, M, 285, "이 게임의 핵심 동사", 15, NAVY)
    verbs = [("관찰", "사실과 미확인을 나눈다"), ("작성", "글자의 의미를 직접 쓴다"), ("예측", "Preview로 비용과 위험을 읽는다"), ("선택", "보존 가치와 대상을 고른다"), ("복기", "결과를 다음 원리로 바꾼다")]
    for i, (name, sub) in enumerate(verbs):
        x = M + i * 154
        rect(c, x, 173, 140, 77, "#FFFFFF", 12, "#DFE4ED")
        col(c, GOLD if i % 2 == 0 else BLUE)
        c.circle(x + 25, 213, 12, fill=1, stroke=0)
        text(c, x + 46, 217, name, 12, NAVY)
        text(c, x + 16, 191, sub, 9.2, SLATE, "Noto", 108, 13, 2)
    rect(c, M, 77, W - 2 * M, 60, "#FBE8E6", 12)
    text(c, M + 18, 113, "이 게임이 아닌 것", 11, "#A44B4B")
    text(c, M + 18, 89, "정답 조합 암기 · 자동 표적/시전 · 전투 파밍 · 시험 점수 최적화", 14, INK)


def page3(c):
    section(c, 3, "PART 1  약속과 전체 여정", "포지셔닝", "익숙한 마법학교 경험과 GRIMOIRE만의 차이는 무엇인가?", "기획 확인")
    image_cover(c, VISUAL, M, 118, 310, 300, 1)
    frame(c, M, 118, 310, 300)
    text(c, M + 16, 98, "시각 참고 · 실제 게임 자산이나 런타임 화면 아님", 8.5, "#377D67")
    card(c, 375, 282, 190, 136, "익숙한 출발", "수업에서 새 마법을 배우고, 동료·교수·학교 공간 속에서 실전으로 옮긴다.", GOLD, 10.4)
    card(c, 580, 282, 224, 136, "GRIMOIRE의 차이", "글자 의미를 직접 쓰고, 문맥과 보존 가치를 근거로 주문을 설계한다.", BLUE, 10.4)
    card(c, 375, 118, 190, 136, "평가의 차이", "점수와 처치 속도보다, 무엇을 지키고 무엇이 남았는지의 기록이 쌓인다.", GREEN, 10.4)
    card(c, 580, 118, 224, 136, "정답의 차이", "교수의 예시는 안전한 선례다. 모든 장소의 유일한 답은 아니다.", "#A887D0", 10.4)


def page4(c):
    section(c, 4, "PART 1  약속과 전체 여정", "1년의 감정 곡선", "한 해가 끝날 때 플레이어는 무엇이 달라져야 하는가?", "기획 확인")
    stages = [
        ("1", "정답을 배운다", "안전한 선례를 직접 써 본다", GOLD),
        ("2", "문맥을 읽는다", "같은 문제도 다른 원리와 가치로 본다", BLUE),
        ("3", "결과를 책임진다", "실패와 부작용까지 기록해 재설계한다", GREEN),
        ("4", "첫 원리를 쓴다", "누적 근거로 작은 세계 개정을 선택한다", "#A887D0"),
    ]
    for i, (n, title, body, accent) in enumerate(stages):
        x = M + i * 195
        rect(c, x, 200, 172, 190, "#FFFFFF", 18, "#DFE4ED")
        col(c, accent)
        c.circle(x + 34, 346, 20, fill=1, stroke=0)
        text(c, x + 28, 340, n, 13, "#FFFFFF")
        text(c, x + 20, 300, title, 15, NAVY, "Noto", 130, 20, 2)
        text(c, x + 20, 255, body, 10.3, SLATE, "Noto", 132, 15, 4)
        if i < 3:
            line(c, x + 175, 294, x + 187, 294, accent, 2.3)
    text(c, M, 145, "핵심 전환", 12, NAVY)
    rect(c, M, 77, W - 2*M, 50, NAVY_2, 12)
    text(c, M + 18, 104, "정답 복제  →  상황 해석  →  복수 원리 비교  →  결과 복기  →  책임 있는 첫 개정", 14, "#FFFFFF")


def page5(c):
    section(c, 5, "PART 1  약속과 전체 여정", "1학년 7 Chapter 지도", "수업, 실습, 전투, 축제는 한 해에서 어디에 놓이는가?", "기획 확인")
    terms = [("1학기", "정답을 배우는 학생", 2, GOLD), ("2학기", "같은 문제를 다르게 보는 학생", 2, BLUE), ("3학기", "결과에 책임지는 학생", 3, GREEN)]
    chapters = [
        ("C1", "정답의 모양", "수업과 온실 지도 실습"),
        ("C2", "교실 밖의 변수", "준비와 첫 자유일정"),
        ("C3", "같은 사건, 다른 원리", "복수 원리 비교"),
        ("C4", "축제의 세 해법", "통제 응용과 재설계"),
        ("C5", "실패도 기록이 된다", "연구와 회복"),
        ("C6", "학교의 규칙이 통하지 않는 곳", "후속 현장 책임"),
        ("C7", "내가 쓴 첫 번째 원리", "마도서와 첫 개정"),
    ]
    chapter_w = 90
    chapter_gap = 8
    term_gap = 18
    x = M
    idx = 0
    for label, sub, count, accent in terms:
        total_w = count * chapter_w + (count - 1) * chapter_gap
        rect(c, x, 380, total_w, 38, accent, 10)
        text(c, x + 12, 404, label, 11, "#FFFFFF")
        text(c, x + 60, 404, sub, 9.2, "#FFFFFF")
        for _ in range(count):
            code, title, body = chapters[idx]
            rect(c, x, 190, chapter_w, 168, "#FFFFFF", 13, "#DFE4ED")
            col(c, accent)
            c.rect(x, 325, chapter_w, 33, fill=1, stroke=0)
            text(c, x + 12, 339, code, 10, "#FFFFFF")
            text(c, x + 12, 296, title, 10.2, NAVY, "Noto", chapter_w - 24, 14, 4)
            text(c, x + 12, 230, body, 8.6, SLATE, "Noto", chapter_w - 24, 12, 5)
            x += chapter_w + chapter_gap
            idx += 1
        x += term_gap - chapter_gap
    rect(c, M, 92, W - 2*M, 62, "#FFFFFF", 12, "#DFE4ED")
    text(c, M + 18, 127, "읽는 법", 11, NAVY)
    text(c, M + 18, 102, "온실/묘목은 C1 수업 직후의 첫 지도 실습 사건이다. C1-C4의 수업·실습·축제와 C5-C7의 연구·후속 현장·복기가 전체를 함께 완성한다.", 10.8, SLATE, "Noto", W - 2*M - 35, 15, 3)


def page6(c):
    section(c, 6, "PART 1  약속과 전체 여정", "Chapter의 다섯 기능", "모든 Chapter가 반복해서 제공해야 하는 경험은 무엇인가?", "기획 확인")
    items = [
        ("발견·학습", "새 글자 원리와 오류를 관찰하고 가볍게 작성한다.", GOLD),
        ("선택·준비", "휴식, 준비, 교류, 선택형 실습 중 현재 태도를 고른다.", BLUE),
        ("통제 응용", "축제·일상·공동연구처럼 낮은 위험에서 원리를 써 본다.", GREEN),
        ("실전·책임", "현장 사건에서 생명·시설·정령과 결과의 대가를 판단한다.", "#A887D0"),
        ("복기·다음 질문", "마도서와 피드백으로 결과를 설명하고 다음 질문을 연다.", RED),
    ]
    y = 300
    for i, (title, body, accent) in enumerate(items):
        x = M + (i % 3) * 258
        if i == 3: x = M + 130
        if i == 4: x = M + 390
        yy = y if i < 3 else 160
        card(c, x, yy, 238, 135, title, body, accent, 10.2)
        if i < 4:
            pass
    line(c, 156, 347, 286, 347, GOLD, 2.0)
    line(c, 414, 347, 544, 347, BLUE, 2.0)
    line(c, 670, 330, 542, 231, GREEN, 2.0)
    line(c, 368, 231, 250, 231, "#A887D0", 2.0)
    text(c, M, 91, "고정할 것은 기능이다. 장면의 순서와 비중은 Chapter마다 달라져 같은 수업-전투 공식으로 굳지 않는다.", 11.5, NAVY, "Noto", W - 2*M, 17, 2)


def page7(c):
    section(c, 7, "PART 1  약속과 전체 여정", "전체 플레이 흐름", "플레이어는 어떤 화면을 지나 무엇을 남기는가?", "구현 기준선", "base")
    nodes = [
        ("수업/관찰", "새 원리와 현재 질문", GOLD),
        ("주문 만들기", "글자 → 회로 → 완성 주문", BLUE),
        ("실습/현장", "문맥과 보존 대상", GREEN),
        ("주문 쓰기", "대상 → final Preview → 시전", "#A887D0"),
        ("결과/마도서", "개선·비용·미확인 기록", RED),
    ]
    x = M
    for i, (title, body, accent) in enumerate(nodes):
        rect(c, x, 235, 132, 144, "#FFFFFF", 14, "#DFE4ED")
        col(c, accent)
        c.rect(x, 346, 132, 33, fill=1, stroke=0)
        text(c, x + 12, 359, f"{i+1:02d}", 9, "#FFFFFF")
        text(c, x + 12, 318, title, 12, NAVY, "Noto", 108, 17, 2)
        text(c, x + 12, 268, body, 9.2, SLATE, "Noto", 106, 13, 4)
        if i < 4:
            line(c, x + 138, 307, x + 155, 307, accent, 2)
        x += 155
    rect(c, M, 112, W - 2*M, 68, NAVY_2, 13)
    text(c, M + 18, 151, "현재 구현 기준선", 11, GOLD_LIGHT)
    text(c, M + 18, 126, "글자 → 주문 → 대상 → 시전 → W6 result receipt는 현재 main에 기반이 있다. 수업/축제/전투 scene의 사람용 완성 경험은 아직 검수 전이다.", 10.7, "#FFFFFF", "Noto", W - 2*M - 32, 15, 3)


def page8(c):
    section(c, 8, "PART 1  약속과 전체 여정", "성공·실패·복구의 목적지", "어떤 결과가 나오든 플레이는 어디로 이어지는가?", "기획 확인")
    rect(c, 64, 292, 190, 80, "#FFFFFF", 14, "#DFE4ED")
    text(c, 82, 340, "현장/응용 결과", 14, NAVY)
    text(c, 82, 314, "실제 변화와 남은 상태를 읽는다", 9.5, SLATE)
    outcomes = [
        ("성공", "보존한 가치와 다음 응용", GREEN, 378),
        ("부분성공", "개선 + 비용/미확인", GOLD, 253),
        ("실패", "원인 + 회복/다른 접근", RED, 128),
    ]
    for label, body, accent, y in outcomes:
        line(c, 254, 332, 353, y + 37, accent, 2.0)
        rect(c, 360, y, 190, 75, "#FFFFFF", 14, "#DFE4ED")
        col(c, accent)
        c.rect(360, y + 60, 190, 15, fill=1, stroke=0)
        text(c, 376, y + 43, label, 13, NAVY)
        text(c, 376, y + 21, body, 9.4, SLATE)
        line(c, 553, y + 37, 617, 266, accent, 1.8)
    rect(c, 624, 225, 176, 82, NAVY_2, 14)
    text(c, 642, 273, "마도서 복기", 13, "#FFFFFF")
    text(c, 642, 247, "결과를 삭제하지 않고, 다음 판단의 근거로", 9.3, BLUE, "Noto", 140, 13, 3)
    rect(c, 624, 92, 176, 82, "#FFFFFF", 14, "#DFE4ED")
    text(c, 642, 140, "다음 Chapter", 13, NAVY)
    text(c, 642, 115, "회복 · 재설계 · 새로운 열린 질문", 9.3, SLATE, "Noto", 140, 13, 3)
    line(c, 712, 225, 712, 177, BLUE, 2)
    text(c, M, 54, "단일 실패는 진행을 막지 않는다. 결과의 의미를 지우지 않고, 다음 선택과 포트폴리오의 설명 가능한 근거로 남긴다.", 11, NAVY)


def page9(c):
    section(c, 9, "PART 2  수업과 첫 지도 실습", "수업의 역할", "수업은 무엇을 가르치고, 무엇을 정답으로 강요하지 않는가?", "기획 확인")
    card(c, M, 300, 240, 142, "수업에서 배우는 것", "FLOW 같은 글자의 의미, 공통 보조 문법, 관찰할 질문, 짧은 직접 작성.", GOLD, 10.5)
    card(c, 300, 300, 240, 142, "수업에서 하지 않는 것", "교수의 예시를 모든 문맥의 유일 해법으로 외우게 하거나, 긴 설명만 듣게 하지 않는다.", RED, 10.5)
    card(c, 562, 300, 242, 142, "수업의 출구", "배운 의미를 곧바로 실습 환경에서 시험해 보고, 선택 이유를 자기 말로 설명하게 한다.", BLUE, 10.5)
    rect(c, M, 136, W - 2*M, 115, "#FFFFFF", 14, "#DFE4ED")
    text(c, M + 20, 215, "첫 5분의 학습 계약", 15, NAVY)
    text(c, M + 20, 182, "1. 글자의 의미를 관찰한다    2. 짧게 직접 쓴다    3. 안전 예시가 왜 가능한지 이해한다", 12, SLATE)
    text(c, M + 20, 155, "다음 장면에서 예시를 그대로 복제하는 대신, 새 문맥에 맞게 어떤 의미를 쓸지 판단한다.", 11, BLUE_DARK)


def page10(c):
    section(c, 10, "PART 2  수업과 첫 지도 실습", "주문 만들기", "플레이어는 직접 쓴 글자를 어떻게 하나의 주문으로 바꾸는가?", "구현 기준선", "base")
    steps = [("글자", "의미를 직접 쓴다", GOLD), ("주문", "FIVE_POINT_STAR 회로를 조합한다", BLUE), ("완성 주문", "이름과 Preview를 확인한다", GREEN)]
    for i, (title, body, accent) in enumerate(steps):
        x = 86 + i * 230
        rect(c, x, 250, 190, 150, "#FFFFFF", 16, "#DFE4ED")
        col(c, accent)
        c.circle(x + 36, 356, 21, fill=1, stroke=0)
        text(c, x + 29, 350, str(i + 1), 13, "#FFFFFF")
        text(c, x + 18, 312, title, 15, NAVY)
        text(c, x + 18, 275, body, 10.2, SLATE, "Noto", 150, 15, 3)
        if i < 2: line(c, x + 194, 324, x + 219, 324, accent, 2.4)
    rect(c, M, 110, W - 2*M, 87, "#F1F6FF", 13)
    text(c, M + 18, 166, "사람에게 먼저 보이는 말", 11, BLUE_DARK)
    text(c, M + 18, 139, "글자  →  주문  →  대상  →  시전", 17, NAVY)
    text(c, 433, 139, "내부 구현 용어는 정확성을 위해 남아도, 첫 설명의 주인공이 되지 않는다.", 10.2, SLATE, "Noto", 335, 14, 3)


def page11(c):
    section(c, 11, "PART 2  수업과 첫 지도 실습", "첫 지도 실습", "배운 글자의 의미가 어떻게 실제 환경 행동으로 전이되는가?", "기획 확인")
    rect(c, M, 305, W - 2*M, 96, NAVY_2, 16)
    text(c, M + 24, 359, "수업 5분", 17, GOLD_LIGHT)
    text(c, M + 155, 359, "→", 17, "#FFFFFF")
    text(c, M + 188, 359, "지도 실습 5분", 17, BLUE)
    text(c, M + 387, 359, "→", 17, "#FFFFFF")
    text(c, M + 420, 359, "첫 환경 반응", 17, GREEN)
    text(c, M + 24, 331, "설명만 듣지 않고, 처음 배운 의미를 문맥 속에서 한 번 실제로 사용한다.", 10.7, "#FFFFFF")
    items = [
        ("두 사실 관찰", "환경에서 확인 가능한 사실을 읽는다."),
        ("문맥 표식", "이번 실습의 bounded 목적을 정한다."),
        ("작은 회로", "Main 1 + 보조 1로 Preview를 본다."),
        ("명시 시전", "실습 대상에 직접 사용한다."),
        ("짧은 복기", "선택이 남긴 차이를 한 줄로 읽는다."),
    ]
    for i, (title, body) in enumerate(items):
        x = M + i * 154
        rect(c, x, 147, 140, 115, "#FFFFFF", 12, "#DFE4ED")
        text(c, x + 13, 231, f"{i+1:02d}", 9, GOLD if i % 2 == 0 else BLUE_DARK)
        text(c, x + 13, 207, title, 11.5, NAVY, "Noto", 108, 15, 2)
        text(c, x + 13, 169, body, 8.8, SLATE, "Noto", 108, 12, 3)


def page12(c):
    section(c, 12, "PART 2  수업과 첫 지도 실습", "첫 실습의 판단", "같은 실습에서 FOCUS와 DISPERSE는 무엇을 다르게 남기는가?", "기획 확인")
    card(c, M, 234, 310, 180, "FOCUS", "더 좁은 대상에 정확하게 흐름을 바꾼다. 주변의 압력이나 문제는 더 남을 수 있다.", GOLD, 11.2)
    card(c, 494, 234, 310, 180, "DISPERSE", "넓은 영역의 국소 압력을 낮춘다. 특정 목표에 전달되는 효과는 약해질 수 있다.", BLUE, 11.2)
    line(c, 348, 324, 472, 324, NAVY_2, 2.2, False)
    text(c, 374, 339, "Preview", 11, NAVY)
    rect(c, M, 103, W - 2*M, 82, "#FBE8E6", 14)
    text(c, M + 19, 151, "보호 규칙", 11, "#A44B4B")
    text(c, M + 19, 124, "어느 쪽도 UI에서 정답으로 표시하지 않는다. 선택은 보호 대상과 남는 문제의 형태를 바꾸며, 결과로 설명된다.", 11.2, INK, "Noto", W - 2*M - 35, 16, 3)


def page13(c):
    section(c, 13, "PART 2  수업과 첫 지도 실습", "온실은 첫 지도 실습 사건", "온실과 묘목은 왜 전체 게임이 아니라 첫 실습에서 만나야 하는가?", "설계 의도", "intent")
    image_cover(c, GREENHOUSE, M, 135, 360, 285, 1)
    frame(c, M, 135, 360, 285)
    text(c, M + 16, 110, "시각 참고 · 현행 온실 배경. 첫 지도 실습의 실제 플레이 장면은 아직 구현 전", 8.5, BLUE_DARK)
    card(c, 437, 285, 367, 135, "수업 직후의 10분", "수업 5분 뒤, 교내 온실에서 5분간 지도 실습을 한다. 목적은 새 글자의 의미를 안전한 작은 문맥에 전이하는 것이다.", GOLD, 10.5)
    card(c, 437, 135, 367, 125, "전체 게임 안의 위치", "묘목과 구조는 첫 판단을 구체화하는 작은 보존 가치다. 이후에는 축제, 전투, 연구, 더 큰 현장 책임으로 경험이 넓어진다.", GREEN, 10.5)


def page14(c):
    section(c, 14, "PART 2  수업과 첫 지도 실습", "자유일정의 선택", "문제를 풀기 전, 플레이어는 무엇을 준비하거나 포기하는가?", "기획 확인")
    options = [("휴식", "상태 회복과 작성 피로 완화", GREEN), ("준비", "조건 관찰과 도구/전략 정리", GOLD), ("교류", "다른 관점과 공동 행동", BLUE), ("선택형 실습", "통제된 전투·실전 응용·기록", "#A887D0")]
    for i, (title, body, accent) in enumerate(options):
        x = M + i * 193
        rect(c, x, 235, 177, 158, "#FFFFFF", 15, "#DFE4ED")
        col(c, accent)
        c.rect(x, 361, 177, 32, fill=1, stroke=0)
        text(c, x + 16, 373, title, 12, "#FFFFFF")
        text(c, x + 16, 315, body, 10.5, SLATE, "Noto", 145, 15, 4)
    rect(c, M, 106, W - 2*M, 77, "#FFFFFF", 14, "#DFE4ED")
    text(c, M + 19, 151, "선택의 경계", 11, NAVY)
    text(c, M + 19, 125, "한 창에는 중심 행동 하나만 고른다. 어느 선택도 필수 정보, 유일 해법, 영구 우월 성장 루트를 독점하지 않는다.", 11, SLATE, "Noto", W - 2*M - 36, 15, 3)


def page15(c):
    section(c, 15, "PART 3  응용, 전투, 축제", "실습과 전투의 차이", "둘 다 주문을 쓰지만, 어떤 책임이 달라지는가?", "기획 확인")
    rect(c, M, 165, 352, 248, "#FFFFFF", 16, "#DFE4ED")
    rect(c, 452, 165, 352, 248, "#FFFFFF", 16, "#DFE4ED")
    text(c, M + 22, 377, "지도/선택형 실습", 16, NAVY)
    text(c, 474, 377, "전투와 메인 현장", 16, NAVY)
    left = ["학습 전이와 안전한 연습", "낮거나 통제된 위험", "안전 Anchor 재시도 가능", "관찰·준비·보조 기록"]
    right = ["생명·시설·정령에 남는 결과", "실제 위험과 보존 우선순위", "부분성공·손실·발견 기록", "다음 Chapter의 세계 상태 변화"]
    for i, value in enumerate(left):
        col(c, GOLD); c.circle(M + 30, 331 - i*42, 5, fill=1, stroke=0)
        text(c, M + 48, 326 - i*42, value, 11, SLATE)
    for i, value in enumerate(right):
        col(c, RED); c.circle(484, 331 - i*42, 5, fill=1, stroke=0)
        text(c, 502, 326 - i*42, value, 11, SLATE)
    rect(c, M, 83, W - 2*M, 50, NAVY_2, 12)
    text(c, M + 18, 105, "공통점: 둘 다 관찰 → 주문 설계 → Preview → 대상 선택 → 명시 시전 → 결과 읽기의 책임 있는 루프를 사용한다.", 10.4, "#FFFFFF", "Noto", W - 2*M - 36, 14, 3)


def page16(c):
    section(c, 16, "PART 3  응용, 전투, 축제", "전투의 플레이 계약", "전투에서 플레이어는 처치 수치가 아니라 무엇을 읽고 해결하는가?", "설계 의도", "intent")
    steps = [
        ("1", "불안정 원인", "적·환경이 왜 위험한지 읽는다."),
        ("2", "보호 목표", "누구/무엇을 먼저 지킬지 고른다."),
        ("3", "주문 설계", "글자와 회로, Preview를 준비한다."),
        ("4", "명시 시전", "대상을 정하고 정확히 한 번 사용한다."),
        ("5", "결과 기록", "개선, 부작용, 발견을 남긴다."),
    ]
    for i, (n, title, body) in enumerate(steps):
        x = M + i * 153
        col(c, BLUE if i % 2 else GOLD)
        c.circle(x + 61, 355, 29, fill=1, stroke=0)
        text(c, x + 55, 348, n, 13, "#FFFFFF")
        text(c, x, 293, title, 12, NAVY, "Noto", 122, 16, 2)
        text(c, x, 257, body, 9.2, SLATE, "Noto", 122, 13, 3)
        if i < 4: line(c, x + 125, 355, x + 147, 355, BLUE_DARK, 1.8)
    rect(c, M, 105, W - 2*M, 84, "#FBE8E6", 13)
    text(c, M + 18, 158, "전투의 금지선", 11, "#A44B4B")
    text(c, M + 18, 130, "단순 HP 처치 반복, 자동 표적, 자동 시전, 대량 enemy wave, 전투만으로 평가·성장을 독점하는 구조는 만들지 않는다.", 11, INK, "Noto", W - 2*M - 36, 15, 3)


def page17(c):
    section(c, 17, "PART 3  응용, 전투, 축제", "전투가 파밍이 되지 않게", "반복 실전 응용은 어떻게 의미를 유지하는가?", "기획 확인")
    levels = [("첫 고유 완료", "100", GOLD), ("새 조건/의미 있는 다른 해법", "50", BLUE), ("같은 조건의 첫 반복", "25", GREEN), ("그 이후 동일 반복", "0", RED)]
    for i, (title, value, accent) in enumerate(levels):
        x = M + i * 193
        rect(c, x, 260, 177, 145, "#FFFFFF", 14, "#DFE4ED")
        text(c, x + 16, 359, title, 10.5, NAVY, "Noto", 145, 14, 3)
        col(c, accent)
        c.circle(x + 88, 302, 29, fill=1, stroke=0)
        text(c, x + 77, 295, value, 15, "#FFFFFF")
        text(c, x + 52, 240, "보상 비율 TEST VALUE", 8.5, SLATE)
    rect(c, M, 115, W - 2*M, 84, NAVY_2, 14)
    text(c, M + 18, 168, "의도", 11, GOLD_LIGHT)
    text(c, M + 18, 140, "새 관찰과 다른 의미 있는 해법을 기억하되, 같은 전투를 반복해서 재료·평가·성장을 무한히 쌓는 지배 전략을 막는다.", 11, "#FFFFFF", "Noto", W - 2*M - 36, 16, 3)


def page18(c):
    section(c, 18, "PART 3  응용, 전투, 축제", "축제의 역할", "축제는 왜 Chapter 4의 핵심 장면이어야 하는가?", "기획 확인")
    rect(c, M, 286, 344, 128, "#FFFFFF", 16, "#DFE4ED")
    text(c, M + 20, 374, "통제 응용", 16, NAVY)
    text(c, M + 20, 341, "낮은 위험의 학교 행사에서, 배운 원리를 사람과 관계의 맥락에 맞게 사용한다.", 11.2, SLATE, "Noto", 300, 16, 4)
    rect(c, 460, 286, 344, 128, "#FFFFFF", 16, "#DFE4ED")
    text(c, 480, 374, "전투와 다른 가치", 16, NAVY)
    text(c, 480, 341, "효율, 표현, 우아함, 관계, 보존의 선택이 모두 성과가 될 수 있음을 보여 준다.", 11.2, SLATE, "Noto", 300, 16, 4)
    rect(c, M, 115, W - 2*M, 122, "#FCF2D9", 15)
    text(c, M + 20, 202, "첫 46분 vertical slice의 축제", 13, INK)
    text(c, M + 20, 170, "첫 세션 마지막에는 학교가 살아 있다는 감각을 남기는 비플레이형 glimpse만 허용한다.", 11.4, SLATE)
    text(c, M + 20, 140, "축제 gameplay, 두 번째 사건, 새 튜토리얼은 그 46분 안에서 시작하지 않는다. 장기 Chapter 4와 분리한다.", 10.6, "#A44B4B")


def page19(c):
    section(c, 19, "PART 3  응용, 전투, 축제", "축제의 세 해법", "효율 외의 가치를 성공으로 읽게 하려면 무엇을 비교해야 하는가?", "기획 확인")
    values = [
        ("PRACTICAL", "안정성과 실용성", "행사가 안전하게 지속되도록 조건을 정리한다.", GOLD),
        ("SPECTACULAR", "표현과 공유", "사람들이 마법의 의미를 함께 느끼도록 만든다.", BLUE),
        ("ELEGANT", "절제와 조화", "적은 개입으로 문맥과 공간의 균형을 살린다.", GREEN),
    ]
    for i, (name, title, body, accent) in enumerate(values):
        x = M + i * 258
        rect(c, x, 208, 238, 204, "#FFFFFF", 16, "#DFE4ED")
        col(c, accent)
        c.rect(x, 376, 238, 36, fill=1, stroke=0)
        text(c, x + 18, 390, name, 10, "#FFFFFF")
        text(c, x + 18, 331, title, 15, NAVY)
        text(c, x + 18, 286, body, 10.8, SLATE, "Noto", 198, 16, 4)
    rect(c, M, 102, W - 2*M, 64, "#FBE8E6", 13)
    text(c, M + 18, 140, "판정", 11, "#A44B4B")
    text(c, M + 18, 114, "세 해법은 모두 성공 가능하다. 효율 하나가 숨은 정답이나 최고의 평가가 되지 않으며, 무엇을 보존하고 포기했는지가 관계와 기록으로 남는다.", 10.5, INK, "Noto", W - 2*M - 36, 14, 3)


def page20(c):
    section(c, 20, "PART 3  응용, 전투, 축제", "예상 밖 조건과 재설계", "행사 도중 처음 설계가 맞지 않으면 플레이어는 무엇을 하는가?", "설계 의도", "intent")
    x0, y0 = M, 245
    cards = [("처음 설계", "행사 목표와 내 우선 가치를 반영해 주문을 준비한다.", GOLD), ("조건 변화", "참가자, 환경, 안전 조건 중 하나가 예상과 달라진다.", BLUE), ("선택", "처음 설계를 유지하거나, 새로운 정보에 맞게 재설계한다.", GREEN), ("기록", "효율뿐 아니라 관계와 보존한 가치를 result/마도서에 남긴다.", "#A887D0")]
    for i, (title, body, accent) in enumerate(cards):
        x = x0 + i * 194
        rect(c, x, y0, 177, 154, "#FFFFFF", 15, "#DFE4ED")
        col(c, accent); c.rect(x, y0 + 121, 177, 33, fill=1, stroke=0)
        text(c, x + 16, y0 + 133, title, 12, "#FFFFFF")
        text(c, x + 16, y0 + 77, body, 9.6, SLATE, "Noto", 145, 14, 5)
        if i < 3: line(c, x + 182, y0 + 77, x + 188, y0 + 77, accent, 2)
    rect(c, M, 111, W - 2*M, 76, "#FFFFFF", 13, "#DFE4ED")
    text(c, M + 18, 156, "검수할 감각", 11, NAVY)
    text(c, M + 18, 130, "플레이어가 ‘처음 생각보다 지금 이 조건에서 무엇을 지키는 편이 낫지?’라고 말할 수 있어야 한다. 정답 재료나 숨은 점수를 찾는 메뉴가 되면 실패다.", 10.8, SLATE, "Noto", W - 2*M - 36, 15, 3)


def page21(c):
    section(c, 21, "PART 4  1학년 성장과 후속 현장 사건", "Chapter별 질문", "일곱 Chapter는 같은 구조를 어떻게 다르게 시작하는가?", "기획 확인")
    rows = [
        ("C1", "정답의 모양", "교수의 정답과 상황을 고친 주문은 무엇이 다른가?", "수업/온실 지도 실습"),
        ("C2", "교실 밖의 변수", "잘 쓰는 마법과 상황에 맞는 마법은 같은가?", "준비/자유일정"),
        ("C3", "같은 사건, 다른 원리", "다른 원리로 푼 같은 문제는 무엇이 달라지는가?", "비교 관찰"),
        ("C4", "축제의 세 해법", "효율만 맞으면 좋은 마법인가?", "축제/통제 응용"),
        ("C5", "실패도 기록이 된다", "실패한 결과도 성장 증거가 될 수 있는가?", "연구/회복"),
        ("C6", "학교의 규칙이 통하지 않는 곳", "학교에서 맞던 답이 현장에서는 부분적으로만 맞을 때?", "후속 현장 책임"),
        ("C7", "내가 쓴 첫 번째 원리", "지금까지의 근거로 나는 어떤 마법사가 될 것인가?", "마도서/첫 개정"),
    ]
    y = 420
    headers = ["", "Chapter", "상황 질문", "대표 장면"]
    xs = [M, M+62, M+240, M+610]
    for x, h in zip(xs, headers): text(c, x, 442, h, 9.5, SLATE)
    for i, (code, name, q, scene) in enumerate(rows):
        fill = "#FFFFFF" if i % 2 == 0 else "#EEF3FA"
        rect(c, M, y-12, W - 2*M, 42, fill, 5)
        text(c, M+16, y+4, code, 10.5, GOLD if i < 2 else (BLUE_DARK if i < 4 else "#377D67"))
        text(c, M+62, y+4, name, 10.1, NAVY, "Noto", 160, 13, 2)
        text(c, M+240, y+4, q, 9.2, SLATE, "Noto", 345, 12, 2)
        text(c, M+610, y+4, scene, 9.2, NAVY, "Noto", 145, 12, 2)
        y -= 45
    text(c, M, 74, "반복 방지: C1은 학습, C2는 준비, C3은 비교, C4는 축제, C5는 결과/실패, C6은 현장 위기, C7은 복기에서 각각 출발한다.", 10.3, NAVY, "Noto", W - 2*M, 14, 2)


def page22(c):
    section(c, 22, "PART 4  1학년 성장과 후속 현장 사건", "첫 실습 뒤 더 큰 현장이 필요한 이유", "왜 수업·응용·축제 뒤에 후속 현장 책임이 필요한가?", "기획 확인")
    cards = [
        ("수업의 근거", "글자의 뜻과 안전한 선례를 안다."),
        ("응용의 근거", "관계와 표현, 다른 가치의 성공을 경험한다."),
        ("실전의 근거", "현장에서는 무엇을 우선 보호할지 결정할 준비가 된다."),
        ("복기의 근거", "첫 시전이 남긴 비용을 다음 원리로 바꿀 수 있다."),
    ]
    for i, (title, body) in enumerate(cards):
        x = M + (i%2)*386
        y = 304 if i < 2 else 135
        card(c, x, y, 360, 136, title, body, [GOLD, BLUE, GREEN, "#A887D0"][i], 11)
        if i == 0: line(c, 220, 305, 220, 270, GOLD, 2)
        if i == 1: line(c, 606, 305, 606, 270, BLUE, 2)
    text(c, M, 84, "온실은 첫 지도 실습이다. 그 작은 전이 경험 뒤에 수업/실습/응용의 근거가 생명·시설·정령의 더 큰 충돌에서 시험되는 후속 현장 Chapter가 필요하다.", 11.5, NAVY, "Noto", W - 2*M, 16, 3)


def page23(c):
    section(c, 23, "PART 4  1학년 성장과 후속 현장 사건", "첫 온실 실습의 작은 판단", "수업 직후 온실에서 묘목과 구조를 비교하는 경험은 무엇을 가르치는가?", "설계 의도", "intent")
    steps = [("관찰", "묘목과 구조에서 확인할 수 있는 두 사실을 읽는다.", GOLD), ("미리보기", "범위·정밀도와 남는 문제를 비교한다.", BLUE), ("시전", "실습 대상에 명시적으로 한 번 사용한다.", GREEN)]
    for i, (title, body, accent) in enumerate(steps):
        x = M + i * 128
        rect(c, x, 215, 112, 166, "#FFFFFF", 14, "#DFE4ED")
        col(c, accent); c.circle(x + 30, 338, 14, fill=1, stroke=0)
        text(c, x + 25, 332, str(i + 1), 8.5, "#FFFFFF")
        text(c, x + 15, 295, title, 11.2, NAVY, "Noto", 80, 14, 2)
        text(c, x + 15, 255, body, 8.6, SLATE, "Noto", 80, 12, 4)
        if i < 2: line(c, x + 114, 298, x + 123, 298, accent, 1.8)
    card(c, 450, 285, 354, 126, "희귀 서리 묘목", "생명의 연속성과 즉시 회복을 먼저 보호한다. 구조와 등불의 작은 위험은 일부 남을 수 있다.", GOLD, 10.2, "동등한 유효 선택", "plan")
    card(c, 450, 140, 354, 126, "온실 구조와 등불", "시설 안정성과 더 넓은 안전을 먼저 보호한다. 묘목의 작은 손실/위험은 일부 남을 수 있다.", BLUE, 10.2, "동등한 유효 선택", "plan")
    text(c, M, 112, "현재 W6 선택 흐름과 같은 실제 화면이라고 주장하지 않는다. 이 작은 판단은 최종 검수 뒤 별도 조정 작업에서 구현 경계를 정한다.", 9.8, "#A44B4B", "Noto", W - 2*M, 14, 3)


def page24(c):
    section(c, 24, "PART 4  1학년 성장과 후속 현장 사건", "첫 시전 뒤 다음 수업으로", "작은 실습의 결과는 어떻게 다음 관찰과 수업으로 이어지는가?", "설계 의도", "intent")
    nodes = [("실제 개선", "무엇이 분명히 나아졌는가", GREEN), ("남은 위험", "어떤 문제는 아직 이어지는가", RED), ("미확인", "아직 알 수 없는 원인은 무엇인가", GOLD), ("다음 설계", "기록을 근거로 무엇을 다시 쓸 것인가", BLUE)]
    for i, (title, body, accent) in enumerate(nodes):
        x = M + i * 193
        rect(c, x, 267, 177, 134, "#FFFFFF", 14, "#DFE4ED")
        col(c, accent); c.rect(x, 369, 177, 32, fill=1, stroke=0)
        text(c, x+16, 381, title, 11.5, "#FFFFFF")
        text(c, x+16, 316, body, 10, SLATE, "Noto", 145, 14, 4)
        if i<3: line(c, x+182, 334, x+188, 334, accent, 2)
    rect(c, M, 113, W-2*M, 89, NAVY_2, 14)
    text(c, M+18, 168, "결과 receipt의 역할", 11, GOLD_LIGHT)
    text(c, M+18, 140, "무엇을 지키고 무엇을 포기했는지를 설명 가능한 인과로 남긴다. global success grade나 숨은 정답을 보여 주는 결과창이 아니다.", 10.9, "#FFFFFF", "Noto", W-2*M-36, 15, 3)


def page25(c):
    section(c, 25, "PART 4  1학년 성장과 후속 현장 사건", "실패도 기록이 된다", "부분성공과 실패를 지우지 않으면 플레이어는 무엇을 얻는가?", "기획 확인")
    rect(c, M, 270, 230, 142, "#FBE8E6", 16)
    text(c, M+18, 372, "결과", 15, "#A44B4B")
    text(c, M+18, 334, "보존 / 손실 / 부작용 / 발견", 11.2, INK)
    rect(c, 306, 270, 230, 142, "#FCF2D9", 16)
    text(c, 324, 372, "책임", 15, "#8D6A24")
    text(c, 324, 334, "원인 설명 / 회복 행동 / 대체 해법", 11.2, INK, "Noto", 185, 16, 3)
    rect(c, 574, 270, 230, 142, "#E6F3ED", 16)
    text(c, 592, 372, "다음 원리", 15, "#377D67")
    text(c, 592, 334, "마도서 근거 / 다음 수업·응용·현장 변주", 11.2, INK, "Noto", 185, 16, 3)
    line(c, 269, 341, 292, 341, RED, 2.5)
    line(c, 537, 341, 560, 341, GOLD, 2.5)
    rect(c, M, 112, W-2*M, 84, "#FFFFFF", 13, "#DFE4ED")
    text(c, M+18, 160, "회복의 뜻", 11, NAVY)
    text(c, M+18, 132, "회복은 감점을 삭제하거나 실패를 없던 일로 만드는 일이 아니다. 새 관찰, 대체 활용, 책임 있는 복기로 다음 판단의 증거를 늘리는 일이다.", 10.8, SLATE, "Noto", W-2*M-36, 15, 3)


def page26(c):
    section(c, 26, "PART 4  1학년 성장과 후속 현장 사건", "학년말 포트폴리오와 첫 원리", "수업·축제·전투·복기는 어떻게 한 명의 마법사를 설명하는가?", "기획 확인")
    axes = [("원리 이해", "왜 이 주문/계열이 작동하는가", GOLD), ("문맥 적용", "장소·사람·위험에 맞게 바꿨는가", BLUE), ("책임·회복", "결과와 대가에 응답했는가", GREEN), ("복기·설명", "실제 경험을 다음 판단으로 바꿨는가", "#A887D0")]
    for i,(title,body,accent) in enumerate(axes):
        x = M + (i%2)*386
        y = 302 if i<2 else 135
        rect(c,x,y,360,134,"#FFFFFF",15,"#DFE4ED")
        col(c,accent); c.circle(x+34,y+94,16,fill=1,stroke=0)
        text(c,x+28,y+88,"25",10,"#FFFFFF")
        text(c,x+64,y+101,title,14,NAVY)
        text(c,x+64,y+69,body,10.1,SLATE,"Noto",260,14,3)
    text(c, M, 84, "학기말은 별도 시험이 아니다. 한 종류의 전투나 수업 출석이 평가를 독점하지 않으며, 숫자보다 대표 근거와 다음 방향을 설명한다.", 11.3, NAVY, "Noto", W-2*M, 16, 3)


def page27(c):
    section(c, 27, "PART 5  기억, 감각, 다음 구현 판단", "1년에서 3년으로", "첫 원리는 장기 게임에서 어디로 이어지는가?", "설계 의도", "intent")
    years = [("1학년", "정답은 왜 맞는가?", "정답 복제 → 문맥 해석 → 첫 독자 원리", GOLD), ("2학년", "누가 세계를 바꿀 권리가 있는가?", "전문화와 이해관계자 → 첫 공동 개정", BLUE), ("3학년", "무엇을 바꾸지 않을 책임이 있는가?", "여러 개정의 충돌 → 보존/되돌림/새 쓰기", GREEN)]
    for i,(year,q,body,accent) in enumerate(years):
        x=M+i*258
        rect(c,x,195,238,205,"#FFFFFF",17,"#DFE4ED")
        col(c,accent); c.rect(x,365,238,35,fill=1,stroke=0)
        text(c,x+18,378,year,12,"#FFFFFF")
        text(c,x+18,323,q,14,NAVY,"Noto",195,20,3)
        text(c,x+18,256,body,10.2,SLATE,"Noto",196,15,4)
        if i<2: line(c,x+242,299,x+253,299,accent,2.4)
    rect(c,M,99,W-2*M,55,NAVY_2,12)
    text(c,M+18,121,"장기 보호선: 더 큰 파괴력보다 더 큰 책임, 더 넓은 보존 범위, 더 설명 가능한 개정을 다룬다.",11,"#FFFFFF","Noto",W-2*M-36,15,3)


def page28(c):
    section(c, 28, "PART 5  기억, 감각, 다음 구현 판단", "최종 검수 질문", "이 방향을 승인하기 전에 무엇을 확인해야 하는가?", "사용자 최종 검수 대기", "review")
    qs = [
        ("1", "축제의 위치", "축제가 Chapter 4의 통제 응용으로, 전투와 다른 가치의 선택을 만드는가?"),
        ("2", "온실의 위치", "온실/묘목이 전체 게임이 아니라 수업 직후 첫 지도 실습 사건으로 읽히는가?"),
        ("3", "학년말의 마감", "1학년이 전투 재시도가 아니라 마도서 근거에 따른 첫 세계 개정으로 닫히는가?"),
        ("4", "다음 실행 우선", "장기 제작보다 현재 W6 사람/기기/성능 검증을 먼저 하는가?"),
    ]
    for i,(n,title,body) in enumerate(qs):
        x=M+(i%2)*386
        y=310 if i<2 else 157
        rect(c,x,y,360,126,"#FFFFFF",15,"#DFE4ED")
        col(c,[GOLD,BLUE,GREEN,RED][i]); c.circle(x+32,y+91,16,fill=1,stroke=0)
        text(c,x+27,y+85,n,10,"#FFFFFF")
        text(c,x+62,y+96,title,13,NAVY)
        text(c,x+62,y+65,body,10.1,SLATE,"Noto",270,14,4)
    rect(c,M,75,W-2*M,51,NAVY_2,12)
    text(c,M+18,98,"이 R1은 ‘좋아 보인다’와 ‘바로 구현한다’를 구분한다. 승인 전 장기 Chapter, W7, 새 runtime asset batch는 시작하지 않는다.",10.1,"#FFFFFF","Noto",W-2*M-36,14,3)


def key_scene_reference_page(c, sequence, title, subtitle, image_path, player_question, first_minutes):
    col(c, CREAM)
    c.rect(0, 0, W, H, fill=1, stroke=0)
    col(c, NAVY)
    c.rect(0, H - 56, W, 56, fill=1, stroke=0)
    text(c, M, H - 34, "GRIMOIRE · HUMAN GAME BLUEPRINT", 8.4, GOLD_LIGHT)
    text(c, M, H - 48, "핵심 장면 시각 참고", 11.2, "#FFFFFF")
    pill(c, W - 215, H - 24, "사용자 일괄 승인 · planning reference", "visual")
    text(c, M, H - 92, sequence, 10, BLUE_DARK)
    text(c, M, H - 120, title, 22, NAVY)
    text(c, M, H - 143, subtitle, 10.2, SLATE, "Noto", W - 2 * M, 14, 2)
    image_cover(c, image_path, M, 196, W - 2 * M, 230, 1)
    frame(c, M, 196, W - 2 * M, 230)
    text(c, M + 12, 176, "시각 참고 · 사람이 장면의 목적과 분위기를 검토하기 위한 자료. 기능 UI·수치·캐릭터 정본은 아직 고정하지 않음.", 8.5, "#377D67")
    card(c, M, 81, 360, 66, "플레이어 질문", player_question, GOLD, 10.1)
    card(c, M + 382, 81, 384, 66, "첫 장면의 흐름", first_minutes, BLUE, 10.1)
    text(c, M, 45, "상태: CANON_REGISTERED_PLANNING_REFERENCE_ONLY · 런타임 import / 배포 / 출시 증거는 이 PDF의 범위 밖", 8.2, SLATE)


def build():
    OUT.parent.mkdir(parents=True, exist_ok=True)
    pdfmetrics.registerFont(TTFont("Noto", str(FONT)))
    c = canvas.Canvas(str(OUT), pagesize=(W, H), pageCompression=1, invariant=1)
    c.setTitle("GRIMOIRE Human Game Blueprint")
    c.setAuthor("GRIMOIRE Project")
    cover(c); c.showPage()
    key_scene_reference_page(c, "01 · 수업", "직접 글자를 쓰고, 작은 결과를 관찰한다", "정답을 받는 수업이 아니라, 안전한 관찰과 다음 선택을 배우는 첫 장면.", CLASS, "이 글자를 쓰면 무엇이 달라질까?", "글자 작성 → 물길의 작은 반응 관찰 → 교수의 질문 → 온실 실습으로 연결"); c.showPage()
    key_scene_reference_page(c, "02 · 첫 지도 실습", "온실에서 두 가지 돌봄 사이를 고른다", "묘목과 금이 간 지지대는 첫 사건의 선택지이며, 게임 전체의 메인 목표가 아니다.", PRACTICUM, "지금 무엇을 먼저 안전하게 돌볼까?", "상황 읽기 → 글자 조합 → 대상 선택 → 명시 시전 → 결과 기록"); c.showPage()
    key_scene_reference_page(c, "03 · 보호 전투", "불안정한 현상을 진정시키며 주변을 보전한다", "쓰러뜨리기보다, 직접 쓴 마법과 환경 보호를 함께 판단하는 한 번의 훈련 전투.", BATTLE, "무엇을 진정시키고, 무엇을 지킬까?", "위험 읽기 → 보호 대상 지정 → 회로 완성 → 시전 → 피해와 변화 복기"); c.showPage()
    key_scene_reference_page(c, "04 · 축제", "여러 방식으로 빛의 지붕을 함께 복원한다", "실용·화려·우아한 해법이 공존하는 비전투 응용 장면. 단 하나의 승자는 없다.", FESTIVAL, "우리의 마법은 공동체에 어떤 흔적을 남길까?", "팀의 의도 선택 → 빛 실 엮기 → 서로의 결과 감상 → 마도서에 기억 남기기"); c.showPage()
    for fn in [page2,page3,page4,page5,page6,page7,page8,page9,page10,page11,page12,page13,page14,page15,page16,page17,page18,page19,page20,page21,page22,page23,page24,page25,page26,page27,page28]:
        fn(c); c.showPage()
    c.save()
    print(OUT)


if __name__ == "__main__":
    build()
