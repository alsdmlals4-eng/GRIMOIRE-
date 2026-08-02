# 적대적 총기획 감사 Addendum A — Mobile Foundation 계약 진행

```yaml
audit_parent: GR-TOTAL-PLANNING-AUDIT-20260802-01
addendum_id: GR-TOTAL-PLANNING-AUDIT-20260802-A
status: PARTIAL_GAPS_CLOSED_ONE_USER_DECISION_REQUIRED
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

## 2. 새 권위 문서

- `GM-MOBILE-SESSION-RESUME-SAVE-01`
  - `docs/planning/MOBILE_SESSION_RESUME_SAVE_01_2026-08-02.md`
- `GM-MOBILE-LANDSCAPE-UX-FOUNDATION-01`
  - `docs/planning/MOBILE_LANDSCAPE_UX_FOUNDATION_01_2026-08-02.md`
- 플랫폼 공식 지침 벤치마크
  - `docs/planning/benchmarks/MOBILE_FOUNDATION_PLATFORM_GUIDELINES_BENCHMARK_2026-08-02.md`
- 사용자 Decision Packet
  - `docs/planning/MOBILE_DEVICE_CLASS_01_GRILL_ME_2026-08-02.md`

## 3. Finding 상태 변경

| Finding | 이전 | 현재 | 근거 |
|---|---|---|---|
| `GR-TPA-02` Mobile 세션 구획·Resume 누락 | RECOMMENDED_DEFAULT | CONTRACT_DEFINED | Anchor A~D·Slice Complete·저장 Trigger 정의 |
| `GR-TPA-03` Draft·후보·Commit·Record 소유권 누락 | RECOMMENDED_DEFAULT | CONTRACT_DEFINED | Draft/Recognizing/Candidate/Committed/Resolved/Recorded 정의 |
| `GR-TPA-04` Timer+필기 접근성 위험 | TEST_REQUIRED | TEST_MATRIX_DEFINED | 1.0×/0.5×·UI/Text Scale·상태 피드백 시험값 |
| `GR-TPA-05` 7~10회 필기 피로 | TEST_REQUIRED | TEST_PROTOCOL_DEFINED | Token 재선택·피로 측정·직접 작성 우선순위 유지 |
| `GR-TPA-07` 방향 결정 전 Layout 잠금 위험 | BLOCKED | UNBLOCKED_FOR_CANDIDATES | Landscape 고정 안에서 Rail/Panel 후보 작성 가능 |
| `GR-TPA-08` OS·Store·최소 기기·성능 | DEFERRED | STILL_DEFERRED | Build·Performance Gate 전 결정 Packet 필요 |
| `GR-TPA-09` PC 입력 역사 재활성 위험 | SHOULD_FIX | BOUNDARY_REINFORCED | Mobile Touch·Stylus 활성, PC 입력 후속 부록 유지 |

## 4. 적대적 검토

### 확인된 강점

- 콘텐츠를 축소하지 않고 Anchor로 Mobile 중단 가능성을 보완한다.
- 작성 상태와 결과 Transaction을 분리해 `Draft 복구`와 `중복 보상 방지`를 동시에 달성한다.
- 기존 16:9 자료를 활용하되 Safe Area·Cutout·Touch 대응 완료로 오인하지 않는다.
- UI unit 시험값과 Android dp·iOS pt 공식 하한을 구분한다.

### 기각한 접근

- 모든 화면 전환마다 완전한 진행 Save를 동기식으로 강제.
- 인식 실행 중 Request 자체를 직렬화해 재개.
- Animation 완료를 Commit·보상·Anchor 권위로 사용.
- 16:9 고정 Margin을 모든 Mobile Safe Area로 간주.
- 방향이 Landscape이므로 Smartphone·Tablet을 같은 Layout으로 자동 지원한다고 가정.

## 5. 새로 확인된 핵심 충돌

`Mobile`만으로는 지원 기기군이 충분히 정의되지 않는다.

- Smartphone Landscape는 16:9~20:9·좌우 Cutout 중심이다.
- Tablet은 4:3·3:2, 더 넓은 Canvas, 다른 정보 밀도와 Touch 도달성을 가진다.
- 두 기기군을 동일 Vertical Slice 품질 Gate로 묶으면 Layout·Asset Consumer·QA 범위가 크게 증가한다.
- 반대로 Tablet을 완전히 배제하면 Stylus·넓은 작성 Canvas 확장 가능성을 조기에 잃을 수 있다.

따라서 `GM-MOBILE-DEVICE-CLASS-01`을 `USER_DECISION_REQUIRED`로 분리한다.

권장안:

```text
Smartphone 우선 정식 Gate
+ Tablet Best-effort Smoke Test
+ Tablet 정식 지원은 Vertical Slice 이후 평가
```

## 6. 현재 판정

```text
RESUME_SAVE_CONTRACT = DEFINED
LANDSCAPE_UX_CANDIDATE_CONTRACT = DEFINED
DEVICE_CLASS = USER_DECISION_REQUIRED
REQUIRED_ASPECT_MATRIX = BLOCKED_BY_DEVICE_CLASS
OS_STORE_MIN_DEVICE_PERFORMANCE = DEFERRED_WITH_BOUNDARY
MOBILE-FOUNDATION-01 = IN_PROGRESS
CODEX = BLOCKED
PRODUCT_IMPLEMENTATION = NOT_STARTED
```
