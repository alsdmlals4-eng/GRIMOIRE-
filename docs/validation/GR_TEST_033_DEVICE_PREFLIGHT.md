# GR-TEST-033 Device Preflight

```yaml
gate_id: GR-TEST-033
DEVICE_NOT_RUN: true
PERFORMANCE_NOT_RUN: true
SCREEN_READER_NOT_RUN: true
```

## 공통

- 앱·Godot build 식별자와 기기 모델 대신 익명 device slot을 기록한다.
- Mobile Landscape Fixed와 Safe Area를 확인한다.
- Main·Auxiliary·Target·Preview·Commit 순서가 잘리지 않는지 확인한다.
- Reduced Motion 사용 시 장식 전환은 `0ms` 상태 교체다.
- 색상 외 텍스트·아이콘·상태 라벨이 존재한다.

## Android

- `ANDROID_48DP`: 모든 핵심 Touch Target 최소 48dp.
- Narrow Landscape와 Tall Landscape 각각 확인.
- 시스템 글자 크기 100%와 `TEXT_SCALE_130_PERCENT` 확인.
- TalkBack의 `SCREEN_READER_READING_ORDER`: 목표→회로→Preview→Target→Final Preview→Commit 순서.
- `TOUCH_AND_STYLUS`: Touch 필수, Stylus 사용 가능 기기는 별도 시도.
- `FINGER_OCCLUSION`: 회로·Target·Commit 정보를 손가락이 지속적으로 가리지 않는지 기록.

## iOS

- `IOS_44PT`: 모든 핵심 Touch Target 최소 44pt.
- Notch·Home Indicator Safe Area 확인.
- Dynamic Type 대응과 130% 상당 확대 상태 확인.
- VoiceOver 읽기 순서와 명확한 Control Name·State·Hint 확인.
- Switch/비드래그 대체 입력 경로 확인.

## 성능 기록

- 장면 진입, 회로 편집, Preview, Final Preview, Commit, Result, Focus Overlay에서 frame time을 기록한다.
- 후보 기준 `P95_FRAME_TIME_MS_33_3_TEST_VALUE`를 사용하되 출시 성능 기준으로 확정하지 않는다.
- 열화·발열·입력 지연은 Observation에 기록한다.

## Critical Accessibility Stop

다음은 `CRITICAL_SCREEN_READER_BLOCKER`다.

- Commit과 Cancel을 구분할 수 없음.
- 선택 glyph·source·Target을 읽을 수 없음.
- Preview의 성공률·Mana·위험을 읽을 수 없음.
- Focus 중단 위험과 무환불을 읽을 수 없음.
- 비드래그 대체 입력으로 핵심 루프를 완료할 수 없음.

## 결과

각 기기 셀은 `PASS_CANDIDATE / TUNE / BLOCKED / NOT_AVAILABLE / NOT_RUN` 중 하나로 기록한다. 실제 실행 전 현재 상태는 `DEVICE_NOT_RUN / PERFORMANCE_NOT_RUN / SCREEN_READER_NOT_RUN`이다.
