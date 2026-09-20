# GRIMOIRE — 작업 시작

## Current-authority read order

1. 최신 사용자 지시와 [AGENTS.md](AGENTS.md).
2. 현재 branch/HEAD/dirty, 최신 origin/main, 관련 열린 PR과 작업 중첩. 다른 PR은 읽기 전용.
3. [Active Context](docs/ACTIVE_CONTEXT.md) 상단의 현재 작업·결정·다음 단계와 거기서 지정한 승인 원본.
4. 변경 대상의 실제 코드·씬·데이터·자산 consumer·검증. 실제 project.godot를 읽어 현재 진입점을 확인한다.
5. [채택 계약의 운영 경량화 절](docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md#lean-operating-adoption).
6. [프로젝트 라우터](.agents/skills/grimoire-workflow-router/SKILL.md)로 필요한 Base/로컬 Skill만 읽는다. 최신 Base main과 채택한 본문 revision의 차이를 기록한다.

main과 작업 브랜치의 제품 구현은 다를 수 있다. 다른 브랜치의 구현·테스트를 현재 완료로 승계하지 않는다.
현재 상태를 요약한 JSON의 역사 필드가 실제 Active Context·consumer와 충돌하면 원본과 현재 증거부터 확인한다.
CURRENT_CONFIRMED_DECISIONS / CURRENT_UNRESOLVED_GATES의 구 machine snapshot은 역사 locator이며 새 작업 허가가 아니다.
구 별형 회로·Product Root·필기 인식은 실제 consumer를 확인한 승인된 레거시 회귀에서만 읽는다. 이 정리가 해당 구현을 삭제하거나 교체하지 않는다.

## 작업별로 추가할 원본

| 작업 | 필요한 원본 |
|---|---|
| 진행·승인·남은 일 | docs/ACTIVE_CONTEXT.md의 최신 절과 해당 결정 |
| 운영·Base 출처·예산 | docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md의 lean-operating-adoption |
| 공용/로컬 Skill | skills/PROJECT_BASE_ADAPTER.json → 생성 snapshot → 선택한 정확한 본문 |
| 플레이어 경험·표현 | docs/UX_UI_SYSTEM.md의 fun-verification-binding → 현재 기능 Spec·실제 consumer |
| 새 시각 방향 결정 | skills/art-style-decision-gate/SKILL.md; 기존 승인 범위는 다시 열지 않음 |
| 레거시 필기 회귀 | skills/magic-writing-recovery/SKILL.md; 카드 조합에는 적용하지 않음 |
| 검토·조사·교정 | docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md의 최신 절 |

공용 Base: https://github.com/alsdmlals4-eng/Base 의 최신 main을 fresh-read한다.
프로젝트 v9.4.3 release/registry lock은 유지하며 운영 정책의 선택 채택과 구분한다.
관찰 SHA는 영구적인 “최신”이 아니다. 새 차이는 영향과 승인 범위를 판단한 뒤 채택 원본에 갱신한다.
과거 진입점 상세는 docs/archive/authority-before-lean/에 있다. 필요 없는 역사 문서·전체 Skill을 선독하지 않는다.
