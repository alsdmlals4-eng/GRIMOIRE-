from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
APPROVAL = ROOT / "docs/planning/YEAR_ONE_CHAPTER_CURRICULUM_01_APPROVAL_2026-08-11.md"


def text() -> str:
    return APPROVAL.read_text(encoding="utf-8")


def test_approved_decision_and_seven_chapter_distribution_are_locked():
    body = text()
    assert "GM-YEAR-ONE-CHAPTER-CURRICULUM-01" in body
    assert "status: USER_APPROVED_ACTIVE" in body
    assert "approved_structure: SEVEN_CHAPTERS_2_2_3" in body
    assert "chapter_count: 7" in body
    assert "term_distribution: 2_2_3" in body


def test_all_seven_chapters_are_present_once_as_named_sections():
    body = text()
    titles = [
        "Chapter 1 — 정답의 모양",
        "Chapter 2 — 교실 밖의 변수",
        "Chapter 3 — 같은 사건, 다른 원리",
        "Chapter 4 — 축제의 세 해법",
        "Chapter 5 — 실패도 기록이 된다",
        "Chapter 6 — 학교의 규칙이 통하지 않는 곳",
        "Chapter 7 — 내가 쓴 첫 번째 원리",
    ]
    for title in titles:
        assert body.count(title) == 1


def test_five_function_and_no_separate_exam_contract_are_preserved():
    body = text()
    for token in ["발견·학습", "선택·준비", "통제 응용", "실전·책임", "복기·다음 질문"]:
        assert token in body
    assert "별도 시험 Chapter, 시험장, 시험 전용 미니게임은 두지 않는다." in body
    assert "separate_exam: FORBIDDEN_AS_REQUIRED_CONTENT" in body


def test_year_one_ending_is_first_world_rewrite_and_failure_is_not_a_hard_block():
    body = text()
    assert "first_world_rewrite: YEAR_ONE_ENDING" in body
    assert "단일 실패는 진행을 차단하지 않는다." in body
    assert "실패·부분성공·부작용은 마도서에서 삭제하지 않는다." in body


def test_current_spell_authority_is_not_replaced_by_historical_three_by_three_language():
    body = text()
    assert "spell_topology_authority: FIVE_POINT_STAR_PRESERVED" in body
    assert "현재 주문 제품 권위는 `FIVE_POINT_STAR` 및 `GM-SPELL-WORKFLOW-UI-V2-01`" in body
    assert "과거 3×3 회로 표현은 현행 1학년 Chapter 설계의 주문 권위로 사용하지 않는다." in body


def test_growth_economy_numbers_remain_test_values():
    body = text()
    assert "growth_economy_numbers: TEST_VALUE" in body
    assert "자유일정 창 수, 수강 슬롯 수, 평가 가중치, 재료 수량은 후속 성장·경제 결정 전까지 `TEST_VALUE`" in body
