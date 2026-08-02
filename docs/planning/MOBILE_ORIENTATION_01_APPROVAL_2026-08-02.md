# GRIMOIRE Mobile 화면 방향 승인 — GM-MOBILE-ORIENTATION-01

```yaml
decision_id: GM-MOBILE-ORIENTATION-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-02 KST
approval_source: user_approved_recommended_option
primary_platform: Mobile
orientation: LANDSCAPE_FIXED
portrait_gameplay: NOT_SUPPORTED_IN_VERTICAL_SLICE
runtime_rotation: DISABLED_IN_VERTICAL_SLICE
follow_up_platform: PC
current_gate: MOBILE-FOUNDATION-01
implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_playtest: NOT_RUN
```

## 1. 승인 결정

GRIMOIRE Mobile 버티컬 슬라이스의 모든 핵심 화면은 `Landscape 고정`을 기본 계약으로 사용한다.

적용 화면:

- Main.
- Field.
- Half-body Dialogue.
- 자유일정·선택 화면.
- Writing Overlay.
- Battle.
- Result.
- Grimoire.
- Settings·Pause·Resume.

Vertical Slice에서는 화면별 Portrait 전환, 플레이 중 자동 회전, Landscape·Portrait 동시 완전 대응을 지원 범위에 포함하지 않는다.

## 2. 선택 이유

이 결정은 다음 비타협 코어를 가장 적은 재작업으로 보존한다.

1. 직접 작성 Canvas의 유효 면적.
2. 적 위험·상황 목표·주인공 상태·작성 Panel의 동시 판독.
3. 승인된 16:9 시각 기준과 Asset의 최대 재사용.
4. 화면 전환·중단·복귀 상태 계약의 단순화.
5. Solo 제작·QA·접근성 검증 조합의 제한.
6. 후속 PC Mouse·Pen·Keyboard 적응과의 구조적 연속성.

한손 Portrait 편의보다 직접 작성과 상황 판단의 품질을 우선한다. Mobile 사용 맥락의 중단 가능성은 화면 방향을 혼합하지 않고 Resume Anchor·자동 저장·안전한 복귀 계약으로 해결한다.

## 3. 화면 계약

```text
Landscape Main
→ Landscape Field / Dialogue / Schedule
→ Landscape Writing Overlay
→ Landscape Battle
→ Landscape Result
→ Landscape Field Return
→ Landscape Grimoire
```

- OS가 Portrait 상태에서 게임을 열면 Landscape 전환 안내를 제공한다.
- 플레이 중 기기 회전은 게임 논리·시전·보상·저장 Event를 발생시키지 않는다.
- 회전·창 크기 변경·앱 중단 시 진행 중 stroke와 인식 요청은 `MOBILE-FOUNDATION-01` 상태 계약에 따라 보존 또는 폐기한다.
- 시스템 제스처 영역·Notch·카메라 홀을 포함한 Safe Area 안에 필수 목표·위험·자원·확정 버튼을 둔다.
- 우측 Writing Panel 방향은 유지하되 작은 화면에서 적과 경고를 가리는지는 별도 레이아웃 검증을 통과해야 한다.

## 4. 기존 16:9 자료의 지위

기존 16:9·1280×720·1920×1080·Ultrawide 자료는 다음과 같이 취급한다.

- 승인된 시각·구성 참고 기준으로 보존.
- Landscape-first 파생의 출발점으로 사용.
- Mobile 실기기 품질·Safe Area·Touch 판독·성능 통과 증거로 자동 승격하지 않음.
- Mobile 지원 비율, logical Canvas, Touch target, Text scale, crop·letterbox 정책은 `MOBILE-FOUNDATION-01`에서 후보와 시험값으로 작성.
- Ultrawide는 후속 PC 적응 범위이며 Mobile Vertical Slice 통과 조건이 아님.

## 5. Portrait와 회전 지원 경계

Vertical Slice 제외:

- Portrait 전용 전투·Writing 레이아웃.
- 화면별 Landscape↔Portrait 전환.
- 자동 회전 중 실시간 레이아웃 재배치.
- Landscape·Portrait 양쪽의 동일 기능·동일 품질 보장.

후속 검토 조건:

- 실기기 플레이에서 Landscape 고정이 주요 이탈 원인으로 확인됨.
- Grimoire 열람처럼 독립적인 비전투 소비자가 Portrait에서 명백한 이득을 보임.
- 추가 제작·QA 비용을 감당할 제품 단계와 기기 자료가 확보됨.

Portrait 지원을 추가할 경우 별도 Decision으로 승인하며 이번 결정을 조용히 확장하지 않는다.

## 6. Mobile Foundation에 남는 검증

방향 승인으로 다음 항목이 자동 확정되지는 않는다.

- Android/iOS·Store 우선순위.
- 지원 Aspect Ratio와 최소 화면 크기.
- Safe Area inset·Notch·system gesture 처리 수치.
- Writing Canvas 크기와 Touch target.
- Text scale·UI scale·접근성 대체 입력.
- Frame rate·Memory·Texture·Load·Battery·Thermal 목표.
- 인식 알고리즘·Latency·허용치.

위 항목은 `RECOMMENDED_DEFAULT / TEST_VALUE / USER_DECISION_REQUIRED`를 구분해 작성한다.

## 7. 적대적 검토 결과

기각한 대안:

- `게임플레이 가로 + 메뉴·Grimoire 세로`: 방향 전환·Resume·Focus·Safe Area·QA 조합을 늘려 Vertical Slice 범위를 불필요하게 확대한다.
- `모든 화면 양방향 대응`: 직접 작성·전투 정보 위계를 두 번 설계하게 되어 Solo 제작 조건과 충돌한다.
- `전체 Portrait`: 작성 Canvas와 적 위험·상태의 동시 판독을 약화시켜 프로젝트 코어를 훼손할 가능성이 높다.

남은 위험:

- Landscape 고정의 진입 마찰.
- 작은 휴대폰에서 양손 사용 피로.
- 우측 Writing Panel의 손가락 가림.
- 긴 한국어 Text와 Timer·상태 정보의 과밀.

이 위험은 실기기·접근성·사람 검증 전까지 `NOT_RUN`으로 유지한다.

## 8. 후속 작업

```text
GM-MOBILE-ORIENTATION-01
→ Mobile Resume Anchor·Save Ownership 명세
→ Landscape Safe Area·Aspect·Touch 정보 위계
→ Writing/Battle 작은 화면 레이아웃 후보
→ Grimoire/Main Landscape 파생
→ Device·Performance·Accessibility 검증 계획
→ MOBILE-FOUNDATION-01 사용자 승인
```
