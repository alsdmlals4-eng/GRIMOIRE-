# Godot 별형 회로 Runtime POC 테스트 가이드

## 상태

```yaml
decision_id: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
sync_id: GR-SYNC-20260806-02-STAR-RUNTIME-POC
project: project.godot
main_scene: res://src/ui/star_circuit_harness.tscn
godot: 4.7.1.stable.official.a13da4feb
runtime_validation: AUTOMATED_HEADLESS_PASS
mobile_device_validation: NOT_RUN
human_validation: NOT_RUN
```

## Windows에서 자동 테스트

저장소 루트에서 실행한다.

```powershell
py -3 tools/run_star_runtime.py
```

이 명령은 Godot 4.7.1과 Export Template을 내려받아 해시·버전을 검증하고, 26개 Godot Suite를 Headless로 실행한다. 성공 시 마지막 JSON에서 `failures: 0`을 확인한다.

이미 검증된 설치를 재사용하려면:

```powershell
py -3 tools/run_star_runtime.py --skip-setup
```

## Godot Editor 열기

```powershell
py -3 tools/run_star_runtime.py --editor
```

Editor에서 F6 또는 F5를 누르면 `star_circuit_harness.tscn`이 실행된다. 중앙 Main, 외곽 5개 Vertex, Circuit Preview, Target Keyword, Final Preview, Commit이 보여야 한다.

## 수동 확인 체크

1. 중앙 Main은 정확히 1개다.
2. 외곽 Vertex는 기능적으로 동등한 5개다.
3. 회로 내부에 Target 노드가 없다.
4. 회로 Preview 뒤에만 Target Keyword를 선택한다.
5. Target 선택 뒤 숫자 성공률·마나 Final Preview가 나온다.
6. Commit 전 Cancel은 자원을 변경하지 않는다.
7. 동일 Commit 재호출은 Stock·Vault·Mana를 다시 소비하지 않는다.
8. 48dp 최소 Touch target과 Reduced Motion 0ms 계약을 유지한다.

## 검증 경계

이 Harness는 Low-fi POC다. 실제 Android/iOS 기기, Narrow/Tall Landscape, Touch·Stylus, Text 130%, Screen Reader, 프레임 성능, 사람 핵심 재미 검증은 별도 실행이 필요하다. 자동 테스트 PASS를 출시 PASS나 Full Vertical Slice PASS로 해석하지 않는다.
