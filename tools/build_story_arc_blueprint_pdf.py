#!/usr/bin/env python3
"""Render the current story-arc Markdown owner as a human-facing PDF derived view."""

from __future__ import annotations

import argparse
import hashlib
import json
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
    "bg_greenhouse_field_base",
    "DuelPracticumRoot",
    "FestivalCanopyRoot",
    "WRITE_OR_SELECT_GLYPHS_TO_LAYERED_CIRCLES_TO_TARGET_TO_EXPLICIT_CAST_TO_CLOCK_RESULT",
    "RULESET_PENDING",
    "human_pdf_derivative",
)
RUNTIME_CAPTURES = {
    "first_class": ROOT / "artifacts/runtime/2026-09-01-first-class-glyph-input-runtime-1280x720.png",
    "first_class_gate": ROOT / "artifacts/runtime/2026-09-01-first-class-glyph-gate-1280x720.png",
    "duel": ROOT / "artifacts/runtime/2026-09-01-duel-practicum-1280x720-v2.png",
    "festival": ROOT / "artifacts/runtime/2026-09-01-festival-canopy-1280x720-v3.png",
    "story_event": ROOT / "artifacts/runtime/2026-09-02-story-event-greenhouse-environment-runtime-1280x720.png",
}

DETAILED_REVIEW_PAGE_COUNT = 32


def canonical_source_sha256(source_text: str) -> str:
    """Hash UTF-8 source content independent of Git's clean CRLF checkout conversion."""
    normalized = source_text.replace("\r\n", "\n").replace("\r", "\n")
    return hashlib.sha256(normalized.encode("utf-8")).hexdigest().upper()


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--source", type=Path, default=DEFAULT_SOURCE)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--record-render-validation",
        action="store_true",
        help="Record a completed external raster-render review for an already-rendered PDF.",
    )
    parser.add_argument(
        "--rendered-page-count",
        type=int,
        default=0,
        help="Exact page count emitted by the external raster renderer when recording review.",
    )
    parser.add_argument(
        "--visually-inspected-pages",
        default="",
        help="Comma-separated one-based PDF pages directly checked after rendering.",
    )
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


def _file_sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def _parse_page_numbers(raw: str) -> list[int]:
    if not raw.strip():
        return []
    try:
        pages = sorted({int(value.strip()) for value in raw.split(",") if value.strip()})
    except ValueError as exc:
        raise ValueError("visually inspected pages must be comma-separated integers") from exc
    if any(page < 1 or page > DETAILED_REVIEW_PAGE_COUNT for page in pages):
        raise ValueError("visually inspected pages must be within the detailed PDF page range")
    return pages


def write_render_manifest(output: Path, source_sha: str, rendered_page_count: int, inspected_pages: list[int]) -> Path:
    if not output.is_file():
        raise ValueError(f"PDF output is missing: {output}")
    if rendered_page_count != DETAILED_REVIEW_PAGE_COUNT:
        raise ValueError(f"rendered page count must be {DETAILED_REVIEW_PAGE_COUNT}")
    if not inspected_pages:
        raise ValueError("at least one visually inspected page is required")

    manifest_path = output.with_suffix(".manifest.json")
    manifest = {
        "schema_version": 1,
        "artifact_kind": "HUMAN_GDD_PDF_DERIVED_VIEW",
        "state": "DERIVED__SOURCE_SHA_RECORDED__RENDER_VALIDATED",
        "source": {
            "path": str(DEFAULT_SOURCE.relative_to(ROOT)).replace("\\", "/"),
            "sha256": source_sha,
            "sha256_algorithm": "SHA256_UTF8_LF_NORMALIZED",
            "authority": "CANONICAL_MARKDOWN_OWNER",
        },
        "pdf": {
            "path": str(output.relative_to(ROOT)).replace("\\", "/") if output.is_relative_to(ROOT) else str(output),
            "sha256": _file_sha256(output),
            "size_bytes": output.stat().st_size,
            "page_count": DETAILED_REVIEW_PAGE_COUNT,
            "page_size": "A4_LANDSCAPE",
            "title": "GRIMOIRE 첫 세션 스토리 아크 블루프린트",
            "tagged_pdf": False,
        },
        "generator": {
            "path": "tools/build_story_arc_blueprint_pdf.py",
            "runtime": "Bundled workspace Python with ReportLab for rendering; external Poppler raster review recorded separately",
            "font": "Malgun Gothic / Malgun Gothic Bold",
            "operation_marker": "edit/pdf expected-output-count=1",
        },
        "publication_profile": {
            "edition": "DETAILED_REVIEW_EDITION",
            "page_count_target": DETAILED_REVIEW_PAGE_COUNT,
            "scope": "CURRENT_STORY_ARC_SCREEN_STATE_INPUT_FLOW_ASSET_RUNTIME_AND_EVIDENCE_REVIEW",
            "comparison_basis": {
                "previous_current_derived_view_page_count": 7,
                "retained_long_horizon_reference": "output/pdf/grimoire_HUMAN_GAME_BLUEPRINT_20260830.pdf",
                "rule_boundary": "Current Circle/Clock/Story core is retained; superseded active Star runtime is not restored.",
            },
        },
        "runtime_evidence_reused": [str(path.relative_to(ROOT)).replace("\\", "/") for path in RUNTIME_CAPTURES.values()] + ["docs/validation/STORY_ARC_FIRST_SESSION_RUNTIME_RECEIPT_2026-09-01.md"],
        "render_validation": {
            "status": "ALL_PAGES_RASTER_RENDERED__SELECTED_LAYOUTS_VISUALLY_INSPECTED",
            "renderer": "Poppler pdftoppm",
            "dpi": 150,
            "page_count_rendered": rendered_page_count,
            "visual_review": "PASS__EXPLICIT_REVIEW_PAGE_SET_RECORDED",
            "final_page_review": {
                "updated_and_inspected": inspected_pages,
                "all_pages_rendered": True,
                "inspection_result": "NO_CLIPPED_OR_OVERLAPPING_TEXT_OR_MISSING_CONTENT_OBSERVED_IN_EXPLICIT_REVIEW_PAGE_SET",
            },
        },
        "evidence_boundary": {
            "pdf_visual_render": "VERIFIED",
            "tagged_pdf_reading_order": "NOT_RUN",
            "screen_reader": "NOT_RUN",
            "game_human_device_accessibility_performance_export": "NOT_RUN",
            "note": "This human PDF is a presentation artifact and does not promote the cited Godot evidence beyond its original runtime receipt.",
        },
    }
    manifest_path.write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")
    return manifest_path


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
        pdf.drawRightString(
            page_width - margin,
            13,
            f"source SHA-256 {source_sha[:12]}…  |  {page_number} / {DETAILED_REVIEW_PAGE_COUNT}",
        )

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
        "첫 세션 route, 기존 온실 환경의 첫 실습 재사용, 결투 연습 배경 02는 구현·자동 검증·1280×720 에디터 관찰까지 완료. "
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
    section_label("첫 실습 — 온실은 배경, 글자·시계·대상은 live UI", 444, page_height - 84)
    fit_image(RUNTIME_CAPTURES["story_event"], 444, 310, 360, 202)
    rounded_box(margin, 102, page_width - margin * 2, 165, pale_gold, gold, 10)
    section_label("이미지와 기능 UI를 분리한 이유", margin + 20, 239)
    y = 217
    y = draw_bullet("첫 수업은 직접 글자 쓰기 패널에 도안을 함께 보여 주어, 입력 방법을 추측하지 않게 한다.", margin + 20, y, page_width - margin * 2 - 40)
    y = draw_bullet("첫 실습은 기존 온실 환경을 바이트 변경 없이 재사용하고, 입력을 가로채지 않는 TextureRect·veil·live Control 순서로 장소성과 조작성을 함께 보장한다.", margin + 20, y - 6, page_width - margin * 2 - 40)
    draw_bullet("결투는 별도 environment-only 자산과 같은 live UI 원칙을 사용한다. 학생끼리의 안전한 대응 연습이며 카드 상세 게임과 결합하지 않는다.", margin + 20, y - 6, page_width - margin * 2 - 40)
    draw_footer(5)
    pdf.showPage()

    # Page 6 — festival and assets.
    draw_header("실제 화면 증거와 자산 경계", "축제는 비전투 공동 복구 · 새 아트는 소비처가 생길 때만 후보 제작")
    fit_image(RUNTIME_CAPTURES["festival"], margin, 234, 438, 246)
    rounded_box(500, 234, page_width - margin - 500, 246, soft_gray, HexColor("#BFC8D6"), 10)
    section_label("자산 상태", 518, 452)
    asset_rows = [
        ("결투 cloister 02", "USER_APPROVED · CANON_REGISTERED · IMPLEMENTED · RUNTIME_BOUND"),
        ("첫 실습 field base", "existing WebP reused · StoryEventRoot runtime bound · rights review pending"),
        ("수업/축제 계획 레퍼런스", "planning reference only · live UI owns all text/state"),
        ("카드/새 필요 이미지", "card rules remain RULESET_PENDING · candidate는 consumer·rights·layer preflight 뒤에만 제작"),
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
        ("자동/에디터", "34 GUT suites · 1,456 assertions · 1280×720 editor capture", "runtime receipt와 첫 실습 배경 결속 검증이 소유"),
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
    pdf.showPage()

    # Pages 8–32 deliberately turn the canonical owner and the verified runtime
    # into a reviewable, screen-level blueprint.  They do not add game rules:
    # their job is to expose the concrete state, input, recovery, ownership and
    # evidence boundaries that were too compressed in the original seven-page
    # derived view.
    def draw_detail_page(
        page_number: int,
        title: str,
        kicker: str,
        promise: str,
        cards: list[tuple[str, str]],
        anchor: str,
    ) -> None:
        draw_header(title, kicker)
        rounded_box(margin, 438, page_width - margin * 2, 72, pale_blue, blue, 10)
        section_label("이 페이지에서 확인할 것", margin + 18, 487)
        draw_text_block(promise, margin + 18, 467, page_width - margin * 2 - 36, 9.3, ink, 12.5)

        card_width = (page_width - margin * 2 - 16) / 2
        card_height = 134
        card_positions = (
            (margin, 278),
            (margin + card_width + 16, 278),
            (margin, 128),
            (margin + card_width + 16, 128),
        )
        for index, ((heading, body), (x, y)) in enumerate(zip(cards, card_positions)):
            fill = pale_gold if index in (1, 2) else soft_gray
            stroke = gold if index in (1, 2) else HexColor("#C9D1DD")
            rounded_box(x, y, card_width, card_height, fill, stroke, 9)
            pdf.setFillColor(navy)
            pdf.circle(x + 20, y + card_height - 22, 10, stroke=0, fill=1)
            pdf.setFillColor(white_ink)
            pdf.setFont("MalgunBold", 8.5)
            pdf.drawCentredString(x + 20, y + card_height - 25, str(index + 1))
            pdf.setFillColor(ink)
            pdf.setFont("MalgunBold", 10.2)
            pdf.drawString(x + 37, y + card_height - 27, heading)
            draw_text_block(body, x + 18, y + card_height - 50, card_width - 36, 8.55, muted, 11.6)

        rounded_box(margin, 54, page_width - margin * 2, 48, navy, navy, 8)
        pdf.setFillColor(gold)
        pdf.setFont("MalgunBold", 8.6)
        pdf.drawString(margin + 16, 83, "IMPLEMENTATION ANCHOR")
        draw_text_block(anchor, margin + 16, 68, page_width - margin * 2 - 32, 8.2, white_ink, 10.5)
        draw_footer(page_number)
        pdf.showPage()

    # Page 8 — how to use this detailed edition.
    draw_detail_page(
        8,
        "상세판 읽는 법과 정본 경계",
        "32-page detailed review edition · long-horizon legacy blueprint와 역할 분리",
        "이 문서는 새 정본이 아니다. 현재 Markdown 설계·Godot 씬·데이터·검증 영수증을 한 화면씩 검토하기 위한 파생 뷰이며, 오래된 32페이지 장기 기획서의 밀도는 계승하되 폐기된 별형 주문 규칙은 되살리지 않는다.",
        [
            ("정본 우선순위", "결정과 범위는 story-arc Markdown 설계가 소유한다. 이 PDF의 문장이나 도형이 코드·데이터·사용자 승인보다 앞서지 않는다."),
            ("상태 표기", "IMPLEMENTED는 현재 씬/스크립트가 존재함, MACHINE_VERIFIED는 자동 검증, EDITOR_RUNTIME_OBSERVED는 1280×720 관찰이다. Human·Device·Accessibility·Performance·Export는 별도다."),
            ("과거 자료의 위치", "이전 32페이지 PDF는 장기 세계관/구성 참고로 보존한다. 현재 게임의 활성 코어는 Circle·Clock·Story이고, 별형 주문은 legacy save 보존 외의 활성 UI로 복귀하지 않는다."),
            ("리뷰 순서", "플로우 → 화면별 입력/잠금 → 서클/시계 결과 → 자산/소비처 → Godot 경계 → 증거와 미검증 순으로 읽으면, 실제 무엇을 수정해야 하는지 바로 추적할 수 있다."),
        ],
        "Canonical owner: docs/superpowers/specs/2026-09-01-story-arc-blueprint-design.md · current derived output: output/pdf/GRIMOIRE_STORY_ARC_BLUEPRINT_2026-09-02.pdf",
    )

    # Page 9 — end-to-end route and re-entry invariants.
    draw_detail_page(
        9,
        "스토리 라우트와 재진입 규칙",
        "StoryProgress owns the only first-session route",
        "플레이어는 메인 화면에서 활동을 고르는 대신 현재 기록의 다음 이야기로 들어간다. 각 장면은 직전 beat와 필요한 해결 상태를 확인한 뒤에만 다음 씬으로 넘기며, 순서를 건너뛰는 직접 진입은 허용하지 않는다.",
        [
            ("새 기록", "StoryProgress.create_new()는 ADMISSION_PROLOGUE에서 시작한다. 새 기록은 즉시 입학식 씬을 가리키며 수업·실습·결투·축제 선택 메뉴를 노출하지 않는다."),
            ("이어하기", "유효한 StoryProgress가 있을 때만 이어하기가 활성화된다. 저장된 current_beat의 next_scene_path()가 다음 장면을 단일하게 결정한다."),
            ("순서", "ADMISSION_PROLOGUE → FIRST_CLASS → FIRST_EVENT → DUEL_PRACTICUM → FESTIVAL_CANOPY. 각 advance_* 메서드는 요구 beat가 아니면 *_CONTINUATION_UNAVAILABLE를 돌려준다."),
            ("장면 인계", "각 전환은 root meta handoff로 progress를 전달하고 consume 시점에 제거한다. 잘못된 beat 또는 누락된 handoff는 null로 처리되어 장면이 임의의 진행 상태를 만들지 않는다."),
        ],
        "Runtime owner: src/core/story/story_progress.gd · scene paths: admission_prologue.tscn, first_class_root.tscn, story_event_root.tscn, duel_practicum_root.tscn, festival_canopy_root.tscn",
    )

    # Page 10 — front door anatomy.
    draw_detail_page(
        10,
        "SCREEN-01 · 스토리 프런트 도어",
        "새 게임 / 이어하기 / 설정 / 도감 / 종료 — 이야기 선택은 없음",
        "메인 화면은 이야기의 문이지 활동 선택 허브가 아니다. 버튼은 새 기록, 유효 기록 이어하기, 도감, 설정, 종료만 제공하고, 수업/실습/결투/축제를 직접 배치하지 않는다.",
        [
            ("새 기록 시작", "NEW_RECORD_READY와 새 StoryProgress를 만들고 입학식 경로를 요청한다. 전환은 route_requested 신호와 ResourceLoader.exists 확인 뒤에만 실행한다."),
            ("이야기 이어하기", "저장 progress가 유효하지 않으면 버튼은 disabled이며 힌트가 보인다. 유효한 경우 해당 beat의 다음 씬으로 이어져 선택지가 아니라 기록을 복원한다."),
            ("도감", "ArchiveOverlay를 같은 front door 위에 열고 돌아오면 원래 Content를 복원한다. 도감은 보유/해금 정보를 읽는 창이며 카드 대결을 시작시키지 않는다."),
            ("종료 확인", "종료는 ConfirmationDialog를 거친다. 취소와 확정이 분리되어 있으며, 확정 신호와 실제 tree.quit()는 같은 사용자 의도 뒤에만 발생한다."),
        ],
        "Runtime owner: src/ui/front_door/story_front_door.gd · visible_action_ids() is the UI contract · current scene: res://src/ui/front_door/story_front_door.tscn",
    )

    # Page 11 — front door states and recovery.
    draw_detail_page(
        11,
        "SCREEN-01 상태표 · 빈 기록과 복구",
        "front door must explain unavailable Continue rather than guess a route",
        "메인 화면의 중요한 상태는 ‘저장 있음/없음’이다. 이것은 막힌 메뉴가 아니라, 처음 온 학생과 돌아온 학생을 구분해 이야기의 시작점을 명확히 하는 장치다.",
        [
            ("기록 없음", "이어하기 버튼은 계속 보이지만 비활성이고 ResumeHint가 보인다. 유효하지 않은 객체를 억지로 첫 수업이나 실습으로 보내지 않는다."),
            ("기록 있음", "configure(progress)가 is_valid()인 StoryProgress만 보관한다. 이어하기는 current_beat에 맞는 경로를 계산해 사용자의 마지막 진행을 존중한다."),
            ("도감의 빈 상태", "현재 beat에서 card_unlocks()가 비어 있으면 도감은 빈 상태를 보여 준다. 해금 전 카드나 상세 룰을 ‘곧 시작’처럼 오해시키지 않는다."),
            ("복구 원칙", "잘못된 handoff/진행 객체는 유효하지 않은 것으로 취급한다. 데이터가 불완전할 때 새 의미를 추측해 생성하기보다 안전한 front door 상태로 돌아갈 수 있게 남긴다."),
        ],
        "Recovery boundary: StoryFrontDoor._is_valid_progress() and StoryProgress.is_valid() · persistence-format migration and actual save UI are separate evidence tasks, not claimed here.",
    )

    # Page 12 — admission.
    draw_detail_page(
        12,
        "SCREEN-02 · 입학식과 첫 약속",
        "AdmissionPrologue introduces the school before any mechanical test",
        "입학식은 튜토리얼 버튼 묶음이 아니라 ‘마법사로 살아가는 방식’을 처음 약속하는 장면이다. 플레이어는 관찰·선택·명시 시전·결과 복기의 언어를 먼저 듣고, 이후 수업에서 그 약속을 손으로 확인한다.",
        [
            ("서사 역할", "학교에 들어온 이유와 동료/교수의 첫 인상을 보여 준다. 결투나 실습을 독립 콘텐츠처럼 고르기 전, 각 장면이 한 학생의 첫날이라는 맥락을 얻는다."),
            ("UI 역할", "대화 상자는 배경과 분리된 live UI여야 한다. 배경에 대사·선택지·진행 문구를 굽지 않아 로컬라이즈, 되감기, 상태 변화에 대응한다."),
            ("전환 조건", "입학식의 명시적 진행만 FIRST_CLASS_ROUTE를 만든다. 다음 장면은 StoryProgress.stage_first_class_handoff()를 통해 첫 수업에 전달된다."),
            ("의도적 비범위", "입학식에서 전투 규칙, 카드 턴, 마력 분배 수치, 정답 주문을 확정하지 않는다. 그 정보는 현재 카드 RULESET_PENDING 및 후속 설계의 소유다."),
        ],
        "Route owner: StoryProgress.advance_from_admission() → FIRST_CLASS_ROUTE · dialogue visual direction remains a separate user-approved art/asset gate.",
    )

    # Page 13 — transition contract.
    draw_detail_page(
        13,
        "입학식 → 첫 수업 인계 계약",
        "a scene transition carries progress, not a hidden player choice",
        "스토리 전환은 ‘다음 장면 파일을 열기’보다 더 많은 일을 한다. 직전 beat가 올바른지, 진행 객체가 존재하는지, 한 번만 소비되는 인계인지 확인하여 이후 화면이 독립 메뉴처럼 오작동하지 않게 한다.",
        [
            ("준비", "advance_from_admission()는 current beat가 ADMISSION_PROLOGUE일 때만 FIRST_CLASS와 FIRST_CLASS_ROUTE를 만든다. 다른 beat에서는 현재 next_scene_path를 돌려 주며 전환을 거부한다."),
            ("전달", "stage_first_class_handoff(progress, owner)는 root에 전용 meta를 둔다. expected beat가 맞지 않거나 owner/progress가 없으면 FIRST_CLASS_PROGRESS_REQUIRED로 실패한다."),
            ("소비", "FirstClassRoot._ready()는 consume_first_class_handoff()를 읽는다. 소비 직후 meta를 제거하여 같은 인계를 두 번 재생하거나 뒤 장면이 옛 progress를 재사용하지 않는다."),
            ("화면 잠금", "첫 수업은 올바른 FIRST_CLASS progress와 글자 수용이 모두 있어야 실습 계속 버튼을 열어 준다. 단순한 ‘다음’ 버튼이 스토리 계약을 건너뛰지 못한다."),
        ],
        "Implementation anchors: StoryProgress._stage_handoff/_consume_handoff and FirstClassRoot.configure() · verified route assertions are owned by the story-arc runtime receipt.",
    )

    # Page 14 — classroom.
    draw_detail_page(
        14,
        "SCREEN-03 · 첫 수업의 목표와 배치",
        "first class teaches looking, tracing, recognition, and explicit acceptance",
        "첫 수업은 서클을 완성시키는 시험이 아니라, 직접 쓴 글자가 이후 사건에서 무엇을 바꾸는지 이해시키는 안전한 연습이다. 화면은 글자 도안, 허공 필기, 인식 후보, 수용 상태, 다음 실습 안내를 서로 다른 live 영역으로 둔다.",
        [
            ("수업 대상", "현재 수업에서 허용한 글자는 HEAT와 PROTECT다. 허용 집합을 코드로 명시해, 임의의 글자나 교수의 답안을 정답처럼 입력하는 일을 막는다."),
            ("입력 안내", "컨텍스트 힌트는 ‘첫 수업의 글자를 허공에 새기세요. 인식 후보를 고른 뒤, 글자로 사용할 때만 온실 실습이 열립니다.’로, 그림-입력-이유를 한 화면에서 연결한다."),
            ("수용 게이트", "glyph_accepted 신호가 허용 글자를 전달할 때만 _lesson_glyph_accepted가 true가 된다. 계속 버튼은 유효 progress와 수용 상태가 모두 true일 때만 활성화된다."),
            ("학습 효과", "손으로 그린 결과가 다음 실습에 실제로 연결되므로, 마법은 목록에서 고르는 명령이 아니라 관찰하고 새기는 행위로 먼저 기억된다."),
        ],
        "Runtime owner: src/ui/story/first_class_root.gd · allowed glyph ids: HEAT, PROTECT · consumer: LessonPanel/Lesson/GlyphWritingPanel",
    )

    # Page 15 — observed direct glyph UI.
    draw_header("SCREEN-03 실제 화면 · 직접 글자 쓰기", "1280×720 editor-runtime capture · 안내, 입력, 인식, 수용을 한 화면에서 검토")
    fit_image(RUNTIME_CAPTURES["first_class_gate"], margin, 238, 460, 259)
    rounded_box(516, 360, page_width - margin - 516, 137, pale_gold, gold, 9)
    section_label("무엇을 먼저 보나", 532, 470)
    draw_text_block("도안이 실제 입력 패널 가까이에 있는지, 플레이어가 ‘어떤 획을 그려야 하는지’를 대사만으로 추측하지 않는지 확인한다.", 532, 448, page_width - margin - 548, 8.6, ink, 11.5)
    rounded_box(516, 238, page_width - margin - 516, 105, soft_gray, HexColor("#C9D1DD"), 9)
    section_label("현재 증거의 한계", 532, 318)
    draw_text_block("이 캡처는 에디터 runtime 관찰이다. 실제 터치 기기에서의 손가락 가림, 지연, 접근성 보조기기, 다양한 해상도는 아직 별도 검증이다.", 532, 296, page_width - margin - 548, 8.4, muted, 11.2)
    for index, (heading, body) in enumerate((
        ("도안", "목표 글자의 획과 형태를 보고 따라 쓴다."),
        ("입력", "마우스/터치 드래그가 실제 스트로크로 들어온다."),
        ("인식", "후보를 확인한 뒤 사용 글자로 명시 수용한다."),
        ("전환", "수용 전에는 온실 실습으로 넘어가지 않는다."),
    )):
        x = margin + (index % 2) * 390
        y = 112 - (index // 2) * 42
        pdf.setFillColor(HexColor("#E7EDF6"))
        pdf.roundRect(x, y, 370, 31, 6, stroke=0, fill=1)
        pdf.setFillColor(ink)
        pdf.setFont("MalgunBold", 8.4)
        pdf.drawString(x + 10, y + 18, heading)
        pdf.setFillColor(muted)
        pdf.setFont("Malgun", 7.7)
        pdf.drawString(x + 62, y + 18, body)
    draw_footer(15)
    pdf.showPage()

    # Page 16 — glyph input state and edge handling.
    draw_detail_page(
        16,
        "글자 입력 상태와 실패 회복",
        "visible guide + local coordinate handling + no accidental double input",
        "직접 쓰기는 장식이 아니라 첫 번째 실습 게이트다. 플레이어가 그릴 도안을 보고, 스트로크를 남기고, 인식 후보를 확인하고, 하나를 수용하는 단계가 구분되어야 한다.",
        [
            ("입력 시작", "패널은 마우스와 터치의 위치를 패널 지역 좌표로 해석한다. 스크롤/창 전체 좌표를 그대로 쓰지 않아 입력이 화면의 다른 곳으로 밀리는 문제를 줄인다."),
            ("스트로크 기록", "드래그 중 수집한 획은 시각적으로 남는다. 아주 미세한 이동은 정규화된 임계값으로 걸러, 의도하지 않은 점/중복 샘플이 후보 인식을 흐리지 않게 한다."),
            ("후보와 수용", "인식 결과는 자동 시전이 아니다. 플레이어가 후보를 고른 뒤 glyph_accepted로 수용해야 다음 단계에 반영된다. 교수가 정답을 대신 클릭하지 않는다."),
            ("예외 처리", "허용하지 않은 glyph_id, 비어 있는 입력, 수용 전 계속 시도는 다음 장면을 열지 않는다. 실패는 벌점보다 다시 보고 그릴 수 있는 현재 화면 상태로 남긴다."),
        ],
        "Runtime evidence owner: docs/validation/STORY_ARC_FIRST_SESSION_RUNTIME_RECEIPT_2026-09-01.md · input/device Human validation remains NOT_RUN.",
    )

    # Page 17 — practicum setup.
    draw_detail_page(
        17,
        "SCREEN-04 · 첫 실습: 서리 묘목 사건",
        "the greenhouse is the first practicum, not the whole game",
        "온실과 서리 묘목은 첫 번째 실습 사건이다. 이 장면은 수업에서 익힌 글자와 서클/시계 사고를 처음 묶어 보되, 게임의 메인이 온실에 갇히지 않도록 이후 결투 연습과 축제로 명확히 연결한다.",
        [
            ("사건 맥락", "FROST_SEEDLINGS는 현재 실습의 유일한 대상이다. 플레이어는 수업에서 본 HEAT/PROTECT를 바탕으로 묘목을 돌볼 방법을 준비한다."),
            ("화면의 역할", "기존 bg_greenhouse_field_base.webp가 StoryEventRoot/EnvironmentBackground를 채운다. 그 위에서 글자 입력·서클 Preview·대상·시전·Goal/Threat은 별도 live UI가 맡는다. 배경에 숫자나 기능 텍스트를 굽지 않는다."),
            ("진행 순서", "글자 선택 또는 입력 → 서클 Preview → 대상 지정 → 명시 시전 → 시계 결과/복기. 앞 단계가 없으면 뒤 행동 버튼은 활성화되지 않는다."),
            ("다음 장면", "실습 행동이 한 번 해결되면 결투 연습으로 handoff한다. 실습을 반복 파밍하거나 여러 사건 중 하나를 고르는 구조는 이 첫 세션 범위에 넣지 않는다."),
        ],
        "Runtime owner: StoryEventRoot/EnvironmentBackground (existing WebP, MOUSE_FILTER_IGNORE, aspect-covered) · event: frostbloom_event_01.tres · target: FROST_SEEDLINGS",
    )

    # Page 18 — target selection.
    draw_detail_page(
        18,
        "첫 실습 · 대상 지정과 잠금 이유",
        "Preview exists before target; target exists before cast",
        "대상 지정은 꾸미기 버튼이 아니다. 준비한 서클이 무엇에 작용하는지 확인하는 단계이며, Preview만 보고 자동으로 묘목에 마법을 쓰는 흐름을 피한다.",
        [
            ("글자 선택", "select_glyph()는 현재 FIRST_EVENT progress, 유효 glyph metadata, 중복 여부, 최대 글자 수를 검사한다. 선택을 바꾸면 Preview와 대상은 함께 초기화된다."),
            ("Preview 선행", "request_circle_preview()는 유효한 CircleComposition이 있을 때만 PREVIEW_READY를 만든다. Preview 전 Target 버튼은 비활성이며, 사용자는 결과의 전제를 보지 못한 채 목표를 고르지 않는다."),
            ("대상 검증", "select_target()은 현재 사건의 _event_target_id()와 정확히 같은 대상만 받는다. 이 첫 실습에서 임의의 교실 오브젝트나 동료에게 시전하는 경로는 없다."),
            ("재선택", "글자를 추가/변경하면 이전 Preview·대상·prepared action id가 지워진다. 다른 조합의 결과를 옛 대상 선택에 몰래 붙이는 상태 혼선을 막는다."),
        ],
        "Implementation anchors: StoryEventRoot.select_glyph(), request_circle_preview(), select_target(), _clear_preview_and_target() · UI paths: GlyphWritingPanel and ActionPanel target control.",
    )

    # Page 19 — circle.
    draw_detail_page(
        19,
        "서클 엔진 · 1–3 역할 없는 겹서클",
        "Circle is the active composition engine; it replaces active Star UI",
        "현재 마법 조합의 중심은 1–3개의 동등한 레이어 서클이다. 글자는 칸의 역할명에 끼워 넣는 재료가 아니라 층을 이룬 구성 요소이며, 플레이어가 먼저 이해해야 할 것은 ‘무엇을 겹쳐 어떤 방법을 만들었는가’다.",
        [
            ("구성 단위", "CircleComposition은 선택된 glyph ids를 받아 유효성 검사를 한다. 실제 사건 화면은 선택 글자 수가 최대치를 넘으면 GLYPH_LIMIT_REACHED로 더 고르지 못하게 한다."),
            ("역할 없음", "메인/보조/별꼭짓점 같은 노출 모델로 되돌아가지 않는다. 1–3 겹의 층은 모두 동등하며, 사용자는 선택한 글자와 구성 서명을 Preview에서 확인한다."),
            ("별형 주문의 경계", "과거 Star 관련 데이터는 레거시 저장 호환을 위해 보존될 수 있으나, 새 Story front door·실습·결투의 활성 UI와 규칙에 재도입하지 않는다."),
            ("플레이어 언어", "내부 타입 이름보다 ‘글자’, ‘서클’, ‘Preview’, ‘대상’, ‘시전’을 우선한다. 이 번역은 규칙을 숨기는 것이 아니라 입문 순서를 사람이 이해하는 언어로 바꾸는 것이다."),
        ],
        "Active core decision: GM-CIRCLE-CLOCK-CARD-CORE-01 · implementation modules: src/core/circle/ · legacy-save preservation is distinct from active feature restoration.",
    )

    # Page 20 — circle preview.
    draw_detail_page(
        20,
        "서클 Preview · 시전 전의 약속",
        "a readable preview must bind composition, method, risk context, and target readiness",
        "Preview는 성공 연출이 아니라 ‘이 조합으로 무엇을 하려는지’ 확인하는 계약이다. 아직 시전하지 않았으며, 여기서 조합을 바꾸면 대상과 prepared action도 새로 준비해야 한다.",
        [
            ("생성 조건", "선택 glyphs로 CircleComposition을 만들 수 없으면 CIRCLE_REQUIRED 또는 validation status가 반환된다. 빈 구성에서 Preview 버튼이 성공처럼 보이지 않는다."),
            ("위험 맥락", "CircleCompositionResolver.preview()는 현재 사건의 threat_clock_id를 risk_tags로 받는다. Preview는 서클 자체만이 아니라 이 사건에서 감수할 위험 문맥을 함께 보여 줄 수 있다."),
            ("준비 action", "Preview가 준비되면 _next_prepared_action_id()가 만들어진다. 이 식별자는 사용자가 확인한 조합·대상·시전의 한 번짜리 행동을 이어 주는 실무적 경계다."),
            ("화면 표현", "UI는 composition signature와 선택 글자명을 보여 준다. 숫자/수식만 남기지 말고, ‘서클 글자: …’와 Preview 상태가 다음 버튼의 이유를 설명해야 한다."),
        ],
        "Runtime owner: src/core/circle/circle_composition_resolver.gd and StoryEventRoot.request_circle_preview() · Preview does not consume mana or resolve an event.",
    )

    # Page 21 — clock.
    draw_detail_page(
        21,
        "사건 시계 엔진 · Goal과 Threat",
        "pressure and relief are both visible; they are not a generic timer",
        "사건 시계의 핵심은 원형 UI가 아니라 누적된 상황을 보고 다음 행동을 바꾸게 하는 것이다. 각 사건은 목표의 진전과 위협의 누적을 함께 가질 수 있고, 좋은 결과가 위험의 존재를 지우거나 위험이 성공을 취소하지 않는다.",
        [
            ("Goal", "목표 시계는 사건을 해결하는 쪽의 진전을 나타낸다. 플레이어는 어떤 글자/방법이 현재 사건의 목표에 알맞은지 Preview와 결과 태그를 통해 배운다."),
            ("Threat", "위협 시계는 시간 경과 자체가 아니라 이 사건에서 발생한 압박/대가를 표현한다. 원인은 숫자만 아니라 장면 변화·대사·대상 반응으로 함께 전달되어야 한다."),
            ("혼합 결과", "한 행동이 Goal을 진전시키면서 Threat를 올릴 수 있다. 이 경우 성공을 되돌리거나 ‘실패라서 모두 무효’로 처리하지 않고, 성취와 대가를 같은 복기에 남긴다."),
            ("범위", "총 칸 수, 카드와의 상호작용, 마력 분배, 확률/피해 공식은 여기서 새로 확정하지 않는다. 현재 엔진이 가진 사건 정의와 다음 상세 규칙 결정을 분리한다."),
        ],
        "Runtime modules: src/core/events/event_clock_state.gd and event_clock_resolver.gd · UI consumer: ActionPanel/EventClockView · card combat rules remain RULESET_PENDING.",
    )

    # Page 22 — commit / idempotency.
    draw_detail_page(
        22,
        "명시 시전 · 한 번만 해결되는 행동",
        "Commit is visible, target-bound, and idempotent",
        "시전은 자동 추천·자동 대상·자동 소비가 아니다. Preview와 대상 지정 뒤에만 사용자가 Commit을 누르고, 같은 action을 재시도해도 사건 시계가 두 번 변하지 않도록 결과 영수증을 돌려준다.",
        [
            ("시전 전 검사", "request_commit()은 FIRST_EVENT progress, PREVIEW_READY, 선택 target, 준비된 action id를 차례대로 확인한다. 무엇이 빠졌는지는 PREVIEW_REQUIRED/TARGET_REQUIRED 등 상태로 드러난다."),
            ("해결", "EventClockResolver.resolve()는 action_id, target_id, Preview의 method_tags를 받는다. 이 시점에만 _clock_state가 새 resolution의 state로 바뀌고 결과가 화면에 렌더된다."),
            ("중복 방지", "한 번 RESOLVED되면 _prepared_action_consumed가 true가 된다. 같은 시전 요청은 ALREADY_RESOLVED와 이전 visible consequence tags를 주며 실제 변화는 일으키지 않는다."),
            ("의미", "이 구조는 저장/네트워크 환경에서도 같은 입력이 중복되어 시계나 자원이 두 번 소비되는 위험을 줄이는 기초다. 현재는 runtime 계약이며 온라인 동기화 기능을 주장하지 않는다."),
        ],
        "Implementation owner: StoryEventRoot.request_commit(), _resolve_previewed_action(), _repeat_prepared_action() · explicit action id prefixes: frost-action / duel-action.",
    )

    # Page 23 — result and route.
    draw_detail_page(
        23,
        "결과·복기·다음 이야기 전환",
        "the receipt shows change before it permits continuation",
        "결과 화면은 단순 성공 문구가 아니라 시계와 대상에 실제로 생긴 변화를 읽어 주는 곳이다. 해결된 행동 뒤에만 다음 장면 버튼이 열리므로, 플레이어는 자신의 선택이 사건의 한 장면을 마쳤다는 것을 확인하고 결투 연습으로 간다.",
        [
            ("결과 영수증", "last_result와 state_snapshot은 현재 결과를 보관한다. ResultReceipt에는 visible consequence tags를 표시하며, 이미 해결된 시전은 ‘변화는 없습니다’라는 반복 안내를 붙인다."),
            ("시계 렌더", "EventClockView는 초기에는 definition과 snapshot을 configure하고, 해결 뒤에는 apply_resolution으로 바뀐 상태를 적용한다. 데이터와 화면이 서로 다른 결과를 말하지 않게 한다."),
            ("계속 잠금", "첫 실습의 ContinueToDuelButton은 _prepared_action_consumed 전에는 disabled다. 시전하지 않았거나 실패한 준비 단계에서 결투로 건너뛰는 ‘빈 완료’를 막는다."),
            ("handoff", "advance_from_first_practicum() → DUEL_PRACTICUM_ROUTE → stage_duel_practicum_handoff() 순서로 다음 씬에 progress를 전달한다. 결투는 새 메인 메뉴가 아니라 실습의 다음 문단이다."),
        ],
        "Runtime owner: StoryEventRoot._render_clock_state(), _render_receipt(), continue_to_duel_practicum() · actual outcome copy and final balance tuning remain human-playtest work.",
    )

    # Page 24 — duel promise.
    draw_detail_page(
        24,
        "SCREEN-05 · 학생 결투 연습의 약속",
        "supervised practice, not a lethal battle mode or card-game shortcut",
        "학생끼리의 결투는 전투 시스템을 처음 시험하는 안전한 연습이다. 상대를 처치하는 반복 전투나 카드의 상세 승패 규칙을 넣지 않고, 동료의 수호 결계라는 대상에 대응하며 서클·시계·명시 시전의 의미를 확장한다.",
        [
            ("사건 대상", "결투 연습의 현재 target은 DUEL_WARD다. 플레이어는 동료의 수호 결계를 다룰 글자를 허공에 새기며, 상대 학생을 자동 타깃으로 삼지 않는다."),
            ("허용 글자", "이 장면은 PROTECT와 FLOW만 허용한다. 첫 수업/실습의 모든 글자를 무조건 재사용시키지 않아, 장면마다 어떤 방법이 알맞은지 생각하게 한다."),
            ("진행 계약", "DuelPracticumRoot는 StoryEventRoot를 상속해 글자 선택 → Preview → 대상 → Commit → Clock 결과의 같은 핵심을 쓴다. 그래서 새로운 미니게임이 아니라 배운 언어의 응용이 된다."),
            ("안전한 비범위", "HP, 처치, 적 웨이브, 카드 턴, 마력 7/7/6 같은 고정 수치, 랭크 보상은 이번 범위에 없다. 카드 결투 상세 룰은 사용자가 제공한 뒤 별도 설계한다."),
        ],
        "Runtime owner: src/ui/story/duel_practicum_root.gd · event resource: res://data/events/duel/duel_practicum_event_01.tres · background is a separate approved environment asset.",
    )

    # Page 25 — duel screen details.
    draw_detail_page(
        25,
        "SCREEN-05 화면 상태 · 결투 배경과 live UI",
        "environment art provides place; functional UI owns all readable state",
        "결투 연습에서 중요한 구분은 배경 그림과 기능 UI의 분리다. 클로이스터 환경은 학생들이 연습하는 장소를 보이고, 글자/서클/시계/대상/결과/버튼은 해상도와 상태에 맞춰 바뀌는 live Control로 덧씌운다.",
        [
            ("환경 배경", "bg_duel_practice_cloister.png는 승인·정본 등록·구현·runtime bound 상태의 환경 전용 이미지다. 글자, 수치, 카드, 캐릭터, 표적을 baked 하지 않는다."),
            ("상태 변화", "배경이 동일해도 선택 글자, Preview signature, Target 버튼, Commit 가능 여부, Goal/Threat 변화는 런타임 UI가 갱신한다. 그래서 같은 장소가 반복 훈련/결과 복기에 재사용된다."),
            ("표현 우선순위", "대사와 선택지는 장식 테두리를 가진 분리된 대화창에 넣되, 입력과 시계의 가독성을 덮지 않는다. 배경에 남아 있는 문구는 상황이 바뀌어도 남는 문제를 피한다."),
            ("증거", "1280×720 에디터 runtime capture는 실제 적용을 보여 준다. 사람의 눈으로 터치 영역, 대비, 프레임, 피로도를 합격시킨 증거는 아직 아니다."),
        ],
        "Asset manifest: assets/manifests/story_arc_01_duel_practice_environment_candidate_02.json · runtime consumer: duel_practicum_root.tscn::DuelPracticumRoot/EnvironmentBackground",
    )

    # Page 26 — festival role.
    draw_detail_page(
        26,
        "SCREEN-06 · 축제: 전투 밖의 공동 복구",
        "FestivalCanopy concludes the first day without turning it into a reward menu",
        "축제는 실습과 결투에서 배운 ‘상황을 보고, 방법을 고르고, 결과를 책임지는’ 태도를 공동체 장면으로 되돌리는 결말이다. 전투의 승리 보상 표가 아니라 학생이 학교에 머무를 이유를 느끼게 하는 비전투 후일담이다.",
        [
            ("서사 기능", "입학식의 낯섦에서 시작한 첫날을 학교 구성원과 함께 정리한다. 수업·온실·결투가 따로 노는 과제가 아니라 같은 학교 생활의 다른 장면임을 묶는다."),
            ("UX 기능", "축제 화면은 앞선 선택의 맥락을 말로 복기하고, 첫 세션을 명시적으로 확인한다. 복잡한 시스템 메뉴를 한꺼번에 여는 대신 다음 수업을 기대하게 하는 마침표다."),
            ("진행 조건", "FestivalCanopyRoot는 FESTIVAL_CANOPY progress가 없으면 확정하지 않는다. 결투 실습을 해결한 story handoff 뒤에만 축제 결말을 가진다."),
            ("현재 한계", "분기된 축제 결과, 관계 수치, 반복 이벤트, 장기 달력은 아직 이번 첫 세션 구현 범위에 포함하지 않는다. 후속 narrative system 설계가 필요하다."),
        ],
        "Runtime owner: src/ui/story/festival_canopy_root.gd · capture: artifacts/runtime/2026-09-01-festival-canopy-1280x720-v3.png · Human emotional-pacing review NOT_RUN.",
    )

    # Page 27 — festival closing state.
    draw_detail_page(
        27,
        "축제 종료 상태와 첫 세션 완료",
        "completion is a visible acknowledgement, not an automatic silent reset",
        "첫 세션의 끝은 다음 메뉴로 튕겨 나가는 것이 아니라, 플레이어가 스스로 첫 장을 기록했음을 확인하는 버튼으로 마무리된다. 이는 앞으로 이어질 사건/수업 루프를 위한 저장·회고 UX의 최소 기반이다.",
        [
            ("확정 전", "FESTIVAL_CANOPY progress가 없다면 FESTIVAL_CANOPY_PROGRESS_REQUIRED가 돌아온다. 순서를 지키지 않은 scene launch가 완료 상태를 위조하지 못한다."),
            ("확정 후", "ConfirmFirstSessionButton은 FIRST_SESSION_COMPLETE를 만든다. CompletionNotice는 ‘첫 장을 기록했습니다. 다음 수업은 새 사건과 함께 이어집니다.’를 보여 준다."),
            ("반복 방지", "확정 뒤 버튼을 disabled로 바꾼다. 같은 세션 완료를 여러 번 기록하거나 보상/다음 상태가 중복되는 흐름을 UI에서 먼저 차단한다."),
            ("후속 설계", "이 완료 신호가 실제 저장 파일, 다음 에피소드 unlock, 관계/도감/카드 정산과 어떻게 연결되는지는 별도 persistence와 content contract에서 명시해야 한다."),
        ],
        "Implementation anchor: FestivalCanopyRoot.confirm_first_session() · current status is runtime-complete for this slice, while save UX and next episode implementation remain separate work.",
    )

    # Page 28 — archive/cards.
    draw_detail_page(
        28,
        "도감과 카드 · 지금 구현된 것, 아직 아닌 것",
        "story-owned archive is real; the card duel rules are intentionally pending",
        "카드는 세계의 기록과 이후 미니게임의 씨앗으로 남긴다. 그러나 현 단계에서 도감 UI가 있다고 해서 섀도우버스/궨트식 대결 규칙, 턴, 승패, 마력 분배를 이미 확정한 것은 아니다.",
        [
            ("도감 소비처", "StoryFrontDoor는 ArchiveOverlay를 열고 CardArchiveScreen.configure_story_cards()에 현재 progress와 후보 cards를 전달한다. 화면은 스토리 소유 해금만 보여 준다."),
            ("해금 계약", "FIRST_EVENT 이후 StoryProgress.card_unlocks()는 ARCHIVE_FROSTBLOOM_WIZARD를 제공한다. CardDefinition의 story_unlock이 권위 unlock과 일치하지 않으면 목록에서 제외한다."),
            ("명확한 보류", "request_start_duel()은 RULESET_PENDING과 DETAILED_DUEL_RULES_PENDING을 반환한다. placeholder 대결을 실행하거나 임의의 7/7/6 수치를 게임 규칙으로 굳히지 않는다."),
            ("다음 설계 입력", "사용자가 카드 상세 룰을 제공하면, 비용/카드/행동/라운드/시계 상호작용/보상/저장/AI/밸런스와 테스트를 별도 L1 설계로 묶어야 한다."),
        ],
        "Runtime owner: src/ui/cards/card_archive_screen.gd · ruleset resource: res://data/cards/card_ruleset_01.tres · status text reads RULESET_PENDING.",
    )

    # Page 29 — visual/asset pipeline.
    draw_detail_page(
        29,
        "시각 자산과 UI 레이어 계약",
        "background art and functional text/state stay separate by default",
        "비어 보이는 화면을 장식용 글자가 박힌 배경으로 메우지 않는다. 배경은 장소·빛·질감·분위기를 담당하고, 대사·선택지·수치·시계·입력·목표·버튼은 실시간 UI가 맡아 어떤 상태에서도 읽히고 바뀌게 한다.",
        [
            ("학생 표현", "대화용 캐릭터는 학생다운 상반신 일러스트를 사용한다. SD 이동은 보류하며, 이동은 단순 2D 장면 전환/배경/지도 카드 방향을 유지한다."),
            ("필요 이미지", "새 이미지는 실제 consumer, 권리/provenance, 레이어 분리, 화면 상태군을 먼저 확인한 뒤 candidate를 제작한다. 생성 성공과 사용자 final lock/runtime binding을 같은 상태로 쓰지 않는다."),
            ("현재 환경 결속", "기존 bg_greenhouse_field_base.webp는 바이트 변경 없이 첫 실습 StoryEventRoot에 재사용됐다. 결투 클로이스터 환경 후보 02는 final lock 후 정본 등록·runtime bound까지 완료됐다. 두 화면 모두 기능 UI를 배경과 분리한다."),
            ("PDF의 역할", "이 문서의 도형/와이어프레임은 수정 가능한 설계 설명이다. 실제 게임 배경을 대신하는 벡터 그림이나 새 게임 raster asset로 사용하지 않는다."),
        ],
        "Visual state model: NEEDED → BRIEF_READY → GENERATED_CANDIDATE → REVIEWED → USER_APPROVED → CANON_REGISTERED → IMPLEMENTED → RUNTIME_VERIFIED",
    )

    # Page 30 — Godot composition.
    draw_detail_page(
        30,
        "Godot 씬·책임·입력 흐름",
        "screen roots compose domain cores; no second truth is introduced by the PDF",
        "유지보수의 핵심은 화면마다 임의 규칙을 복제하지 않는 것이다. StoryProgress가 story route를, Circle/Clock cores가 조합·해결을, 화면 root가 입력과 live Control 상태를, data resource가 사건 정의를 각각 소유한다.",
        [
            ("front door", "StoryFrontDoor는 새/이어하기/도감/설정/종료 UI와 route signal을 소유한다. 진행 계산은 StoryProgress에 위임하며, 도감은 overlay로만 붙인다."),
            ("story roots", "FirstClassRoot는 글자 수용 gate를, StoryEventRoot는 실습의 서클·시계 흐름을, DuelPracticumRoot는 같은 흐름의 결투 문맥을, FestivalCanopyRoot는 완료 확인을 소유한다."),
            ("domain cores", "CircleComposition/Resolver와 EventClockState/Resolver는 화면의 버튼 배치와 분리된 도메인 로직이다. UI가 바뀌어도 선택/Preview/해결/영수증의 계약을 테스트할 수 있다."),
            ("data/resources", "Frostbloom/duel .tres가 사건별 목표·위험 문맥을 제공한다. 화면 코드에 장기 밸런스 수치나 카드 대결 규칙을 하드코딩하지 않는다."),
        ],
        "Project main entry: res://src/ui/front_door/story_front_door.tscn · domain paths: src/core/story, src/core/circle, src/core/events, src/core/cards",
    )

    # Page 31 — persistence and traceability.
    draw_detail_page(
        31,
        "데이터·영수증·추적성 경계",
        "every visible change needs an owner and an evidence ceiling",
        "이 첫 세션은 ‘무슨 일이 일어났는지’를 StoryProgress, 사건 시계 snapshot, 결과 영수증, 도감 해금으로 분리해 다룬다. 단, 현재 구현이 실제 제품 저장/동기화/출시 품질까지 이미 증명한 것으로 확대 해석하지 않는다.",
        [
            ("진행 데이터", "StoryProgress.current_beat와 scene handoff가 첫날의 위치를 전달한다. available_front_door_actions()와 next_scene_path()는 어떤 화면을 열 수 있는지 명시한다."),
            ("행동 데이터", "prepared action id와 _prepared_action_consumed가 한 번의 시전을 식별한다. last_result/state_snapshot/visible consequence tags는 결과를 UI와 복기에 전달한다."),
            ("카드 데이터", "카드 정의는 story_unlock과 구성 signature를 가진다. 도감은 권위 있는 unlock과 일치한 정의만 표시하여 로컬 후보가 정본 해금을 우회하지 않게 한다."),
            ("미구현 경계", "실제 저장 슬롯 UX, 클라우드 동기화, 크래시 복구, 버전 마이그레이션의 사용자 경험, 카드 전투 상태 저장은 이 PDF나 현재 first-session runtime 검증 범위가 아니다."),
        ],
        "Traceability owners: docs/superpowers/specs/2026-09-01-story-arc-blueprint-design.md · docs/validation/STORY_ARC_FIRST_SESSION_RUNTIME_RECEIPT_2026-09-01.md",
    )

    # Page 32 — evidence and next work.
    draw_detail_page(
        32,
        "검증 현황, 남은 작업, 다음 안전 순서",
        "detailed PDF published; product Human/Device gates remain separate",
        "이번 상세판은 32개 페이지 전체를 렌더해 검수하는 문서 산출물이다. 게임의 다음 안전 작업은 해상도/입력/접근성/성능/내보내기와 카드 상세 룰 설계를 실제 플레이 조건에서 별도로 증명하는 것이다.",
        [
            ("이번 PDF 검증", "source/PDF SHA와 32페이지 render count를 manifest로 묶는다. 이는 PDF layout 증거이며 game runtime/Human PASS가 아니다."),
            ("기존 runtime 증거", "runtime receipt는 34 suites, 1,456 assertions, 1280×720 capture를 소유한다. 온실 배경의 입력 투명성도 포함되며 PDF 생성은 새 게임 증거가 아니다."),
            ("우선 남은 검증", "1920×1080/모바일 crop, 실제 마우스·터치, 대비/포커스, 성능, export와 사람 플레이 흐름을 PASS/NOT_RUN/실패로 분리한다."),
            ("다음 제품 결정", "사용자가 카드 상세 룰을 주면 benchmark·wireframe·data contract·test를 별도 L1로 시작한다. 그 전에는 RULESET_PENDING을 유지한다."),
        ],
        "Publication provenance: adjacent .manifest.json records source/PDF SHA-256 and page count · PR #253 remains the review surface; user final visual/UX acceptance is not implied.",
    )
    pdf.save()


def main() -> int:
    args = parse_args()
    try:
        _source_text, source_sha = validate_inputs(args.source.resolve(), require_runtime_captures=not args.check_inputs)
        if args.check_inputs:
            print(f"SOURCE_INPUTS_VALID source_sha256={source_sha}")
            return 0
        if args.record_render_validation:
            manifest_path = write_render_manifest(
                args.output.resolve(),
                source_sha,
                args.rendered_page_count,
                _parse_page_numbers(args.visually_inspected_pages),
            )
            print(f"PDF_MANIFEST_RECORDED path={manifest_path} source_sha256={source_sha}")
            return 0
        render_pdf(args.output.resolve(), source_sha)
    except (OSError, RuntimeError, ValueError) as exc:
        print(f"STORY_ARC_PDF_BUILD_FAILED: {exc}", file=sys.stderr)
        return 2

    print(f"PDF_RENDERED path={args.output.resolve()} source_sha256={source_sha}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
