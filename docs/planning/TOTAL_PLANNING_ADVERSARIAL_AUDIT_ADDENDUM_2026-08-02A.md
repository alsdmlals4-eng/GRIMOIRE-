# 적대적 총기획 감사 Addendum A — Mobile Foundation 계약 진행

```yaml
audit_parent: GR-TOTAL-PLANNING-AUDIT-20260802-01
addendum_id: GR-TOTAL-PLANNING-AUDIT-20260802-A
status: DEVICE_CLASS_CONFLICT_RESOLVED_REMAINING_TEST_GATES
baseline_main: 59c2197c41e9f9e3df86a239d1088d262af19df6
working_branch: chatgpt/grimoire-mobile-foundation-session-20260802
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_playtest: NOT_RUN
```

## 1. 이번 Addendum 범위

승인된 `GM-MOBILE-ORIENTATION-01 / Landscape 고정` 이후 다음 P1 누락을 상세 계약으로 변환했다.

- 46분 Slice의 Mobile 중단·재개 구간.
- Draft·인식·후보·Commit·Result·마도서 기록의 저장 소유권.
- 중복 Commit·비용·피해·보상·기록 방지.
- Landscape Safe Area·Touch target·Writing Panel 정보 위계.
- 작은 화면의 축소 우선순위와 접근성 시험값.
- Smartphone·Tablet 지원 범위와 필수 Aspect Matrix.

## 2. 권위 문서

- `GM-MOBILE-SESSION-RESUME-SAVE-01`
  - `docs/planning/MOBILE_SESSION_RESUME_SAVE_01_2026-08-02.md`
- `GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01`
  - `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_2026-08-02.md`
  - `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_DEVICE_CLASS_ADDENDUM_2026-08-02.md`
- `GM-MOBILE-DEVICE-CLASS-01`
  - `docs/planning/MOBILE_DEVICE_CLASS_01_APPROVAL_2026-08-02.md`
- 플랫폼 공식 지침 벤치마크
  - `docs/planning/benchmarks/MOBILE_FOUNDATION_PLATFORM_GUIDELINES_BENCHMARK_2026-08-02.md`

## 3. Finding 상태 변경

| Finding | 이전 | 현재 | 근거 |
|---|---|---|---|
| `GR-TPA-02` Mobile 세션 구획·Resume 누락 | RECOMMENDED_DEFAULT | CONTRACT_DEFINED | Anchor A~D·Slice Complete·저장 Trigger 정의 |
| `GR-TPA-03` Draft·후보·Commit·Record 소유권 누락 | RECOMMENDED_DEFAULT | CONTRACT_DEFINED | Draft/Recognizing/Candidate/Committed/Resolved/Recorded 정의 |
| `GR-TPA-04` Timer+필기 접근성 위험 | TEST_REQUIRED | TEST_MATRIX_DEFINED | 1.0×/0.5×·UI/Text Scale·상태 피드백 시험값 |
| `GR-TPA-05` 7~10회 필기 피로 | TEST_REQUIRED | TEST_PROTOCOL_DEFINED | Token 재선택·피로 측정·직접 작성 우선순위 유지 |
| `GR-TPA-07` 방향 결정 전 Layout 잠금 위험 | BLOCKED | UNBLOCKED_FOR_SMARTPHONE_WIREFRAME | Landscape·Device Class·필수 Aspect Matrix 확정 |
| `GR-TPA-08` OS·Store·최소 기기·성능 | DEFERRED | STILL_DEFERRED | Build·Performance Gate 전 결정 Packet 필요 |
| `GR-TPA-09` PC 입력 역사 재활성 위험 | SHOULD_FIX | BOUNDARY_REINFORCED | Mobile Touch·Stylus 활성, PC 입력 후속 부록 유지 |

## 4. GM-MOBILE-DEVICE-CLASS-01 승인

사용자가 권장안 A를 승인했다.

```text
Smartphone Landscape = 필수 지원·정식 품질 Gate
Tablet 4:3·3:2 = Best-effort Smoke Test
Tablet 전용 Layout·정식 지원 = Vertical Slice 이후 별도 Decision
```

Smartphone 필수 Matrix:

- `16:9`.
- `18:9`.
- `19.5:9`.
- `20:9`.
- 좌·우 Cutout.
- 하단 System indicator·gesture 영역.

Tablet Smoke Test는 실행·Safe Area·핵심정보·기본 Touch·저장 복구만 확인한다. Tablet의 동일 품질을 약속하지 않는다.

## 5. 적대적 검토

### 확인된 강점

- 콘텐츠를 축소하지 않고 Anchor로 Mobile 중단 가능성을 보완한다.
- 작성 상태와 결과 Transaction을 분리해 `Draft 복구`와 `중복 보상 방지`를 동시에 달성한다.
- Smartphone에서 핵심 직접 작성 경험을 먼저 증명해 Solo QA 범위를 통제한다.
- Tablet 확장 가능성은 Smoke Test 증거로 보존한다.
- 기존 16:9 자료를 활용하되 Safe Area·Cutout·Touch 대응 완료로 오인하지 않는다.
- UI unit 시험값과 Android dp·iOS pt 공식 하한을 구분한다.

### 기각한 접근

- 모든 화면 전환마다 완전한 진행 Save를 동기식으로 강제.
- 인식 실행 중 Request 자체를 직렬화해 재개.
- Animation 완료를 Commit·보상·Anchor 권위로 사용.
- 16:9 고정 Margin을 모든 Mobile Safe Area로 간주.
- Landscape이므로 Smartphone·Tablet을 동일 Layout·품질로 자동 지원.
- Tablet을 완전히 차단해 후속 확장 증거를 잃는 방식.

## 6. 남은 위험

- Writing Rail/Panel 비율과 Canvas 최소 크기는 실기기 전 `TEST_VALUE`.
- 7~10회 직접 작성 피로와 손가락 가림은 사람 검증 전 미해결.
- Android/iOS·Store·최소 기기·성능·배터리·발열은 후속 Decision Packet 필요.
- Tablet Best-effort가 사용자에게 정식 지원으로 오해되지 않도록 지원 문구 관리 필요.

## 7. 현재 판정

```text
RESUME_SAVE_CONTRACT = DEFINED
LANDSCAPE_UX_CONTRACT = DEFINED_WITH_TEST_VALUES
DEVICE_CLASS = USER_APPROVED_ACTIVE
SMARTPHONE_REQUIRED_ASPECT_MATRIX = DEFINED
TABLET = BEST_EFFORT_SMOKE_ONLY
OS_STORE_MIN_DEVICE_PERFORMANCE = DEFERRED_WITH_BOUNDARY
SMARTPHONE_WRITING_BATTLE_WIREFRAME = NEXT
MOBILE-FOUNDATION-01 = IN_PROGRESS
CODEX = BLOCKED
PRODUCT_IMPLEMENTATION = NOT_STARTED
```
