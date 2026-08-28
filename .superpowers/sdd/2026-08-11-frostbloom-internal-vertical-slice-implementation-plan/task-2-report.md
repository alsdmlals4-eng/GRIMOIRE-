# Task 2 보고서 — Frostbloom Content Data and Slice State

## 결과

- 상태: 구현 완료, 커밋 대기
- 범위: Frostbloom 내부 슬라이스의 결정적 ID 데이터와 UI/Node 비의존 평문 상태 머신
- 제외: 기존 SpellWorkflowCoordinator, Mana, atomic spell-use, result ledger, persistence API, 문서 및 project settings

## TDD 증거

### RED

테스트와 `tests/test_runner.gd`에 suite를 먼저 추가한 뒤, 생산 스크립트를 임시로 부재시켜 실행했다.

명령:

```text
Godot_v4.7.1-stable_win64_console.exe --headless --path . --script res://tests/test_runner.gd
```

관찰 결과:

```text
ERROR: Attempt to open script 'res://src/core/frostbloom/frostbloom_slice_state.gd' resulted in error 'File not found'.
ERROR: Frostbloom slice state compiles
{"assertions":2002,"failure_messages":["Frostbloom slice state compiles"],"failures":1,"schema_version":1,"suite_count":48}
```

이는 테스트가 구현 부재를 실제로 검출하는 RED 결과다.

### GREEN

최소 구현 후 동일한 명령으로 실행했다.

```text
Godot_v4.7.1-stable_win64_console.exe --headless --path . --script res://tests/test_runner.gd
```

```text
{"assertions":2059,"failure_messages":[],"failures":0,"schema_version":1,"suite_count":48}
```

## 변경 파일

- `data/frostbloom/internal_slice_v1.json`: 승인된 Frostbloom v1 안정 ID 계약
- `src/core/frostbloom/frostbloom_slice_state.gd`: 순수 `RefCounted` 상태 머신 및 snapshot/restore
- `tests/unit/test_frostbloom_slice_state.gd`: 생성, 7개 writing cap, schedule 1회, 조사 2개 unique, reveal/redesign 순서, plain-data snapshot 검증
- `tests/test_runner.gd`: 새 unit suite 등록

Godot 실행으로 생성된 `.import` 및 기타 산출물은 stage하지 않았다.

## 자기 검토

- 모든 새 GDScript는 첫 줄에 한국어 역할 주석을 포함했다.
- 상태는 Node 참조 없이 StringName, 배열, Dictionary, primitive만 보관한다.
- 정상 writing은 승인된 W1–W7만 허용하고 중복/8번째를 거부한다.
- free schedule은 네 선택지 중 한 번만 선택된다.
- investigation은 승인된 네 노드 중 고유 두 개까지만 기록된다.
- first solution 전 reveal/redesign은 거부되고, first solution 후 reveal이 기존 first-solution 상태를 덮어쓰지 않는다.
- snapshot restore는 schema 및 핵심 순서 일관성을 확인한다.

## 우려 사항

Godot 콘솔 실행은 성공했지만, 실제 모바일 기기/사람 플레이 검증은 이 Task 범위에서 수행하지 않았다. `RECOVERY_INCLUSIVE_CAP`은 다음 consequence/recovery 계층에서 사용할 계약 상수로만 유지했다.
