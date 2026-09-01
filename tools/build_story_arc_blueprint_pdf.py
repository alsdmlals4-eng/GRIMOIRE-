#!/usr/bin/env python3
"""Render the current story-arc Markdown owner as a human-facing PDF derived view."""

from __future__ import annotations

import argparse
import hashlib
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
DEFAULT_SOURCE = ROOT / "docs/superpowers/specs/2026-09-01-story-arc-blueprint-design.md"
DEFAULT_OUTPUT = ROOT / "output/pdf/GRIMOIRE_STORY_ARC_BLUEPRINT_2026-09-02.pdf"
REQUIRED_SOURCE_TOKENS = (
    "USER_SCOPE_APPROVED__FIRST_SESSION_RUNTIME_IMPLEMENTED__MACHINE_VERIFIED__EDITOR_RUNTIME_OBSERVED__HUMAN_NOT_RUN",
    "StoryFrontDoor",
    "AdmissionPrologue",
    "FirstClassRoot",
    "StoryEventRoot",
    "DuelPracticumRoot",
    "FestivalCanopyRoot",
    "WRITE_OR_SELECT_GLYPHS_TO_LAYERED_CIRCLES_TO_TARGET_TO_EXPLICIT_CAST_TO_CLOCK_RESULT",
    "RULESET_PENDING",
    "human_pdf_derivative",
)
RUNTIME_CAPTURES = {
    "first_class": ROOT / "artifacts/runtime/2026-09-01-first-class-glyph-input-runtime-1280x720.png",
    "duel": ROOT / "artifacts/runtime/2026-09-01-duel-practicum-1280x720-v2.png",
    "festival": ROOT / "artifacts/runtime/2026-09-01-festival-canopy-1280x720-v3.png",
}


def canonical_source_sha256(source_text: str) -> str:
    """Hash UTF-8 source content independent of Git's clean CRLF checkout conversion."""
    normalized = source_text.replace("\r\n", "\n").replace("\r", "\n")
    return hashlib.sha256(normalized.encode("utf-8")).hexdigest().upper()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--check-inputs",
        action="store_true",
        help="Validate the canonical source contract without importing PDF dependencies or writing output.",
    )
    return parser.parse_args()


def validate_inputs(source: Path, require_runtime_captures: bool) -> tuple[str, str]:
    if not source.is_file():
        raise ValueError(f"canonical story-arc source is missing: {source}")

    source_text = source.read_text(encoding="utf-8")
    missing = [token for token in REQUIRED_SOURCE_TOKENS if token not in source_text]
    if missing:
        raise ValueError("canonical story-arc source is missing required state: " + ", ".join(missing))

    if require_runtime_captures:
        missing_captures = [str(path.relative_to(ROOT)) for path in RUNTIME_CAPTURES.values() if not path.is_file()]
        if missing_captures:
            raise ValueError("runtime capture evidence is missing: " + ", ".join(missing_captures))

    return source_text, canonical_source_sha256(source_text)


def render_pdf(output: Path, source_sha: str) -> None:
    try:
        from reportlab.lib.colors import Color, HexColor, white
        from reportlab.lib.pagesizes import landscape, A4
        from reportlab.lib.utils import ImageReader
        from reportlab.pdfbase import pdfmetrics
        from reportlab.pdfbase.ttfonts import TTFont
        from reportlab.pdfgen import canvas
        from reportlab.pdfbase.pdfmetrics import stringWidth
    except ImportError as exc:  # pragma: no cover - local artifact dependency route
        raise RuntimeError(
            "ReportLab is required for PDF rendering. Use the bundled workspace Python described by Codex."
        ) from exc

    regular_font = Path(r"C:\Windows\Fonts\malgun.ttf")
    bold_font = Path(r"C:\Windows\Fonts\malgunbd.ttf")
    if not regular_font.is_file() or not bold_font.is_file():
        raise RuntimeError("Malgun Gothic fonts are required to render Korean text consistently on this Windows workspace.")

    pdfmetrics.registerFont(TTFont("Malgun", str(regular_font)))
    pdfmetrics.registerFont(TTFont("MalgunBold", str(bold_font)))

    page_width, page_height = landscape(A4)
    output.parent.mkdir(parents=True, exist_ok=True)
    pdf = canvas.Canvas(str(output), pagesize=(page_width, page_height), pageCompression=1)
    pdf.setTitle("GRIMOIRE 첫 세션 스토리 아크 블루프린트")
    pdf.setAuthor("GRIMOIRE project derived-view renderer")
    pdf.setSubject("Read-only PDF view derived from the canonical story-arc blueprint Markdown source")
    pdf.setKeywords("GRIMOIRE, story arc, blueprint, Circle, Clock, Godot")

    ink = HexColor("#101B33")
    navy = HexColor("#16233B")
    blue = HexColor("#3564A8")
    pale_blue = HexColor("#EAF2FF")
    gold = HexColor("#C99A3A")
    pale_gold = HexColor("#F8F0DC")
    soft_gray = HexColor("#F3F5F8")
    muted = HexColor("#53627A")
    white_ink = white
    margin = 34

    def draw_header(title: str, kicker: str) -> None:
        pdf.setFillColor(navy)
        pdf.rect(0, page_height - 54, page_width, 54, stroke=0, fill=1)
        pdf.setFillColor(gold)
        pdf.rect(0, page_height - 58, page_width, 4, stroke=0, fill=1)
        pdf.setFillColor(white_ink)
        pdf.setFont("MalgunBold", 16)
        pdf.drawString(margin, page_height - 33, title)
        pdf.setFillColor(HexColor("#D7E3F8"))
        pdf.setFont("Malgun", 8.5)
        pdf.drawRightString(page_width - margin, page_height - 31, kicker)

    def draw_footer(page_number: int) -> None:
        pdf.setStrokeColor(HexColor("#D9DFE8"))
        pdf.line(margin, 25, page_width - margin, 25)
        pdf.setFillColor(muted)
        pdf.setFont("Malgun", 7)
        pdf.drawString(margin, 13, "정본: docs/superpowers/specs/2026-09-01-story-arc-blueprint-design.md  |  파생 PDF (읽기 전용)")
        pdf.drawRightString(page_width - margin, 13, f"source SHA-256 {source_sha[:12]}…  |  {page_number} / 7")

    def wrap(text: str, font: str, size: float, width: float) -> list[str]:
        words = text.split(" ")
        lines: list[str] = []
        current = ""
        for word in words:
            candidate = word if not current else f"{current} {word}"
            if stringWidth(candidate, font, size) <= width:
                current = candidate
            else:
                if current:
                    lines.append(current)
                if stringWidth(word, font, size) <= width:
                    current = word
                else:
                    chunk = ""
                    for character in word:
                        if stringWidth(chunk + character, font, size) <= width:
                            chunk += character
                        else:
                            lines.append(chunk)
                            chunk = character
                    current = chunk
        if current:
            lines.append(current)
        return lines

    def draw_text_block(text: str, x: float, y: float, width: float, size: float = 10, color=ink, leading: float | None = None) -> float:
        leading = leading or size * 1.48
        pdf.setFont("Malgun", size)
        pdf.setFillColor(color)
        for line in wrap(text, "Malgun", size, width):
            pdf.drawString(x, y, line)
            y -= leading
        return y

    def rounded_box(x: float, y: float, width: float, height: float, fill, stroke=gold, radius: float = 10) -> None:
        pdf.setFillColor(fill)
        pdf.setStrokeColor(stroke)
        pdf.setLineWidth(1)
        pdf.roundRect(x, y, width, height, radius, stroke=1, fill=1)

    def section_label(text: str, x: float, y: float) -> None:
        pdf.setFillColor(gold)
        pdf.setFont("MalgunBold", 10)
        pdf.drawString(x, y, text)

    def draw_bullet(text: str, x: float, y: float, width: float, color=ink) -> float:
        pdf.setFillColor(gold)
        pdf.circle(x + 3, y + 3, 2.3, stroke=0, fill=1)
        return draw_text_block(text, x + 12, y, width - 12, 9.2, color)

    def fit_image(path: Path, x: float, y: float, width: float, height: float) -> None:
        image = ImageReader(str(path))
        image_width, image_height = image.getSize()
        scale = min(width / image_width, height / image_height)
        drawn_width = image_width * scale
        drawn_height = image_height * scale
        offset_x = x + (width - drawn_width) / 2
        offset_y = y + (height - drawn_height) / 2
        pdf.setFillColor(HexColor("#0A1120"))
        pdf.rect(x, y, width, height, stroke=0, fill=1)
        pdf.drawImage(image, offset_x, offset_y, drawn_width, drawn_height, mask="auto")
        pdf.setStrokeColor(gold)
        pdf.rect(x, y, width, height, stroke=1, fill=0)

    # Page 1 — statement of intent and state legend.
    draw_header("GRIMOIRE — 첫 세션 스토리 아크", "입학식 → 수업 → 첫 실습 → 결투 연습 → 축제")
    pdf.setFillColor(ink)
    pdf.setFont("MalgunBold", 26)
    pdf.drawString(margin, page_height - 104, "사람이 확인하는 블루프린트")
    pdf.setFont("Malgun", 12)
    pdf.setFillColor(muted)
    pdf.drawString(margin, page_height - 128, "스토리 따라 진행되는 마법학교 첫 세션 — 활동 선택 허브가 아닌 하나의 여정")
    rounded_box(margin, 276, page_width - margin * 2, 148, pale_blue, blue)
    section_label("플레이어 약속", margin + 22, 399)
    draw_text_block(
        "글자를 허공에 직접 새기고, 역할 없는 1–3개의 겹서클을 만든 뒤, 대상과 대가를 Preview로 확인하고 명시적으로 시전한다. "
        "Goal/Threat 사건 시계는 진전과 위험을 함께 보여 주며, 같은 배움은 수업·실습·결투·축제에서 다른 맥락으로 이어진다.",
        margin + 22,
        376,
        page_width - margin * 2 - 44,
        11.2,
    )
    section_label("현재 상태", margin + 22, 333)
    draw_text_block(
        "첫 세션 route와 결투 연습 배경 02는 구현·자동 검증·1280×720 에디터 관찰까지 완료. "
        "Human / Device / Accessibility / Performance / Export는 아직 실행하지 않았다.",
        margin + 22,
        310,
        page_width - margin * 2 - 44,
        10.2,
    )
    labels = [
        ("구현됨", "스크립트·씬·소비처가 현재 브랜치에 존재"),
        ("기계 검증", "자동 검사·문서 계약·해시 검증"),
        ("에디터 관찰", "1280×720 actual runtime capture"),
        ("사람/기기", "별도 검수로 남음 — 이 PDF가 대체하지 않음"),
    ]
    box_width = (page_width - margin * 2 - 30) / 2
    for index, (heading, explanation) in enumerate(labels):
        column = index % 2
        row = index // 2
        x = margin + column * (box_width + 30)
        y = 170 - row * 72
        rounded_box(x, y, box_width, 54, pale_gold if index < 3 else soft_gray, gold if index < 3 else HexColor("#BBC3D0"), 8)
        pdf.setFillColor(ink)
        pdf.setFont("MalgunBold", 10.5)
        pdf.drawString(x + 13, y + 33, heading)
        draw_text_block(explanation, x + 13, y + 18, box_width - 26, 8.2, muted, 10.5)
    draw_footer(1)
    pdf.showPage()

    # Page 2 — sequence flow map.
    draw_header("플로우 맵", "이야기 순서가 다음 장면을 소유한다")
    section_label("처음부터 끝까지", margin, page_height - 85)
    nodes = [
        ("메인 화면", "새 기록 / 이어하기 / 도감 / 설정 / 종료"),
        ("입학식", "학교의 약속"),
        ("첫 수업", "글자 관찰과 직접 쓰기"),
        ("첫 실습", "서리꽃 · Goal / Threat"),
        ("결투 연습", "안전한 대응과 복기"),
        ("축제", "공동 복구와 다음 장"),
    ]
    node_width = 116
    gap = 16
    start_x = margin
    y = 328
    for index, (title, caption) in enumerate(nodes):
        x = start_x + index * (node_width + gap)
        rounded_box(x, y, node_width, 106, pale_blue if index in (0, 2, 3, 4, 5) else pale_gold, blue if index != 1 else gold, 11)
        pdf.setFillColor(ink)
        pdf.setFont("MalgunBold", 12)
        pdf.drawCentredString(x + node_width / 2, y + 69, title)
        pdf.setFillColor(muted)
        pdf.setFont("Malgun", 7.9)
        caption_lines = wrap(caption, "Malgun", 7.9, node_width - 16)
        for line_index, line in enumerate(caption_lines):
            pdf.drawCentredString(x + node_width / 2, y + 46 - line_index * 11, line)
        if index < len(nodes) - 1:
            arrow_x = x + node_width + 3
            pdf.setStrokeColor(gold)
            pdf.setLineWidth(2.2)
            pdf.line(arrow_x, y + 53, arrow_x + gap - 6, y + 53)
            pdf.setFillColor(gold)
            pdf.line(arrow_x + gap - 11, y + 58, arrow_x + gap - 6, y + 53)
            pdf.line(arrow_x + gap - 11, y + 48, arrow_x + gap - 6, y + 53)
    rounded_box(margin, 108, page_width - margin * 2, 138, soft_gray, HexColor("#CBD3DE"), 10)
    section_label("각 사건에서 같은 핵심 동작을 되풀이한다", margin + 22, 220)
    verbs = ["글자 직접 쓰기", "1–3 겹서클", "Preview", "대상 지정", "명시 시전", "Goal / Threat 결과"]
    verb_width = (page_width - margin * 2 - 50) / 6
    for index, verb in enumerate(verbs):
        x = margin + 16 + index * verb_width
        pdf.setFillColor(navy)
        pdf.circle(x + 16, 170, 16, stroke=0, fill=1)
        pdf.setFillColor(white_ink)
        pdf.setFont("MalgunBold", 10)
        pdf.drawCentredString(x + 16, 166, str(index + 1))
        pdf.setFillColor(ink)
        pdf.setFont("Malgun", 8.3)
        for row, line in enumerate(wrap(verb, "Malgun", 8.3, verb_width - 8)):
            pdf.drawCentredString(x + verb_width / 2, 135 - row * 11, line)
    pdf.setFillColor(muted)
    pdf.setFont("Malgun", 8.5)
    pdf.drawString(margin + 22, 94, "도감은 읽기 전용이다. 카드 상세 룰·턴·마력·승패는 RULESET_PENDING이며, 독립 카드 결투 버튼은 없다.")
    draw_footer(2)
    pdf.showPage()

    # Page 3 — wireframe front door and classroom.
    draw_header("핵심 장면 와이어프레임 ①", "메인 화면과 첫 수업")
    panels = [
        ("SCREEN-01 · 스토리 프런트 도어", "새 기록을 시작하거나 유효한 기록을 이어 간다. 수업·실습·결투·축제를 직접 고르는 메뉴는 없다."),
        ("SCREEN-02 · 첫 수업", "글자 도안을 먼저 보고, 같은 화면에서 직접 획을 써서 반응을 확인한다. 배경에는 글자·수치·조작 문구를 굽지 않는다."),
    ]
    for index, (title, caption) in enumerate(panels):
        y = 288 - index * 222
        rounded_box(margin, y, page_width - margin * 2, 188, soft_gray, HexColor("#BFC8D6"), 10)
        pdf.setFillColor(ink)
        pdf.setFont("MalgunBold", 13)
        pdf.drawString(margin + 18, y + 161, title)
        draw_text_block(caption, margin + 18, y + 142, page_width - margin * 2 - 36, 9.2, muted)
        wire_x = margin + 18
        wire_y = y + 19
        wire_w = page_width - margin * 2 - 36
        wire_h = 94
        pdf.setFillColor(HexColor("#18243A"))
        pdf.roundRect(wire_x, wire_y, wire_w, wire_h, 7, stroke=0, fill=1)
        if index == 0:
            pdf.setFillColor(HexColor("#344866"))
            pdf.roundRect(wire_x + wire_w * 0.34, wire_y + 16, wire_w * 0.32, 60, 7, stroke=0, fill=1)
            pdf.setFillColor(white_ink)
            pdf.setFont("MalgunBold", 14)
            pdf.drawCentredString(wire_x + wire_w / 2, wire_y + 61, "GRIMOIRE")
            pdf.setFont("Malgun", 8)
            for row, label in enumerate(("새 기록 시작", "이야기 이어하기", "도감 · 설정 · 종료")):
                pdf.drawCentredString(wire_x + wire_w / 2, wire_y + 45 - row * 13, label)
        else:
            pdf.setFillColor(HexColor("#426E7C"))
            pdf.rect(wire_x + 10, wire_y + 10, wire_w * 0.56, wire_h - 20, stroke=0, fill=1)
            pdf.setFillColor(HexColor("#F2F5E6"))
            pdf.roundRect(wire_x + wire_w * 0.62, wire_y + 12, wire_w * 0.34, wire_h - 24, 5, stroke=0, fill=1)
            pdf.setFillColor(ink)
            pdf.setFont("MalgunBold", 9)
            pdf.drawString(wire_x + wire_w * 0.64, wire_y + 66, "글자 도안")
            pdf.setFont("Malgun", 8)
            pdf.drawString(wire_x + wire_w * 0.64, wire_y + 48, "직접 쓰기 입력판")
            pdf.drawString(wire_x + wire_w * 0.64, wire_y + 30, "안전한 Goal")
    draw_footer(3)
    pdf.showPage()

    # Page 4 — Circle / Clock state relationship and result wireframe.
    draw_header("핵심 장면 와이어프레임 ②", "서클·시계·결과 복기")
    rounded_box(margin, 274, 330, 214, pale_blue, blue, 10)
    section_label("역할 없는 1–3 겹서클", margin + 18, 462)
    center_x, center_y = margin + 165, 365
    pdf.setStrokeColor(gold)
    pdf.setLineWidth(2)
    for radius in (65, 43, 22):
        pdf.circle(center_x, center_y, radius, stroke=1, fill=0)
    pdf.setFillColor(navy)
    pdf.circle(center_x, center_y, 10, stroke=0, fill=1)
    pdf.setFillColor(white_ink)
    pdf.setFont("MalgunBold", 10)
    pdf.drawCentredString(center_x, center_y - 3, "글")
    pdf.setFillColor(muted)
    pdf.setFont("Malgun", 8.8)
    pdf.drawCentredString(center_x, 286, "서클은 역할 칸이 아니라, 선택한 글자를 층으로 겹친다.")

    rounded_box(384, 274, page_width - margin - 384, 214, pale_gold, gold, 10)
    section_label("사건 시계", 402, 462)
    clock_x, clock_y = 485, 369
    pdf.setStrokeColor(navy)
    pdf.setLineWidth(3)
    pdf.circle(clock_x, clock_y, 58, stroke=1, fill=0)
    for angle in range(0, 360, 45):
        import math

        radians = math.radians(angle)
        pdf.line(clock_x, clock_y, clock_x + 58 * math.cos(radians), clock_y + 58 * math.sin(radians))
    pdf.setFillColor(blue)
    pdf.wedge(clock_x - 54, clock_y - 54, clock_x + 54, clock_y + 54, 90, 180, stroke=0, fill=1)
    pdf.setFillColor(gold)
    pdf.wedge(clock_x - 54, clock_y - 54, clock_x + 54, clock_y + 54, 270, 90, stroke=0, fill=1)
    pdf.setFillColor(ink)
    pdf.setFont("MalgunBold", 10)
    pdf.drawString(555, 397, "Goal")
    pdf.setFont("Malgun", 8.6)
    pdf.drawString(555, 382, "진전")
    pdf.setFont("MalgunBold", 10)
    pdf.drawString(555, 348, "Threat")
    pdf.setFont("Malgun", 8.6)
    pdf.drawString(555, 333, "위험")
    pdf.setFillColor(muted)
    pdf.setFont("Malgun", 8.8)
    pdf.drawString(402, 286, "좋은 결과와 대가가 함께 남을 수 있으며, 성공을 지우지 않는다.")

    rounded_box(margin, 73, page_width - margin * 2, 158, soft_gray, HexColor("#BFC8D6"), 10)
    section_label("SCREEN-04 · 사건 결과와 복기", margin + 20, 205)
    draw_text_block(
        "Goal과 Threat의 바뀐 칸·그 원인을 한 화면에서 보여 주고, 대상 변화와 학생/교수의 짧은 복기를 남긴다. "
        "정답 판정·자동 보상·결과 재시전은 두지 않고 다음 이야기로만 이어진다.",
        margin + 20,
        185,
        page_width - margin * 2 - 40,
        9.5,
        muted,
    )
    for index, label in enumerate(("Goal 변화", "Threat 변화", "대상 변화", "짧은 복기", "새 해금", "다음 이야기")):
        x = margin + 22 + (index % 3) * 238
        y = 113 - (index // 3) * 35
        pdf.setFillColor(HexColor("#E4E9F0"))
        pdf.roundRect(x, y, 212, 24, 5, stroke=0, fill=1)
        pdf.setFillColor(ink)
        pdf.setFont("Malgun", 8.7)
        pdf.drawString(x + 10, y + 8, label)
    draw_footer(4)
    pdf.showPage()

    # Page 5 — rendered evidence.
    draw_header("실제 화면 증거", "1280×720 editor-runtime captures — 사람/기기 검수는 별도")
    section_label("첫 수업 — 글자 도안을 보고 직접 쓴다", margin, page_height - 84)
    fit_image(RUNTIME_CAPTURES["first_class"], margin, 310, 360, 202)
    section_label("결투 연습 — 환경은 배경, 서클·시계·대상은 live UI", 444, page_height - 84)
    fit_image(RUNTIME_CAPTURES["duel"], 444, 310, 360, 202)
    rounded_box(margin, 102, page_width - margin * 2, 165, pale_gold, gold, 10)
    section_label("이미지와 기능 UI를 분리한 이유", margin + 20, 239)
    y = 217
    y = draw_bullet("첫 수업은 직접 글자 쓰기 패널에 도안을 함께 보여 주어, 입력 방법을 추측하지 않게 한다.", margin + 20, y, page_width - margin * 2 - 40)
    y = draw_bullet("결투 배경 02에는 글자·표적·시계·수치·카드·캐릭터를 굽지 않았다. 같은 배경 위에 상황에 맞는 live state를 겹친다.", margin + 20, y - 6, page_width - margin * 2 - 40)
    draw_bullet("학생끼리의 결투는 처치 전투가 아닌 안전한 대응 연습이다. 카드 상세 게임과 결합하지 않는다.", margin + 20, y - 6, page_width - margin * 2 - 40)
    draw_footer(5)
    pdf.showPage()

    # Page 6 — festival and assets.
    draw_header("실제 화면 증거와 자산 경계", "축제는 비전투 공동 복구 · 새 아트는 소비처가 생길 때만 후보 제작")
    fit_image(RUNTIME_CAPTURES["festival"], margin, 234, 438, 246)
    rounded_box(500, 234, page_width - margin - 500, 246, soft_gray, HexColor("#BFC8D6"), 10)
    section_label("자산 상태", 518, 452)
    asset_rows = [
        ("결투 cloister 02", "USER_APPROVED · CANON_REGISTERED · IMPLEMENTED · RUNTIME_BOUND"),
        ("수업/축제 계획 레퍼런스", "planning reference only · live UI owns all text/state"),
        ("카드 frame/art", "BRIEF_READY · card rules remain RULESET_PENDING"),
        ("새 필요 이미지", "consumer · rights · layer preflight 뒤 candidate를 즉시 제작"),
    ]
    row_y = 417
    for heading, status in asset_rows:
        pdf.setFillColor(navy)
        pdf.circle(522, row_y + 3, 3, stroke=0, fill=1)
        pdf.setFillColor(ink)
        pdf.setFont("MalgunBold", 8.5)
        pdf.drawString(534, row_y, heading)
        draw_text_block(status, 534, row_y - 13, page_width - margin - 552, 7.6, muted, 10)
        row_y -= 52
    rounded_box(margin, 78, page_width - margin * 2, 120, pale_blue, blue, 10)
    section_label("축제의 역할", margin + 20, 174)
    draw_text_block(
        "축제는 수업과 실습에서 배운 마법을 학교 공동체가 함께 쓰는 장면이다. 단 하나의 ‘정답’보다 여러 돌봄의 표현 중 하나를 선택하게 하며, "
        "결투에서 익힌 위험 읽기와 명시적 시전의 의미를 전투 밖으로 확장한다.",
        margin + 20,
        153,
        page_width - margin * 2 - 40,
        10.0,
        ink,
    )
    draw_footer(6)
    pdf.showPage()

    # Page 7 — evidence, remaining work and publication provenance.
    draw_header("현재 검증 범위와 다음 안전 작업", "PDF 발행은 게임의 Human/Device 검수를 대체하지 않는다")
    rows = [
        ("문서/정본", "Markdown source와 registry 상태를 actual runtime receipt에 맞춰 정정", "이번 PDF와 hash manifest로 검증"),
        ("자동/에디터", "34 GUT suites · 1,450 assertions · 1280×720 editor capture", "기존 runtime receipt가 소유"),
        ("PDF 렌더", "모든 페이지 raster render와 시각 검수", "이번 publication manifest가 소유"),
        ("다음 우선", "1920×1080 crop · 실제 Human/Device/Accessibility/Performance/Export", "별도 evidence gate로 진행"),
        ("카드", "story-owned archive만 구현 · ruleset is pending", "사용자가 상세 룰을 제공한 뒤 별도 설계/검증"),
    ]
    y = 458
    column_x = (margin + 12, 193, 490)
    column_w = (130, 270, 285)
    for index, (area, current, next_step) in enumerate(rows):
        fill = pale_blue if index % 2 == 0 else soft_gray
        pdf.setFillColor(fill)
        pdf.setStrokeColor(HexColor("#C8D1DD"))
        pdf.roundRect(margin, y - 48, page_width - margin * 2, 56, 7, stroke=1, fill=1)
        pdf.setFillColor(ink)
        pdf.setFont("MalgunBold", 9.2)
        pdf.drawString(column_x[0], y - 6, area)
        draw_text_block(current, column_x[1], y - 6, column_w[1], 8.1, ink, 10)
        draw_text_block(next_step, column_x[2], y - 6, column_w[2], 8.1, muted, 10)
        y -= 62
    rounded_box(margin, 52, page_width - margin * 2, 74, pale_gold, gold, 10)
    pdf.setFillColor(ink)
    pdf.setFont("MalgunBold", 10)
    pdf.drawString(margin + 18, 102, "파생뷰 provenance")
    draw_text_block(
        "이 PDF는 canonical Markdown source의 보조 뷰다. source SHA, PDF SHA, 페이지 수, 렌더 검수는 adjacent manifest에 기록한다. "
        "복잡한 PDF의 tagged reading-order / screen-reader 검수는 이 작업에서 실행하지 않았으며, 접근성 PASS로 해석하지 않는다.",
        margin + 18,
        84,
        page_width - margin * 2 - 36,
        8.7,
        muted,
    )
    draw_footer(7)
    pdf.save()


def main() -> int:
    args = parse_args()
    try:
        _source_text, source_sha = validate_inputs(args.source.resolve(), require_runtime_captures=not args.check_inputs)
        if args.check_inputs:
            print(f"SOURCE_INPUTS_VALID source_sha256={source_sha}")
            return 0
        render_pdf(args.output.resolve(), source_sha)
    except (OSError, RuntimeError, ValueError) as exc:
        print(f"STORY_ARC_PDF_BUILD_FAILED: {exc}", file=sys.stderr)
        return 2

    print(f"PDF_RENDERED path={args.output.resolve()} source_sha256={source_sha}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
