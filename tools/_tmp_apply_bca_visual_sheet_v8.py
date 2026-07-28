from __future__ import annotations

import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
BASE_SHA = "7072b9e2742a60d7548fd39df3328ad76a8dbad1"
TABS = [
    "00_프로젝트_허브", "01_작업순서", "02_현재_확정결정", "03_근거_라이브러리", "04_누락_충돌_감사",
    "10_제품방향", "11_세계관", "12_핵심루프", "13_주요인물", "14_조연_세력_관계",
    "20_코어경험_데모목표", "30_데모범위_품질기준_제작기반", "40_핵심시스템_메인콘텐츠", "41_성장_경제",
    "50_메인콘텐츠", "60_UX_UI_접근성", "70_아트_오디오_에셋", "71_이미지기획_생성목록",
    "72_이미지검수_승인로그", "80_데모_버티컬슬라이스_플레이테스트", "90_본제작_출시_사업",
    "98_Base_반영후보", "99_변경이력",
]


def write(path: str, content: str) -> None:
    target = ROOT / path
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_text(content.rstrip() + "\n", encoding="utf-8")


def append_once(path: str, marker: str, block: str) -> None:
    target = ROOT / path
    text = target.read_text(encoding="utf-8")
    if marker not in text:
        target.write_text(text.rstrip() + "\n\n" + block.strip() + "\n", encoding="utf-8")


def legacy_header(path: str, title: str) -> None:
    target = ROOT / path
    if not target.is_file():
        return
    text = target.read_text(encoding="utf-8")
    if "status: LEGACY_COMPATIBILITY" in text:
        return
    header = f"""---
document_role: LEGACY_COMPATIBILITY
active_authority: false
implementation_authority: NONE
replacement_execution_prompt: templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md
status: LEGACY_COMPATIBILITY
---

> `{title}`은 과거 비교·호환 기록이다. 새 작업 실행은 Base v8 통합 실행문과 Spell 프로젝트 정본을 사용한다.

"""
    target.write_text(header + text, encoding="utf-8")


def create_docs() -> None:
    tabs = "\n".join(f"- `{tab}`" for tab in TABS)
    write("docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md", f"""
# Spell 프로젝트 Google Sheets Workbook

```yaml
project: Spell
sheet_status: NOT_CONFIGURED
spreadsheet_url:
base_commit: {BASE_SHA}
```

정확한 기존 Sheet URL·ID·권한을 확인하지 못했으므로 신규 Sheet를 생성하지 않는다. 연결 시 기존 tab·수식·사용자 편집을 먼저 읽고 다음 의미 구조를 설치·병합한다.

{tabs}

## 프로젝트 책임 매핑

| 의미 구조 | 책임 원본 |
|---|---|
| 세계관·인물·세력 | 마법 학교·현장·전술 전투·주요 캐릭터·소환수 관련 승인 문서 |
| 핵심루프 | 탐색·관계·학습·마법 회로 구성 → 전술 전투 → 성장·소환수 형태 선택 |
| 핵심시스템·메인콘텐츠 | 주문 회로, 별도 전술 전투, SD 필드·반신 대화, 소환수 4단계 성장 |
| 이미지 계획·검수 | `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md` |

Sheet는 독립 정본이 아니라 Decision ID·GitHub 경로·승인 상태를 연결한다.
""")
    write("docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md", f"""
# Spell GPT 이미지 생성·검수 워크플로

- Base: `alsdmlals4-eng/Base@{BASE_SHA}`
- 활성 Prompt: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md`
- Sheet: `NOT_CONFIGURED`
- Mode: `planning-visualization`, `final-visual-candidate`, `visual-qa-and-approval`

## 기획 중 우선 이미지

1. 가로형 Hybrid 2D 필드·반신 대화·별도 전술 전투의 화면 전환 목업.
2. 마법 회로·노드·연결·비용·결과가 읽히는 주문 편집·전투 UI.
3. 학교·탐색·관계·학습·전투·성장 핵심루프 시각화.
4. 주요 인물·조연·세력·교실·현장 장소 톤 보드.
5. 주 소환수 4단계 형태 선택과 장기 동행 시트.

## 기획 종료 우선 후보

1. Demo·Google Play·PC 소개용 키아트·스크린샷·배너 후보.
2. 실제 가로형 필드·대화·전술 전투 UI 고도화 목업.
3. 주요 인물 SD 필드·반신 초상·표정·전투 컷인 시트.
4. 주문 회로·속성·소환수·장비의 반복 제작 가능한 시각 언어.

## 상태 호환

| 기존 Spell 상태 | 공용 lifecycle |
|---|---|
| `CONCEPT_EXPLORATION` | `GENERATED_EXPLORATION` |
| `VISUAL_REFERENCE_CANDIDATE` | `IN_REVIEW` 또는 `APPROVED_CANDIDATE` |
| `USER_APPROVED_VISUAL_REFERENCE` | `APPROVED_CANDIDATE` |
| `ART_BIBLE_APPROVED` | 방향 정본 승인; 개별 자산은 별도 검수 |
| `RUNTIME_ASSET_APPROVED` | `PROJECT_ASSET_APPROVED` 또는 실제 검증 후 `APPLIED_AND_RUNTIME_VERIFIED` |

공용 흐름은 `PLANNED → GENERATED_EXPLORATION → IN_REVIEW → REVISION_REQUIRED/REJECTED/APPROVED_CANDIDATE → PROJECT_ASSET_APPROVED → APPLIED_AND_RUNTIME_VERIFIED`다. 실제 화면·구현 가능성·손·표정·한글·회로 가독성·원근·광원·특정 IP 유사성·원출처·라이선스를 검수한다. 생성 이미지는 자동 최종 자산이 아니다.
""")
    write("docs/BCA_VISUAL_SHEET_ADOPTION_AUDIT.md", f"""
# Spell BCA v8 적용 적대적 검토

```yaml
base_commit: {BASE_SHA}
project_sheet_status: NOT_CONFIGURED
product_paths_changed: false
final_status: CONFLICT_FIXED
```

- `MUST_FIX`: `PROTOTYPE_AND_VERTICAL_SLICE` 활성 단계 → `DEMO_FIRST_VERTICAL_SLICE`로 변경.
- `MUST_FIX`: v6 짧은 실행문·Master Manifest 활성 우선순위 → `LEGACY_COMPATIBILITY`로 격리.
- `MUST_FIX`: 오래된 Base pin과 CORE_POC 선행 표현 → v8·내부 `TECHNICAL_SPIKE` 호환으로 갱신.
- `MUST_FIX`: Sheet 의미 구조·이미지 검수 lifecycle·승인 원장 부재 → adapter 설치.
- `ALLOWED_LEGACY`: v6 파일과 과거 승인 시각 Decision은 이력·비교 근거로 보존.
- `BLOCKED_UNVERIFIED`: 실제 Sheet·생성 이미지·Godot 런타임·스토어 규격 검수.
""")


def update_base_rules() -> None:
    path = ROOT / "docs/BASE_RULES_VERSION.md"
    text = path.read_text(encoding="utf-8")
    text = text.replace("438f41afd510c827c3097341bd9e5f9c9b0e1dd0", BASE_SHA)
    text = text.replace("| 동기화 날짜 | 2026-07-27 |", "| 동기화 날짜 | 2026-07-28 |")
    text = text.replace("| v6 계약 | `VERTICAL_SLICE_MASTER_REFERENCE 6.0` |", "| 활성 통합 계약 | `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT 8.0` |")
    text = text.replace("- 축약 실행문: `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`", "- 활성 실행문: Base `templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md`")
    text = text.replace("- 마스터 원본 Manifest: `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md`", "- Legacy 호환 기록: `docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md`, `docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md`")
    text = text.replace("→ 이 BASE_RULES_VERSION.md와 v6 계약", "→ 이 BASE_RULES_VERSION.md와 Base v8 통합 실행문")
    text = text.replace("| 콘셉트·CORE_POC | `analyzing-and-refining-game-concepts` | 다음 기획 단계에서 순차 실행 |", "| 콘셉트·위험 검증 | `analyzing-and-refining-game-concepts` | 별도 CORE_POC Gate 없이 필요 시 Slice 내부 `TECHNICAL_SPIKE` |")
    text = text.replace("| 버티컬 슬라이스 | `designing-vertical-slices` | 코어 승인·CORE_POC 이후 실행 |", "| 버티컬 슬라이스 | `designing-vertical-slices` | `DEMO_FIRST_VERTICAL_SLICE` 계획·품질·파이프라인·플레이테스트 |")
    text = text.replace("5. v6 계약과 충돌 여부", "5. v8 통합 실행문·BCA Sheet·이미지 workflow와 충돌 여부")
    if "## BCA v8 채택" not in text:
        text = text.rstrip() + f"""

## BCA v8 채택

- Base: `alsdmlals4-eng/Base@{BASE_SHA}`.
- 활성 통합 실행문: `templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md`.
- Sheet: `NOT_CONFIGURED`; `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`.
- GPT 이미지·목업: `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md`.
- v6 계약 파일은 `LEGACY_COMPATIBILITY`이며 활성 실행 권한이 없다.
"""
    path.write_text(text.rstrip() + "\n", encoding="utf-8")


def update_registry() -> None:
    path = ROOT / "skills/SKILL_REGISTRY.json"
    data = json.loads(path.read_text(encoding="utf-8"))
    project = data["project"]
    project["product_stage"] = "DEMO_FIRST_VERTICAL_SLICE"
    data["base_registry_route"]["commit"] = BASE_SHA
    data["base_registry_route"]["integrated_execution_prompt"] = "templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md"
    contracts = data["execution_contracts"]
    contracts["integrated_v8"] = "Base:templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md"
    contracts["project_sheet"] = "docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md"
    contracts["image_workflow"] = "docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md"
    contracts["short_v6_legacy"] = contracts.pop("short_v6")
    contracts["master_v6_manifest_legacy"] = contracts.pop("master_v6_manifest")
    data["bca_visual_sheet"] = {
        "status": "ADOPTED",
        "sheet_status": "NOT_CONFIGURED",
        "required_tabs": TABS,
        "image_modes": ["planning-visualization", "final-visual-candidate", "visual-qa-and-approval"],
        "image_state_aliases": {
            "CONCEPT_EXPLORATION": "GENERATED_EXPLORATION",
            "VISUAL_REFERENCE_CANDIDATE": "IN_REVIEW_OR_APPROVED_CANDIDATE",
            "USER_APPROVED_VISUAL_REFERENCE": "APPROVED_CANDIDATE",
            "ART_BIBLE_APPROVED": "DIRECTION_CANON_APPROVED",
            "RUNTIME_ASSET_APPROVED": "PROJECT_ASSET_APPROVED_OR_APPLIED_AND_RUNTIME_VERIFIED",
        },
        "adversarial_mode": "repository-wide-audit",
    }
    for route in data["active_base_routes"]:
        if route["skill_id"] == "running-adversarial-review-and-refinement":
            if "repository-wide-audit" not in route["modes"]:
                route["modes"].append("repository-wide-audit")
        if route["skill_id"] == "managing-design-documents":
            route["current_use"] = "Maintain current snapshot, decision ledger, Sheet semantic structure, art and audio preproduction sources"
    if not any(route["skill_id"] == "designing-art-prompts-and-technique-cards" for route in data["active_base_routes"]):
        data["active_base_routes"].append({
            "skill_id": "designing-art-prompts-and-technique-cards",
            "modes": ["planning-visualization", "final-visual-candidate", "visual-qa-and-approval"],
            "current_use": "Generate planning and final-candidate images and review them before asset approval",
        })
    coverage = data["current_gate_coverage"]
    legacy = coverage.pop("gate_2_prototype_vertical_slice")
    legacy["legacy_gate_alias"] = "PROTOTYPE_AND_VERTICAL_SLICE"
    coverage["gate_2_demo_first_vertical_slice"] = legacy
    path.write_text(json.dumps(data, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")


def update_entrypoints() -> None:
    append_once("README.md", "## BCA v8 기획·이미지·Sheet 운영", f"""
## BCA v8 기획·이미지·Sheet 운영

- Base: `alsdmlals4-eng/Base@{BASE_SHA}`
- 현재 단계: `DEMO_FIRST_VERTICAL_SLICE`
- 통합 실행문: `VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md`
- Sheet: `NOT_CONFIGURED`; `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md`
- GPT 이미지·검수: `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md`
- 적대적 검토: `docs/BCA_VISUAL_SHEET_ADOPTION_AUDIT.md`
""")
    append_once("AGENTS.md", "## BCA Sheet·GPT 이미지 생성·검수", f"""
## BCA Sheet·GPT 이미지 생성·검수

- Base 기준은 `alsdmlals4-eng/Base@{BASE_SHA}`와 v8 통합 실행문이다.
- 현행 제품 단계는 `DEMO_FIRST_VERTICAL_SLICE`; `PROTOTYPE_AND_VERTICAL_SLICE`와 별도 `CORE_POC`는 역사·호환 별칭이다.
- 프로젝트 Sheet는 `NOT_CONFIGURED`; URL 확인 전 신규 Sheet를 추정 생성하지 않는다.
- GPT는 기획 중 화면·인물·회로·소환수 목업과 기획 종료 Demo·스토어 후보를 생성할 수 있다.
- 생성 결과는 자동 최종 자산이 아니며 실제 화면·구현·권리·오류·승인 원장 검수 뒤 사용한다.
- 각 단계 뒤 `repository-wide-audit`로 v6·구형 Gate·stale 이미지·untouched 소비자를 재검사한다.
""")
    for path in ("START_HERE.md", "docs/DOCUMENTATION_MAP.md"):
        append_once(path, "VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md", f"""
- Base v8 통합 실행문: `templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md`
- 프로젝트 Sheet: `docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md` (`NOT_CONFIGURED`)
- GPT 이미지·검수: `docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md`
""")


def create_test_and_workflow() -> None:
    write("tests/test_bca_visual_sheet_adoption.py", f'''
from __future__ import annotations
import json
import unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
BASE_SHA="{BASE_SHA}"
class TestBCA(unittest.TestCase):
    def test_active_stage_and_base(self):
        registry=json.loads((ROOT/"skills/SKILL_REGISTRY.json").read_text(encoding="utf-8"))
        self.assertEqual(registry["project"]["product_stage"],"DEMO_FIRST_VERTICAL_SLICE")
        self.assertEqual(registry["base_registry_route"]["commit"],BASE_SHA)
        self.assertIn("integrated_v8",registry["execution_contracts"])
        self.assertNotIn("short_v6",registry["execution_contracts"])
    def test_sheet_and_visual_contracts(self):
        sheet=(ROOT/"docs/PROJECT_GOOGLE_SHEET_WORKBOOK.md").read_text(encoding="utf-8")
        visual=(ROOT/"docs/GPT_IMAGE_GENERATION_AND_REVIEW_WORKFLOW.md").read_text(encoding="utf-8")
        for token in ("11_세계관","12_핵심루프","13_주요인물","14_조연_세력_관계","40_핵심시스템_메인콘텐츠","71_이미지기획_생성목록","72_이미지검수_승인로그","NOT_CONFIGURED"):
            self.assertIn(token,sheet)
        for token in ("planning-visualization","final-visual-candidate","visual-qa-and-approval","PROJECT_ASSET_APPROVED","자동 최종 자산"):
            self.assertIn(token,visual)
    def test_legacy_contracts_are_non_authoritative(self):
        for path in ("docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md","docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md"):
            text=(ROOT/path).read_text(encoding="utf-8")
            self.assertIn("status: LEGACY_COMPATIBILITY",text,path)
            self.assertIn("active_authority: false",text,path)
if __name__=="__main__": unittest.main()
''')
    write(".github/workflows/validate-bca-visual-sheet-adoption.yml", '''
name: Validate Spell BCA Adoption
on:
  pull_request:
    branches: [main]
    paths: ["README.md","AGENTS.md","START_HERE.md","docs/**","skills/SKILL_REGISTRY.json","tests/test_bca_visual_sheet_adoption.py",".github/workflows/validate-bca-visual-sheet-adoption.yml"]
permissions: {contents: read}
concurrency:
  group: spell-bca-${{ github.event.pull_request.number || github.ref }}
  cancel-in-progress: true
jobs:
  contract:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: actions/setup-python@v5
        with: {python-version: "3.12"}
      - run: python -m unittest tests.test_bca_visual_sheet_adoption -v
      - name: Stale active-reference audit
        shell: bash
        run: |
          git grep -n -I -E 'PROTOTYPE_AND_VERTICAL_SLICE|VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6|VERTICAL_SLICE_MASTER_REFERENCE_v6' -- README.md AGENTS.md START_HERE.md docs skills || true
          git diff --check origin/main...HEAD
''')


def main() -> None:
    create_docs()
    update_base_rules()
    update_registry()
    update_entrypoints()
    legacy_header("docs/contracts/VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6.md", "VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6")
    legacy_header("docs/contracts/VERTICAL_SLICE_MASTER_REFERENCE_v6.md", "VERTICAL_SLICE_MASTER_REFERENCE_v6")
    create_test_and_workflow()


if __name__ == "__main__":
    main()
