# GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01 — Landscape Mobile UX 기반 계약

```yaml
decision_id: GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01
status: PARTIAL_CONTRACT_ACTIVE_DEVICE_CLASS_DECISION_PENDING
parent_decisions: GM-PLATFORM-02 / GM-MOBILE-ORIENTATION-01
parent_gate: MOBILE-FOUNDATION-01
orientation: LANDSCAPE_FIXED
portrait_gameplay: OUT_OF_VERTICAL_SLICE
runtime_rotation: DISABLED_IN_VERTICAL_SLICE
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
accessibility_validation: NOT_RUN
human_playtest: NOT_RUN
```

## 1. 목적

승인된 Landscape 고정 방향 안에서 직접 작성 Canvas, 적 위험·목표, 주인공 상태, 후보·조합·`[구현]`을 작은 화면에서도 동시에 이해할 수 있는 정보 위계와 시험값을 정의한다.

이 문서는 화면의 기능·상태·우선순위를 정한다. 최종 Pixel Layout·지원 기기군·지원 Aspect·Touch 수치는 실기기 검증과 `GM-MOBILE-DEVICE-CLASS-01` 결정 전까지 확정하지 않는다.

## 2. 보호할 기존 화면 방향

```text
고정 3/4 Field
→ 같은 장소 Half-body Dialogue
→ Writing Overlay
→ 별도 Battle
→ Result
→ Field 변화 복귀
→ Grimoire 기록
```

전투 기본 방향:

```text
상단·중앙 = 적·환경 목표·공격 예고
좌측 하단 = 주인공 초상·HP·마나·상태
좌측 보조 = 동반 정령·수호 상태 배지
우측 = 축소 Writing Rail → 작성 시 확장 Panel
```

이 구조를 유지하되 Mobile에서 정보 가림과 Touch 충돌을 재검증한다.

## 3. Safe Root 계약

모든 핵심 UI는 Runtime Safe Area 내부의 `Safe Root`를 기준으로 배치한다.

### 핵심 정보·행동

Safe Root 밖에 두지 않는 항목:

- 현재 목표·대상·위험.
- 적 다음 공격·남은 시간.
- HP·마나·불안정도·치명 환경 상태.
- 작성 Canvas의 유효 입력 영역.
- Undo·삭제·취소·후보 확정·`[구현]`.
- Pause·설정·접근성 감속 상태.
- 저장 실패·복구 행동.

배경 Illustration·장식·비상호작용 VFX는 Safe Root 밖까지 확장할 수 있다.

### 구현 계획 경계

후속 구현 계획에서는 Godot `DisplayServer.get_display_safe_area()`와 `get_display_cutouts()`를 읽어 Safe Root를 계산한다. 현재 문서는 API 사용 방향만 정하며 Godot Scene·Script를 생성하지 않는다.

## 4. Touch target 시험값

공식 플랫폼 하한:

- Android: `48dp × 48dp`.
- iOS: 자주 쓰는 Control `44pt × 44pt`.

GRIMOIRE 초기 후보:

| Control 종류 | 초기 후보 | 상태 |
|---|---:|---|
| 일반 상호작용·후보·목록 Item | 최소 48 UI unit | TEST_VALUE |
| `[구현]`·후보 확정·전투 핵심 행동 | 56 UI unit | TEST_VALUE |
| Undo·부분 삭제·전체 초기화 | 최소 48 UI unit | TEST_VALUE |
| Icon 시각 크기 | 24~32 UI unit | TEST_VALUE |
| 인접 Hit 영역 간 여백 | 8~12 UI unit | TEST_VALUE |

- 시각 Icon이 작아도 Hit 영역은 최소값을 유지한다.
- 서로 다른 행동의 Hit 영역이 겹치지 않는다.
- Canvas 획 입력 영역과 Undo·삭제·확정 Hit 영역을 분리한다.
- UI unit은 최종 dp/pt 대응값이 아니며 Device Scale 검증이 필요하다.

## 5. 공통 Landscape 정보 구역

Safe Root를 다섯 개 기능 구역으로 본다.

```text
┌──────────────────────────────────────────────┐
│ ① Objective / Threat / Timer                 │
├───────────┬───────────────────────┬──────────┤
│ ② Player  │ ③ World / Enemy /     │ ④ Writing│
│ Status    │ Situation Focus       │ Rail/Panel│
├───────────┴───────────────────────┴──────────┤
│ ⑤ Confirm / Recovery / System Feedback       │
└──────────────────────────────────────────────┘
```

### ① Objective / Threat / Timer

- 현재 목표 한 문장.
- 가장 가까운 치명 위험.
- 전투 시 다음 공격과 숫자·게이지·아이콘.
- 색만으로 상태를 구분하지 않는다.

### ② Player Status

- 주인공 HP·마나·핵심 상태.
- 동반 정령·수호 상태는 본체가 아니라 배지·짧은 Cut-in.
- 세부 Buff 설명은 Tap/Long press 또는 상세 Panel로 지연 공개.

### ③ World / Enemy / Situation Focus

- Field에서는 장소·대상·상호작용.
- Battle에서는 적 행동·환경 변화·불안정도.
- Writing Panel 확장 중에도 핵심 대상·위험·Timer를 완전히 가리지 않는다.

### ④ Writing Rail / Panel

- 기본 상태: 축소 Rail.
- 작성 시작: 우측 확장 Panel.
- Panel 내부 순서: Canvas→현재 획/인식 상태→후보→의미·조합→비용·위험→`[구현]`.
- 낮은 확신 후보 자동 선택 금지.
- Panel을 닫아도 안전한 Draft가 유지된다.

### ⑤ Confirm / Recovery / System Feedback

- `[구현]`, 취소, Undo, 삭제, 저장·복구 상태.
- System gesture·Home indicator·Cutout과 겹치지 않는다.
- 결과 해결 중에는 중복 Commit을 차단하고 진행 이유를 표시한다.

## 6. Writing Panel 크기 시험값

| 상태 | Safe Root 가로 점유 후보 | 목적 |
|---|---:|---|
| Rail | 12~16% | 글자·작성 상태·열기 행동만 표시 |
| Compact Candidate | 24~32% | 후보 확인·Token 재선택 |
| Full Writing | 36~44% | 직접 획·부분 수정·조합·비용 확인 |
| Blocking Error/Recovery | 최대 50% | 저장 손상·복구 선택처럼 설명이 필요한 상태 |

- Full Writing에서도 Objective·Timer·적 핵심 위험이 남아야 한다.
- 비율은 `TEST_VALUE`; 지원 기기군·Aspect 결정 후 Wireframe과 실기기로 조정한다.
- Canvas의 실제 최소 크기는 획 인식 Prototype 전까지 확정하지 않는다.

## 7. 화면별 정보 위계

### Main

1. 이어하기.
2. 새 게임.
3. 설정.
4. 저장 복구 안내.

수집형 로비·이벤트 배너·상점 Panel은 Vertical Slice에서 제외한다.

### Field

1. 장소와 현재 목표.
2. 상호작용 대상.
3. 다음 행동.
4. 일정·상태 요약.
5. 비핵심 기록·설명.

### Dialogue / Schedule

1. 화자·핵심 대사 또는 선택.
2. 선택이 영향을 주는 `CALM / PREPARED / CONNECTED` 목적.
3. 취소·이전·상세 설명.

### Writing

1. 원본 획과 현재 인식 상태.
2. 후보와 확신 문구.
3. 의미·조합·충돌.
4. 마나·위험·예상 결과.
5. 명시적 `[구현]`.

### Battle

1. 다음 공격·남은 시간·치명 위험.
2. 현재 목표·적 불안정도·환경.
3. 주인공 HP·마나.
4. 작성 Canvas·후보·조합.
5. 수호·감속·상세 로그.

### Result

1. 해결·부분 성공·실패 판정.
2. 왜 그런 결과가 발생했는지 인과.
3. 환경 보존·부작용·희생.
4. 획득·해금·관계.
5. Field 복귀 또는 마도서 기록.

### Grimoire

1. 상황.
2. 사용한 글자·조합.
3. 의도.
4. 결과·부작용.
5. 발견·플레이어 명명.

자동 최적 추천·기록 클릭 자동 시전을 금지한다.

## 8. 작은 화면 축소 우선순위

공간이 부족할 때 다음 순서로 축소·지연 공개한다.

1. 장식·비상호작용 VFX.
2. 장문 설명·상세 로그.
3. 동반 정령·수호의 비핵심 세부 정보.
4. 주인공 초상의 장식 면적.
5. 비핵심 Navigation Label.

끝까지 보존:

- 목표.
- 치명 위험·Timer.
- HP·마나·불안정도.
- 작성 획·후보·오류 원인.
- Undo·취소·확정·`[구현]`.
- 저장·복구 상태.

## 9. 접근성 시험값

- UI Scale 후보: `100% / 115% / 130%`.
- Text Scale 후보: `100% / 115% / 130%`.
- 작성 감속 후보: `1.0× / 0.5×`, 보상 불이익 없음.
- Reduced Motion, haptic-off, mute에서도 상태·위험·오류 원인을 보존.
- Attack Timer는 숫자+게이지+아이콘+문구를 조합.
- 위험·후보·성공 상태는 색만으로 구분하지 않는다.
- Text Scale 증가 시 장문 설명을 Scroll/상세 Panel로 보내고 핵심 행동을 가리지 않는다.

최종 Scale·폰트 크기·줄 수는 기기 검증 전까지 `TEST_VALUE`다.

## 10. Aspect 시험 Matrix

지원 약속이 아니라 Layout 검증 후보:

```text
16:9
18:9
19.5:9
20:9
좌측 Cutout
우측 Cutout
하단 System indicator
```

Tablet 4:3·3:2와 Foldable·Multi-window는 `GM-MOBILE-DEVICE-CLASS-01` 결정 전 필수 Matrix에 포함하지 않는다.

## 11. 실패·복구 상태

반드시 설계할 상태:

- 빈 Save / 이어하기 없음.
- 손상 Save / 직전 Anchor 복구.
- 낮은 확신 후보.
- 인식 요청 지연·stale 폐기.
- 문법 오류.
- 비용 부족.
- 대상 부적합.
- App pause/background 후 복귀.
- Touch 가림·System gesture 충돌.
- Text overflow.
- Panel 겹침.
- Asset 누락.

각 상태는 원인, 보존된 상태, 다음 행동을 보여 준다.

## 12. 검증 과제

1. 16:9~20:9에서 핵심 정보 가림 0.
2. 좌·우 Cutout에서 핵심 Control 겹침 0.
3. Rail→Full Writing 전환 중 Timer·위험 가림 0.
4. Touch target 하한 위반 0.
5. Canvas 획과 인접 버튼 오입력 측정.
6. UI/Text 130%에서 핵심 행동 접근 가능.
7. Background 복귀 후 Draft·Panel·목표 일치.
8. 7회 필수 작성·복구 포함 10회 피로 측정.
9. 감속 사용과 보상 동일.
10. 첫 3초 내 목표·위험·다음 행동 설명 가능.

## 13. 미확정·Grill Me 대상

```yaml
user_decision_required: GM-MOBILE-DEVICE-CLASS-01
question: Vertical Slice에서 Smartphone과 Tablet을 어떤 지원 범위로 볼 것인가
blocks:
  - required_aspect_matrix
  - tablet_layout_rules
  - minimum_device_matrix
  - final_canvas_and_panel_size
nonblocking_for:
  - resume_save_contract
  - smartphone_layout_candidates
  - state_and_error_hierarchy
```

## 14. Gate 영향

```text
GR-TPA-07 = UNBLOCKED_FOR_LANDSCAPE_CANDIDATES
GR-TPA-04 / 05 = TEST_REQUIRED
MOBILE-FOUNDATION-01 = IN_PROGRESS
DEVICE_CLASS = USER_DECISION_REQUIRED
CODEX = BLOCKED
PRODUCT_IMPLEMENTATION = NOT_STARTED
```
