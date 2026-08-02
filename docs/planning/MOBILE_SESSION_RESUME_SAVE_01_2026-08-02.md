# GM-MOBILE-SESSION-RESUME-SAVE-01 — Mobile 세션·이어하기·저장 소유권 계약

```yaml
decision_id: GM-MOBILE-SESSION-RESUME-SAVE-01
status: MODEL_RECOMMENDED_ACTIVE_USER_DELEGATED_DETAILING
approved_scope_basis: USER_APPROVED_RECOMMENDED_DEFAULTS_AND_PROCEED
parent_gate: MOBILE-FOUNDATION-01
primary_platform: Mobile
follow_up_platform: PC
product_implementation: NOT_STARTED
runtime_validation: NOT_RUN
mobile_device_validation: NOT_RUN
human_playtest: NOT_RUN
```

## 1. 목적

45~50분 Vertical Slice의 콘텐츠와 순서를 줄이지 않으면서 Mobile 사용자가 통화·알림·홈 이동·앱 전환·프로세스 종료 이후에도 진행과 작성 의도를 잃지 않게 한다.

이 문서는 다음을 분리한다.

- 콘텐츠 진행을 복원하는 **Resume Anchor**.
- 작성 중 상태를 복구하는 **Session Snapshot**.
- 마나·결과·보상·마도서 기록을 한 번만 확정하는 **Persistent Transaction**.
- 화면 연출·애니메이션과 게임 규칙의 권위 경계.

## 2. 보호할 기존 정본

- 콘텐츠 순서: 수업→자유일정·시험→축제→현장→귀환·마도서.
- 목표 45~50분, 콘텐츠 상한 53분, 하드 상한 60분.
- 신규·미숙·중요 글자의 직접 작성.
- 낮은 확신 후보 자동 확정·자동 시전 금지.
- 입력 실패·문법 실패·상황 설계 실패·비용 부족 분리.
- 판단·작성 중 Timer 진행, 시스템 해결 중 정지.
- 제품 구현 `NOT_STARTED`, 런타임·기기·사람 검증 `NOT_RUN`.

## 3. Resume Anchor

전체 Slice를 다음 다섯 구간으로 나눈다.

```text
첫 수업·교내 연습
→ Anchor A
→ 자유일정 A·첫 실기시험
→ Anchor B
→ 자유일정 B·학교축제
→ Anchor C
→ 자유일정 C·첫 현장 전투
→ Anchor D
→ 현장 환경 해결·귀환·마도서 기록
→ Slice Complete
```

### Anchor 확정 조건

Anchor는 해당 구간의 다음 항목이 모두 완료됐을 때만 확정한다.

1. 필수 결과 Event 확정.
2. 자원·HP·마나·불안정도·환경 상태 반영.
3. 보상·해금·관계·자유일정 태그 반영.
4. 다음 구간 진입 위치와 목표 지정.
5. 중복 처리 방지 Transaction ID 기록.
6. 저장 검증값 작성.

중간 화면 전환이나 애니메이션 완료만으로 Anchor를 확정하지 않는다.

## 4. 상태 소유권

| 상태 | 의미 | 권위 소유자 | 저장 등급 | 중단 후 처리 |
|---|---|---|---|---|
| `Draft` | 완료된 획과 현재 조합 초안 | Writing Domain | Session Snapshot | 완료된 획 복원, 진행 중 미완성 획 폐기 |
| `Recognizing` | 인식 요청이 실행 중 | Recognition Request | 저장하지 않음 | 요청 폐기 후 저장된 완료 획로 새 요청 |
| `Candidate` | 후보 목록과 사용자 선택 대기 | Writing Domain | Session Snapshot | 후보와 원본 획을 다시 표시; 자동 확정 금지 |
| `Committed` | 사용자가 `[구현]`을 승인하고 비용 예약 완료 | Battle/Spell Domain | Persistent Transaction | 같은 Transaction ID로 해결 재개; 비용 재차감 금지 |
| `Resolved` | 전투·상황 결과가 도메인에 반영됨 | Situation/Battle Domain | Persistent Transaction | 결과 재적용 금지; 미기록 후처리만 진행 |
| `Recorded` | 보상·귀환·마도서 기록까지 확정 | Progression/Grimoire Domain | Persistent Save | 다음 Anchor 또는 다음 목표로 이동 |

UI·AnimationPlayer·Tween·컷신 완료 Signal은 위 상태를 확정하는 권위가 아니다.

## 5. 저장 계층

### 5.1 Transient Input Buffer

- 현재 입력 중인 단일 획의 샘플.
- 메모리 전용.
- App pause·focus loss·system gesture가 발생하면 해당 미완성 획만 폐기한다.
- 이미 완료된 획은 Session Snapshot에 남긴다.

### 5.2 Session Snapshot

복구 가능한 현재 화면 상태를 담는다.

최소 필드:

```text
save_schema_version
content_version
session_id
resume_anchor_id
flow_state
screen_id
situation_id
objective_id
completed_strokes
selected_candidate_id
spell_components
battle_state_reference
pending_transaction_id
free_schedule_tag
return_marker
saved_at
checksum
```

원본 Texture·이미지·대형 로그는 저장하지 않고 ID와 재구성 가능한 최소 데이터만 저장한다.

### 5.3 Persistent Transaction

다음 작업은 고유 Transaction ID를 가진다.

- 마나·소모 자원 차감.
- 주문 Commit.
- 적 공격 해결.
- Situation 결과 반영.
- 보상·해금 지급.
- 마도서 기록 생성.
- Anchor 확정.

같은 Transaction ID는 여러 번 요청돼도 한 번만 반영한다.

### 5.4 Persistent Progress Save

- 마지막 확정 Anchor.
- 완료된 Situation·결과·해금·보상·관계·마도서 기록.
- 현재 콘텐츠 버전과 저장 Schema 버전.
- 마지막 정상 Snapshot의 검증값.

## 6. 저장 Trigger

| Trigger | 저장 대상 | 플레이 차단 | 실패 시 |
|---|---|---|---|
| Anchor 완료 | Persistent Progress + Session Snapshot | 짧은 완료 상태 동안만 | 이전 Anchor 유지, 재시도 안내 |
| Situation/Battle 진입 | Session Snapshot | 차단 없음 | 이전 Anchor에서 안전 재진입 가능 |
| 사용자 후보 확정 | Session Snapshot | 차단 없음 | 마지막 완료 획·후보 단계로 복구 |
| `[구현]` 승인 | Persistent Transaction 선기록 | Commit 해결 동안 입력 잠금 | 비용·시전 중복 없이 같은 Transaction 재개 |
| Result 확정 | Persistent Transaction + Snapshot | Result 해결 동안 입력 잠금 | 결과 재적용 없이 기록 단계 재개 |
| App pause/background/focus loss | 즉시 가능한 Session Snapshot 시도 | 시스템 전환을 지연시키지 않음 | 마지막 정상 Snapshot 또는 Anchor 사용 |
| 정상 종료·메인 복귀 | Session Snapshot + Progress | 저장 상태 표시 | 실패 사유와 재시도 제공 |

OS lifecycle callback 하나만 저장 권위로 의존하지 않는다. 핵심 진행은 사건 발생 시점에 Persistent Transaction과 Anchor로 먼저 기록한다.

## 7. 중단·복구 Matrix

| 중단 위치 | 복구 위치 | 보존 | 폐기·재실행 |
|---|---|---|---|
| 획 입력 중 | 같은 작성 화면 | 완료 획·조합 | 미완성 획 폐기 |
| 인식 요청 중 | 후보 대기 전 단계 | 완료 획 | stale request 폐기·인식 재요청 |
| 후보 선택 중 | 같은 후보 화면 | 후보·원본 획 | 자동 선택 없음 |
| `[구현]` 직전 | Draft/Candidate | 작성 상태 | Commit 전이면 비용 미소모 |
| `Committed` 후 해결 전 | 해결 재개 | Transaction·예약 비용 | Commit·비용 재실행 금지 |
| 적 공격 해결 중 | 해당 Event 해결 재개 | Event 순서·전투 상태 | 중복 피해 금지 |
| `Resolved` 후 보상 전 | Result/Record 단계 | 결과 | 결과·보상 재적용 금지 |
| 마도서 기록 중 | 미완료 기록 편집 또는 자동 초안 | 결과·발견 | 완성 기록 중복 생성 금지 |
| Anchor 저장 실패 | 직전 정상 Anchor | 이전 진행 | 실패한 Anchor는 확정 표시 금지 |

## 8. 충돌·손상 복구

저장 파일은 다음 우선순위로 읽는다.

1. 최신 정상 Persistent Progress Save.
2. 같은 콘텐츠 버전의 최신 정상 Session Snapshot.
3. 직전 정상 Resume Anchor.
4. 신규 시작.

검증 실패 시:

- 손상 Slot을 덮어쓰지 않고 격리한다.
- 사용자에게 `마지막 안전 지점에서 계속`과 `새로 시작`을 구분해 보여 준다.
- 손상된 Snapshot 때문에 보상·마나·결과를 추정해 생성하지 않는다.
- 콘텐츠 버전 불일치는 명시적 migration 계약이 없으면 Anchor 단위로만 복구한다.

## 9. 사용자 피드백

- 자동 저장 완료: 작고 비차단적인 상태 표시.
- 저장 진행 중: 화면 전환은 가능하되 Commit·Result 중복 입력은 잠금.
- 복구 성공: `마지막 작성 상태를 복구했습니다`와 폐기된 미완성 획 여부 표시.
- stale recognition 폐기: 오류가 아니라 `입력을 다시 확인합니다`로 설명.
- 저장 실패: 원인·보호된 마지막 Anchor·재시도 행동을 함께 표시.
- 감속·접근성 옵션 사용은 저장·보상에 불이익을 주지 않는다.

## 10. 검증 Fixture

최소 Fixture:

1. Anchor A~D 각각 정상 저장·재개.
2. 획 중단 3회 반복 후 완료 획 보존.
3. 인식 요청 중 background 후 stale 결과 폐기.
4. `[구현]` 승인 직후 프로세스 종료 후 비용·시전 1회.
5. 적 공격과 주문 Commit 경합 후 승인 Event 순서 보존.
6. Result 직후 종료 후 보상·기록 1회.
7. 마도서 기록 중 종료 후 중복 기록 0.
8. 손상 Snapshot에서 직전 Anchor 복구.
9. Save schema 불일치에서 안전 복구.
10. 접근성 감속 사용 후 동일 보상.

### 통과 기준

```text
중복 Commit = 0
중복 비용 차감 = 0
중복 적 피해 = 0
중복 보상 = 0
중복 마도서 기록 = 0
stale recognition 자동 반영 = 0
복구 후 잘못된 목표·return marker = 0
손상 Save 자동 덮어쓰기 = 0
```

실제 저장 시간·파일 크기·복구 시간은 구현과 기기 측정 전까지 `TEST_VALUE_PENDING`이다.

## 11. 범위 밖

- Cloud Save·계정 동기화.
- 여러 수동 Slot.
- 다른 기기 간 이어하기.
- Replay·되감기.
- 저장 데이터 암호화·부정행위 방지 최종안.
- Android/iOS별 배포·백업 정책.

## 12. Gate 영향

```text
GR-TPA-02 = CONTRACT_DEFINED
GR-TPA-03 = CONTRACT_DEFINED
MOBILE-FOUNDATION-01 = IN_PROGRESS
CODEX = BLOCKED
PRODUCT_IMPLEMENTATION = NOT_STARTED
```

이 계약은 세션·저장 누락을 닫지만 Mobile Foundation 전체를 승인하지 않는다. 지원 기기군·Aspect·Safe Area·Touch·성능·OS/Store·실기기 검증은 후속 계약과 Decision이 필요하다.
