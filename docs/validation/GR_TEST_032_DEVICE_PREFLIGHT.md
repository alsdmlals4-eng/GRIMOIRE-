# GR-TEST-032 물리 기기 Preflight

## 상태

```yaml
test_id: GR-TEST-032
status: READY_FOR_DEVICE_PREFLIGHT_HUMAN_NOT_RUN
artifact_sha: ARTIFACT_SHA_REQUIRED
required_device_classes:
  - NARROW_LANDSCAPE_16_9_TO_18_9
  - TALL_LANDSCAPE_19_5_9_TO_20_9
```

각 물리 기기마다 별도 사본을 작성한다. 필수 항목 하나라도 실패하면 참가자 세션을 시작하지 않는다.

## 기기 식별

```yaml
device_anonymous_id: required
platform: ANDROID_OR_IOS
os_version: required
screen_resolution_px: required
landscape_aspect_ratio: required
display_scale_or_density: required
build_id: required
artifact_sha: ARTIFACT_SHA_REQUIRED
preflight_operator_id: anonymous_or_role_only
```

기기 소유자 이름·계정·전화번호를 기록하지 않는다.

## 기본 실행

- [ ] 앱이 설치 또는 실행된다.
- [ ] 빌드 ID와 Artifact SHA가 테스트 기록과 일치한다.
- [ ] Landscape 고정이 적용된다.
- [ ] 앱 재시작 후 동일한 Fixture와 Runtime 6종이 로드된다.
- [ ] 네트워크가 필요한 기능이 테스트 흐름을 차단하지 않는다.
- [ ] 저장 공간·배터리·발열 상태가 세션을 완료할 수 있다.
- [ ] 알림·전화·화면 회전 등 외부 방해 요소를 최소화했다.

## 화면 분류

기기군 중 하나를 선택한다.

```text
NARROW_LANDSCAPE_16_9_TO_18_9
TALL_LANDSCAPE_19_5_9_TO_20_9
```

- [ ] Safe Area 안에 Top Context가 완전히 보인다.
- [ ] Left Rail이 잘리거나 겹치지 않는다.
- [ ] 3×3 Circuit의 모든 셀과 연결이 보인다.
- [ ] Right Writing Canvas가 손가락과 시스템 제스처 영역에 의해 치명적으로 가려지지 않는다.
- [ ] Bottom Source·Preview·Commit 영역이 Safe Area 안에 있다.
- [ ] 상태 메시지가 노치·카메라 홀·홈 인디케이터와 겹치지 않는다.

```text
SAFE_AREA
```

## 터치 대상·대안 입력

```text
ANDROID_TOUCH_TARGET_48DP
IOS_TOUCH_TARGET_44PT
NON_DRAG_ALTERNATIVE_REQUIRED
```

- [ ] Android 상호작용 요소가 최소 48dp 기준을 충족한다.
- [ ] iOS 상호작용 요소가 최소 44×44pt 기준을 충족한다.
- [ ] Source 선택·Preview·Commit·Cancel을 한 번의 명확한 탭으로 조작할 수 있다.
- [ ] Drag 실패 시 탭 기반 취소·초기화·후보 선택 대안이 있다.
- [ ] Active Stroke 중 Circuit·Preview·Commit이 입력을 훔치지 않는다.
- [ ] 화면 가장자리 시스템 Back/Home Gesture와 핵심 입력이 반복 충돌하지 않는다.

## 텍스트·색상·모션

- [ ] 기본 Text Scale 100%에서 잘림이 없다.
- [ ] Text Scale 130%에서 핵심 정보가 유지된다.
- [ ] 가능한 기기에서는 Text Scale 200%에서 필수 기능 접근이 가능하다.
- [ ] 성공·Retry·차단 상태를 색상만으로 구분하지 않는다.
- [ ] 명암·아이콘·텍스트 상태가 함께 제공된다.
- [ ] `REDUCED_MOTION` 활성화 시 필수 정보가 사라지지 않는다.
- [ ] Reduced Motion에서는 불필요한 전환 애니메이션이 0ms 또는 즉시 상태 전환으로 대체된다.

## Recognition 입력

- [ ] HEAT·PROTECT·FLOW·FOCUS·DISPERSE·BURST 6종이 정확히 표시된다.
- [ ] Warm-up과 Scored Attempt가 구분된다.
- [ ] Dominant·Non-dominant 손 전환이 가능하다.
- [ ] Retry 후 이전 결과가 stale 상태로 저장되지 않는다.
- [ ] 선택 Glyph와 인식 Glyph 불일치 시 저장이 차단된다.
- [ ] 성공 결과는 Exact Vault에만 저장된다.

## Stage 2 Harness

- [ ] 상황 A와 B가 모두 로드된다.
- [ ] Retry 중 상황·대상·출처·회로 Draft가 유지된다.
- [ ] Vault와 Stock 출처를 글자별로 명시할 수 있다.
- [ ] 3×3 인접 연결·Target terminal leaf·교차 간선 금지가 적용된다.
- [ ] Preview 전 자원 변경이 없다.
- [ ] 별도 Confirm 없이 Commit되지 않는다.
- [ ] Cancel 후 비용·보상·결과가 추가되지 않는다.
- [ ] 중복 Confirm에 추가 Mutation이 없다.

## 로그·개인정보

- [ ] 익명 참가자 ID만 입력할 수 있다.
- [ ] Recognition/Core-loop/Moderator 이벤트가 분리된다.
- [ ] 모든 기록에 Artifact SHA와 Fixture ID가 포함된다.
- [ ] 이름·이메일·전화번호·계정명 입력 칸이 없다.
- [ ] 화면 녹화 파일명에도 개인 이름을 사용하지 않는다.

## Hard Stop 사전 확인

아래 테스트를 운영자가 직접 1회씩 수행한다.

- [ ] 오인식 후보를 확정하려 할 때 차단 또는 명확한 Retry가 발생한다.
- [ ] Commit 버튼을 잘못 탭해도 별도 Confirm 전에는 실행되지 않는다.
- [ ] Confirm을 두 번 시도해도 중복 비용·결과가 없다.
- [ ] Retry 이전 stale 결과가 적용되지 않는다.

```text
ACCEPTED_FALSE_ZERO_HARD_STOP
ACCIDENTAL_COMMIT_ZERO_HARD_STOP
DUPLICATE_SAVE_OR_REWARD_ZERO_HARD_STOP
STALE_RESULT_APPLICATION_ZERO_HARD_STOP
```

## 판정

```yaml
preflight_result: PASS_OR_FAIL
failed_required_items: []
human_session_start_authorized: false_until_all_required_pass
human_validation_status: NOT_RUN
```

Preflight PASS는 사람검증 PASS가 아니다. 실제 참가자가 실행하기 전 `human_validation_status`는 `NOT_RUN`으로 유지한다.
