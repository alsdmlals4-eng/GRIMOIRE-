# GRIMOIRE Active Context

## 현재 상태

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
default_branch: main
working_branch: agent/grimoire-v93-canon
baseline_date: 2026-07-31
primary_platform: PC
follow_up_platform: Mobile
engine_baseline_candidate: Godot 4.7.1 stable
product_stage: DEMO_FIRST_VERTICAL_SLICE
project_core: CORE_CONFIRMED
execution_profile: PLANNING_ONLY_PROFILE
work_mode: PLAN
planning_complete: true
implementation: NOT_STARTED
codex: BLOCKED_BY_ART_AND_TECHNICAL_ENTRY_GATES
next_product_gate: ART-STYLE-01
art_style_status: BENCHMARK_COMPLETE_USER_DECISION_REQUIRED
canon_sync_state: SYNCED_TO_WORKING_BRANCH
main_sync_state: PENDING_PR_MERGE
```

기획 정본은 완료됐다. 현재 작업은 승인된 표현 구조를 유지하면서 실제 그림체 후보를 선택하는 `ART-STYLE-01`이다. 제품 코드·Scene·Resource·게임 데이터·대량 자산은 아직 없다.

## 질문 전 복원 순서

```text
AGENTS.md
→ START_HERE.md
→ 이 문서
→ docs/planning/CURRENT_CONFIRMED_DECISIONS.md
→ docs/planning/DECISION_LOG_ADDENDUM_2026-07-31R.md
→ docs/planning/GRIMOIRE_PLANNING_CANON_2026-07-31.md
→ docs/planning/ART_STYLE_01_STATE.json
→ 주제별 책임 원본
→ docs/planning/CANON_SYNC_STATE.json
```

확정된 결정은 기억 확인 목적으로 다시 묻지 않는다. 아트 후보는 사용자 승인 전 확정으로 취급하지 않는다.

## 승인된 제품 코어

> 마법학교 학생이 되어 글자의 의미를 배우고, 수업과 현장실습에서 주문을 직접 설계해 내가 생각한 해결법으로 세계를 바꾸는 마법 RPG.

- 글자: `흐름 / 집중 / 분산`
- 수업: 불안정한 마력 수로
- 시험: 취약한 부유 수정구 이송
- 축제: 빛실 장막 복구
- 현장: 생태 온실·마력 관개 수로의 폭주 정령과 누출
- 주인공: 일반 가정 출신 장학생 신입생
- 동급생: 정석·속도 중심 경쟁자이자 협력자
- 수호형 전투 보조 소환수 1체 우선
- 마도서: 과정·대가·발견 기록, 자동 주문 스톡 금지
- 목표 중앙값 `45~50분`, 콘텐츠 상한 `53분`, 하드 상한 `60분`

## 승인된 표현 구조

```text
필드 = 가로형 고정·장면 기반 3/4 + 3.5~4등신 SD
대화 = 같은 장소 배경 위 반신 일러스트
전투 = 별도 고정 3/4 전술 전투장 + 필드 SD 골격 재사용
작성 = 현재 화면 감속·암전 + 작성 오버레이
결과 = 원래 필드 환경 변화로 복귀
```

이 표현 구조는 보호 결정이다. `ART-STYLE-01`은 이 구조를 재개방하지 않고 선·채색·질감·명암·시각 분위기를 결정한다.

## ART-STYLE-01

```yaml
decision_id: ART-STYLE-01
benchmark_id: GR-BM-ART-STYLE-01
benchmark_status: STANDARD_BENCHMARK_COMPLETE
decision_status: USER_DECISION_REQUIRED
comparison_image_status: NOT_REQUESTED_BY_USER
asset_generation_status: NOT_STARTED
```

벤치마킹 사례:

- WitchSpring R: 동화성·SD 애착·캐릭터 중심 RPG
- Atelier Sophie 2: 애니메이션풍 캐릭터와 마법 FX의 품질 상한
- Fire Emblem: Three Houses: 학교와 전술 전투의 화면 역할 분리
- Potionomics: 캐릭터 중심 대화 표현
- Witchbrook: 마법대학 생활과 3/4 픽셀 디오라마 구성
- Ikenfell: 마법학교·전술 전투의 저밀도 판독성

후보:

| 후보 | 이름 | 현재 판정 |
|---|---|---|
| A | Soft Storybook Cel 2D Hybrid | `RECOMMENDED` |
| B | Clean Academy Anime 2D | `SAFE_ALTERNATIVE` |
| C | Illustrated Pixel Diorama | `PRODUCTION_FALLBACK` |

권장 후보 A:

```text
부드러운 동화책 질감의 2D 고정 배경
+ 선명하고 제한된 셀 명암의 SD 캐릭터
+ 같은 선·얼굴 언어의 반신 일러스트
+ 대상·방향·범위를 우선하는 절제된 마법 FX
```

후보 A를 권장하지만 승인되지 않았다. 이미지 생성, 최종 팔레트, 선 굵기, 명암 단계, 재질, 내부 해상도는 미착수다.

책임 문서:

- `docs/planning/benchmarks/ART_STYLE_01_BENCHMARK_2026-07-31.md`
- `docs/planning/ART_STYLE_01_CANDIDATES.md`
- `docs/planning/ART_STYLE_01_STATE.json`

## PC 입력·UX

- 마우스 왼쪽 드래그·펜 보조
- 오른쪽 버튼·Esc 취소
- `Ctrl+Z` Undo
- 클릭·Enter 후보 확정
- 자동 시전 금지
- 정상 완주 필수 성공 작성 7회
- 복구 포함 목표 상한 10회
- Gamepad `DEFERRED / NOT_PROMISED`

정확한 허용 오차·선 보정·감속 비율은 `PLAYTEST_TUNING_REQUIRED`다.

## 작업 원칙

### 벤치마킹 선행

새 시스템·핵심 규칙·콘텐츠 구조·UX 흐름은 범위에 맞는 `QUICK / STANDARD / DEEP` 벤치마킹 후 설계한다. `ADOPT / ADAPT / REJECT`와 프로젝트 적용 계약을 기록한다.

### 승인 정본 즉시 동기화

주요 승인 변경은 같은 Decision ID로 GitHub 권위 문서·계획 데이터와 연결된 Sheet에 반영한다.

```text
working branch + Sheet readback
= SYNCED_TO_WORKING_BRANCH

main + Sheet readback after merge
= SYNCED_TO_MAIN
```

현재 승인 기획 번들 `GR-SYNC-20260731-04`는 `SYNCED_TO_WORKING_BRANCH`다. `ART-STYLE-01` 후보는 미승인 상태로만 GitHub·Sheet에 기록한다.

## 현재 제품 경로

```text
ART-STYLE-01 사용자 결정
→ ART-BIBLE-01
→ ASSET-SPEC-01
→ AUDIO-DIRECTION-01
→ 기획·아트 통합 검수
→ 사용자 Codex Plan 승인
→ Codex read-only Plan
→ 기술 검수
→ 구현
```

## 검증·금지 경계

- Art Style 사용자 승인: `NOT_GRANTED`
- 이미지 생성: `NOT_STARTED`
- 대량 이미지·사운드 제작: 금지
- Codex 실행: 금지
- Godot 구현: 금지
- 런타임·PC 입력·모바일·사람 검증: `NOT_RUN`
- 기본 브랜치 직접 수정·사용자 검토 없는 PR 병합: 금지
