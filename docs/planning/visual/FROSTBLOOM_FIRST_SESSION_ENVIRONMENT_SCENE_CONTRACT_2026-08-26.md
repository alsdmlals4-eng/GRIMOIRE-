# GM-FROSTBLOOM-FIRST-SESSION-ENVIRONMENT-CONSUMERS-01 — First-Session Environment Scene Contract

## Status

```yaml
decision_id: GM-FROSTBLOOM-FIRST-SESSION-ENVIRONMENT-CONSUMERS-01
parent_decision: GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01
approval: USER_APPROVED_RECOMMENDED_OPTION_A
approved_at_kst: 2026-08-26
scope: IMG_02_CONSUMER_CONTRACT_ONLY
implementation: NOT_STARTED
image_generation: NOT_STARTED
runtime_validation: NOT_RUN
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_slice_validation: NOT_RUN
```

## 1. Intent

첫 세션의 환경은 플레이어에게 **안전하게 배운다 → 바로 현장에서 적용한다 → 같은 세계가 더 큰 사건으로 읽힌다 → 집중된 위기에 대응한다**는 흐름을 준다.

이 계약은 IMG-02의 소비처와 재사용 경계만 고정한다. 새 Godot 제품 Scene, 대상 지정, 주문 시전, 전투 규칙, Task8, 또는 이미지 파일을 만들지 않는다.

## 2. Asset Contract

| Asset ID | Planned runtime path | Format | Role |
|---|---|---|---|
| `bg_school_common` | `assets/art/backgrounds/school/bg_school_common.webp` | 2560×1440 WebP Lossless, opaque | 수업과 안전 선례의 공통 교실/실습실 |
| `bg_greenhouse_field_base` | `assets/art/backgrounds/greenhouse/bg_greenhouse_field_base.webp` | 2560×1440 WebP Lossless, opaque | 지도 현장실습과 온실 조사·복귀의 재사용 가능한 기본 현장 |
| `bg_greenhouse_battle_arena` | `assets/art/backgrounds/greenhouse/bg_greenhouse_battle_arena.webp` | 2560×1440 WebP Lossless, opaque | 온실 핵심 대치의 집중된 시전·전투 구도 |

모든 기능 텍스트, 버튼, 수치, 주문 결과, 선택 상태, 정답/추천 표식은 live UI다. 배경에는 넣지 않는다.

## 3. Consumer Mapping

| Scene state | Background asset | Player promise | Allowed live change | Base image policy |
|---|---|---|---|---|
| `CLASS_SAFE_PRECEDENT` | `bg_school_common` | 마법의 의미 차이를 안전하게 비교하고 직접 써 본다. | 대화 인물, 실습 표면의 가벼운 마력, 라이브 튜토리얼 UI | 새 배경 불필요 |
| `GUIDED_FIELD_PRACTICUM` | `bg_greenhouse_field_base` | 배운 글자를 낮은 위험의 현장에 적용해 첫 결과를 만든다. | 관찰 가능한 흐름/압력 이상, 보호 대상 강조, Preview·Target·Cast UI | 새 배경 불필요 |
| `GREENHOUSE_INVESTIGATION_RETURN` | `bg_greenhouse_field_base` | 같은 환경이 사건의 맥락에서 더 불안하고 의미 있게 보인다. | 시간대/조명, 제한적 안개·입자, 조사 핀, 사건 상태용 live material/VFX | 새 배경 금지; IMG-03 효과 재사용 검토 전까지 base 유지 |
| `GREENHOUSE_BATTLE` | `bg_greenhouse_battle_arena` | 주변을 읽을 수 있는 집중 구도에서 주문을 쓰고 대가를 감당한다. | 대상/위험/결과 Preview, 전투 VFX, 상태 변화, live HUD | 이 계약에서 유일하게 별도 base 배경 허용 |

`GREENHOUSE_INVESTIGATION_RETURN`은 `GUIDED_FIELD_PRACTICUM`의 축소 정답판이 아니다. 같은 `bg_greenhouse_field_base`를 사용하더라도 장소의 역할, 관찰 항목, 조명과 live overlay가 달라지는 재사용 계약이다.

## 4. Information Guard

지도 현장실습은 Frostbloom 본 사건의 예고편이 아니라 독립적인 교내 저위험 문맥이다.

- 노출 가능: 한 지점의 흐름/압력 이상, 인접 보호 대상, FOCUS/DISPERSE의 서로 다른 결과 형태.
- 노출 금지: Frostbloom의 실제 Target, W6/W7 회로, 옛 개정 Reveal, 해결 순서, 결말, 정답 조합 또는 Best Route.
- 금지 표현: 결과를 baked text나 아이콘으로 미리 판정하는 연출, 자동 Target, 자동 Cast, 정답 화살표.
- 결과 원칙: FOCUS와 DISPERSE는 모두 부분적 개선과 남는 문제를 보여 주며, 어느 쪽도 UI에서 정답으로 표기하지 않는다.

## 5. Visual Direction and Read Zones

공통 스타일은 `Soft Storybook Cel 2D Hybrid` 위의 Magic/Anime 감각, 남청·금색 구조와 푸른 마력 발광이다.

- `bg_school_common`: 통제되고 따뜻한 학습 공간, 읽기 쉬운 실습 표면과 현장 출발 준비 단서. 교실 이름·수업 내용·절차 텍스트는 넣지 않는다.
- `bg_greenhouse_field_base`: 자연광이 드는 교내 온실/유지보수 현장, 흐름·압력·보호 대상이 live overlay 없이도 배치 가능한 여백. 과도한 Frostbloom 손상, 보스 연출, 전투 피해는 넣지 않는다.
- `bg_greenhouse_battle_arena`: 중앙 시전/대치 공간과 외곽 안전·위험 판독 영역이 분리된 온실 내부. 인물, 적 본체, HUD, 피해 수치, 공격 텔레그래프 텍스트는 넣지 않는다.

## 6. Planned Consumer Slots

현재 main은 Development Runtime POC이며 이 세 장을 소비하는 Product Root Scene은 아직 없다. 따라서 아래는 실제 Node 경로나 구현 API가 아니라 후속 CODEX-IMG-02가 채울 **planned consumer slots**다.

```text
FirstSessionClassScene / EnvironmentBackground → bg_school_common
FirstSessionPracticumScene / EnvironmentBackground → bg_greenhouse_field_base
FrostbloomInvestigationScene / EnvironmentBackground → bg_greenhouse_field_base
FrostbloomBattleScene / EnvironmentBackground → bg_greenhouse_battle_arena
```

후속 구현은 같은 asset ID를 단일 resolver 또는 Resource 참조를 통해 소비해야 하며, 상태별 PNG 복제보다 Light/Material/Particles/live UI 재사용을 먼저 검토한다.

## 7. Generation and Integration Gate

```text
consumer contract defined
→ bg_school_common text brief presented
→ explicit user generation approval
→ exactly one candidate generated
→ user approve/revise
→ local source + Notion asset record
→ deterministic runtime export + manifest/provenance
→ CODEX-IMG-02 integration goal
→ Godot import/runtime proof
```

첫 생성 후보는 `bg_school_common` 한 장이다. 이 문서는 생성 승인이 아니며, candidate·export·manifest·Notion record가 존재한다고 주장하지 않는다.

## 8. Acceptance Criteria

- 네 consumer state가 정확히 세 background asset ID에 매핑된다.
- 지도 현장실습과 온실 조사·복귀는 `bg_greenhouse_field_base`를 재사용한다.
- 별도 base 배경은 `GREENHOUSE_BATTLE`에만 허용된다.
- 각 상태는 이미지가 아닌 live UI/VFX가 담당할 영역을 명시한다.
- Frostbloom Target·회로·결말이 첫 10분 실습에서 노출되지 않는다.
- 이미지 생성, Godot 구현, runtime/human/device/performance 검증은 모두 아직 시작하지 않은 상태로 기록된다.
