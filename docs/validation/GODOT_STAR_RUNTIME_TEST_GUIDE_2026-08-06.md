# Godot 별형 회로 Runtime Completion 테스트 가이드

## 상태

```yaml
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-03-STAR-RUNTIME-COMPLETION
project: project.godot
main_scene: res://src/ui/star_circuit_harness.tscn
godot: 4.7.1.stable.official.a13da4feb
runtime_validation: AUTOMATED_HEADLESS_PASS
suite_count: 31
assertions: 1137
failures: 0
mobile_device_validation: NOT_RUN
performance_validation: NOT_RUN
accessibility_device_validation: NOT_RUN
human_validation: NOT_RUN
```

## Windows에서 최초 자동 테스트

저장소 루트에서 실행한다.

```powershell
py -3 tools/run_star_runtime.py
```

Godot 4.7.1과 Export Template을 내려받아 버전·해시를 검증한 뒤 31개 Godot Suite를 Headless로 실행한다. 성공 시 마지막 JSON은 다음 계약을 만족해야 한다.

```json
{"suite_count":31,"assertions":1137,"failures":0}
```

## 설치 재사용

```powershell
py -3 tools/run_star_runtime.py --skip-setup
```

`godot-star-runtime-local-report.json`이 `PASS`이고 기록된 Godot 실행 파일이 실제로 존재할 때만 재사용한다.

## Godot Editor 열기

```powershell
py -3 tools/run_star_runtime.py --editor --skip-setup
```

Editor에서 F6 또는 F5를 누르면 `star_circuit_harness.tscn`이 실행된다.

## Main Scene 직접 실행

```powershell
py -3 tools/run_star_runtime.py --run --skip-setup
```

현재 Main Scene은 최종 게임 화면이 아니라 모바일 가로형 Low-fi 검증 Harness다.

## 자동 검증 범위

- 중앙 메인 글자 정확히 1개, 동등한 외곽 보조 슬롯 0~5개.
- 회로 Preview 후 대상 키워드, 이후 최종 성공률·마나 Preview.
- 글자별 숙련도·보조 복잡도·PRECISION·REDUCTION 계산.
- Typed Glyph Stock: 같은 glyph_id 재고만 예약·소비.
- Vault·Typed Stock·Mana·결과 Exactly-once Commit.
- Commit 전 Cancel·검증 실패·중복 Commit 추가 소비 0.
- `FULL_SUCCESS / PARTIAL_SUCCESS / IMPERFECT_EXECUTION / FAILURE / BACKLASH` 결과 Policy.
- 집중 필사: 0.25 Active Pressure, 실제 시간 Mana 소모, 같은 glyph_id Stock +1, 취소 무환불.
- Frostbloom 6개 해결 의도와 Best route·자동 Target·자동 Commit 금지.
- 48dp, Text 130% 계약, 색 외 라벨, Reduced Motion 0ms.

## 수동 Harness 확인

1. 중앙과 외곽 역할이 즉시 구분되는지 본다.
2. 빈 보조 슬롯이 허용됨을 확인한다.
3. 숙련도·성공률·마나 Breakdown과 원인 글자 경고를 확인한다.
4. `INSUFFICIENT MANA`, `UNSTABLE CIRCUIT`, 접근성 입력 상태를 확인한다.
5. 회로 Preview 이전에 Target을 고를 수 없어야 한다.
6. 명시적 Commit 이전에는 자원이 변하지 않아야 한다.
7. 집중 필사 Overlay에서 선택 글자·남은 시간·Mana 속도·중단 위험·용량·무환불 경고를 확인한다.

## 검증 경계

자동 PASS는 코드·Scene·데이터 계약 증거다. 실제 Android/iOS 기기, Narrow/Tall Landscape, 손가락 가림, Touch·Stylus, Screen Reader, 프레임 성능, 사람의 의미 이해와 핵심 재미, Full Vertical Slice는 `NOT_RUN`이다. 자동 테스트 PASS를 출시 PASS로 해석하지 않는다.
