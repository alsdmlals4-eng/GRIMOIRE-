from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
APPROVAL = ROOT / "docs/planning/WORLD_CHARACTER_THREE_YEAR_STORY_01_APPROVAL_2026-08-11.md"
THIN_SPEC = ROOT / "docs/superpowers/specs/2026-08-11-world-character-three-year-story-design.md"


def canon() -> str:
    return APPROVAL.read_text(encoding="utf-8")


def thin_spec() -> str:
    return THIN_SPEC.read_text(encoding="utf-8")


def test_decision_and_sync_are_user_approved():
    body = canon()
    assert "decision_id: GM-WORLD-CHARACTER-THREE-YEAR-STORY-01" in body
    assert "status: USER_APPROVED_ACTIVE" in body
    assert "sync_id: GR-SYNC-20260811-07-WORLD-CHARACTER-THREE-YEAR-STORY" in body


def test_world_model_locks_precedent_context_revision_without_hidden_true_answer():
    body = canon()
    for section in ["### 3.1 원문", "### 3.2 정식", "### 3.3 문맥", "### 3.4 개정"]:
        assert section in body
    assert "학교가 가르치는 정식은 절대진리가 아니라 오랜 실패를 거쳐 검증된 안전한 선례다." in body
    assert "고대의 유일한 정답 문서나 숨은 치트키로 사용하지 않는다." in body
    assert "실패 기록을 지우는 리셋 도구가 아니다." in body


def test_year_one_three_schools_and_common_grammar_are_locked():
    body = canon()
    for token in ["유동학 — FLOW", "변성학 — HEAT", "결계학 — PROTECT"]:
        assert token in body
    assert "FOCUS / DISPERSE" in body
    assert "특정 계열이 아니라 세 계열 모두가 사용하는 공통 보조 문법" in body
    assert "계열은 정치·윤리 성향과 1:1로 대응하지 않는다." in body


def test_core_character_roles_and_names_are_locked_without_chosen_one_retcon():
    body = canon()
    for name in ["마렌", "카시안", "네아", "에일린", "모트"]:
        assert name in body
    assert "chosen_one_bloodline: FORBIDDEN" in body
    assert "oracle_behavior: FORBIDDEN" in body
    assert "카시안은 틀린 라이벌이 아니다." in body


def test_four_factions_are_shared_viewpoints_not_route_campaigns():
    body = canon()
    for faction in ["마도학원 정식위원회", "현장복원단", "정령협약망", "개방서고 연합"]:
        assert faction in body
    assert "네 세력 중 하나를 골라 별도 캠페인으로 분기하지 않는다." in body
    assert "세력별 별도 메인 캠페인 금지" in body


def test_three_year_questions_escalate_responsibility():
    body = canon()
    assert "1학년 — 정답은 왜 맞는가?" in body
    assert "2학년 — 누가 세계를 바꿀 권리가 있는가?" in body
    assert "3학년 — 무엇을 바꾸지 않을 책임이 있는가?" in body
    assert "첫 공동 개정" in body
    assert "무엇을 보존하고, 무엇을 되돌리고, 무엇을 새로 쓸지" in body


def test_c_b_d_ownership_boundaries_preserve_test_values():
    body = canon()
    assert "C가 소유하는 것" in body
    assert "B가 소유하는 것" in body
    assert "D가 소유하는 것" in body
    assert "위 값은 이 문서에서 확정하지 않으며 `TEST_VALUE`다." in body
    assert "persistent_godot_source_mutation: NONE" in body
    assert "Task8 PR #116의 ON_HOLD 상태" in body


def test_superpowers_spec_is_thin_and_points_to_project_canon():
    body = thin_spec()
    assert "process_overlay: SUPERPOWERS_BRAINSTORMING" in body
    assert "canon_owner: GRIMOIRE_PROJECT_PLANNING" in body
    assert "canonical_decision: GM-WORLD-CHARACTER-THREE-YEAR-STORY-01" in body
    assert "thin spec" in body
    assert "제품·세계관 정본을 복제하지 않으며" in body
