# GR-SYNC-20260811-08-WORLD-NAME-CONSUMER-CLEANUP

```yaml
sync_id: GR-SYNC-20260811-08-WORLD-NAME-CONSUMER-CLEANUP
decision_id: GM-WORLD-CHARACTER-THREE-YEAR-STORY-01
status: USER_APPROVED_SUPPLEMENTAL_CONSUMER_CLEANUP
base_current_main_observed: 315c66eea9614c284b9c11c4d522141065dfa4b0
project_main_at_entry: f378708c62ca8cb6b47d23fd2ea9e0b3f45220d6
branch: planning/c-world-name-consumer-cleanup
persistent_godot_source_mutation: NONE
sheet_write_readback: PASS
```

## Fresh-start finding

C가 main에 병합된 뒤에도 Google Sheet의 Year-One Ch3 current consumers 두 곳이 `선택 계열 α/β`, `WORLD_NAMES_PENDING_C`, `C_DETAIL_PENDING`을 남기고 있었다.

이 항목은 고권위 정본 충돌은 아니지만 이미 승인·병합된 C의 계열 이름을 소비하지 못하는 stale consumer다.

## Corrected current consumers

- `50_메인콘텐츠` row 16: Ch3 계열 표현을 `유동학(FLOW) / 변성학(HEAT) / 결계학(PROTECT)` 정본으로 전진.
- `52_글쓰기_서사` row 12: 같은 세 계열의 서로 다른 관점과 C 정본 참조로 전진.
- 두 행 모두 A의 Chapter 구조 소유권과 C의 세계 이름 소유권을 함께 표시.
- `04_누락_충돌_감사`와 `99_변경이력`에 동일 Decision/Sync를 기록하고 readback PASS 확인.

## Preserved boundaries

- B의 성장·경제 수치에는 변경 없음.
- D의 Vertical Slice 시간·밀도에는 변경 없음.
- FIVE_POINT_STAR / Spell Workflow runtime 권위에는 변경 없음.
- Task8 Draft PR #116 ON_HOLD 상태에는 변경 없음.
- `.gd/.tscn/.tres/.res/project.godot` 변경 없음.

## Evidence state

```text
SHEET_WRITE_READBACK_PASS
RUNTIME_NOT_RUN
DEVICE_NOT_RUN
HUMAN_PLAYTEST_NOT_RUN
PERFORMANCE_NOT_RUN
```

이 sync는 이미 승인된 C의 current consumer 정리만 수행하며 새 제품 결정이 아니다.
