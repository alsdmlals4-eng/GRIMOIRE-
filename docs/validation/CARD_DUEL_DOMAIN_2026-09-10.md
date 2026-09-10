# 첫 카드 결투 도메인 — 구현·검증 기록

## 승인·범위·책임

- 사용자: `좋아 권장안대로 계속 진행해`. 기준 계획: `docs/superpowers/plans/2026-09-10-card-duel-domain-implementation.md`; 규칙: 같은 폴더 계열의 `specs/2026-09-10-card-duel-blueprint.md`.
- 시작 HEAD: `877228a92b9867c38e9286cd36bf8ad4d4924a90`, branch `codex/replanning-intake-20260910`. 현재 구현은 이 기록을 포함하는 커밋에서 확인한다.
- 코드 owner: `src/core/card_duel/duel_rules.gd`, `duel_exchange.gd`, `duel_match.gd`. 실제 consumer: `tests/test_runner.gd`가 등록한 같은 이름의 3개 unit suite. 새 UI 소비자는 아직 없다.
- old glyph/star 코드, 과거 이미지, 기존 저장, 사용자 fixture 변경은 건드리지 않았다. #253/#249/#187/#166은 live read-only 확인. main 병합/CI 완료를 주장하지 않는다.
- 운영 계약: project validator `OPERATING_CONTRACT_VALID`, 19 routes CURRENT, Base v9.4.3 유지.

## 작업 전 문제 → 조사·채택

규칙은 승인됐지만 실행 가능한 새 카드 도메인이 없었다. 기존 10게임 비교 결과와 승인 표를 유지하고 새 숫자/카드 종류를 추가하지 않았다. Godot 공식 [RandomNumberGenerator](https://docs.godotengine.org/en/stable/classes/class_randomnumbergenerator.html)를 fresh-read했다. seed 재현과 state 복구를 ADOPT, JSON 저장의 seed/state 10진 문자열화를 ADAPT, 임의 state 생성 및 다른 엔진 버전 간 동일 난수 보장은 REJECT한다. RNG 알고리즘은 엔진 내부 사항이므로 버전 변경 시 회귀가 필요하다.

변경 전 첫 검사: 51 suites / 1986 assertions / 25 failures. 캐시가 `artifacts/recovery/.../spell_workflow_state.gd`를 글로벌 클래스로 가리켰다. 기존 `artifacts/recovery/.gdignore`를 확인한 뒤 headless editor import로 캐시를 갱신했다. 소스나 복구 파일 삭제 없이 51 suites / 2055 assertions / 0 failures로 회복됐다. import 종료의 ObjectDB/resource 경고는 관찰했고 최종 테스트 stderr에는 없었다.

## 실제 결과·사용 예

1. 4종 단독 + 다른 종류 2장 조합 6종. 중복 종류/잘못된 수/미등록 종류 거부. 문자열 기준 순서 정규화.
2. 방어 → 제거 → 공격 감소 → 피해 → 실제 차단량 한도 반사 → 양쪽 결계 동시 판정. 미리보기는 입력을 변경하지 않는다.
3. 8장 고유 인스턴스, 손패4, 상대 예고 4/0→2/4→6/0, 사용한 카드만 버림/보충, WAIT의 선택 카드 미사용, 명시 명령 중복 방지, 손상/미지원 snapshot 거부, JSON 재개.

예: 바람+결계를 쓰면 방어3/반사상한2. 상대 공격4라면 자신 피해1·상대 반사피해2가 함께 반영된다. 상대 방어가 높아도 반사피해는 이를 우회한다. 이것은 현재 승인된 시험 규칙이지 최종 밸런스 승인은 아니다.

## 검증 증거

엔진: 프로젝트 `.tooling/godot/4.7.1-stable/windows/Godot_v4.7.1-stable_win64.exe`.
명령: `--headless --path . --script res://tests/test_runner.gd`. Windows에서는 Start-Process -Wait -PassThru로 실제 exit code와 stdout/stderr를 함께 확인했다.

| 단계 | 관찰 결과 |
|---|---|
| 규칙/교환 RED | 53 suites / 2057 assertions / 2 failures: 새 두 모듈 부재 |
| 규칙/교환 교정 | StringName 비문자순 정렬을 PackedStringArray로 교정; 동적 호출 테스트의 typed-array 전달 교정 |
| 규칙/교환 GREEN | 53 suites / 2104 assertions / 0 failures; stderr empty |
| 매치 RED | 54 suites / 2105 assertions / 1 failure: 새 매치 부재 |
| 저장 반례 | JSON의 float/String 복원 차이, 손상된 outcome 타입/교환 번호를 검출하고 정규화·거부 경계 교정 |
| 최종 GREEN | 54 suites / 2153 assertions / 0 failures; exit 0, stderr empty |
| diff | git diff --check: exit 0; 기존 fixture는 커밋 제외 |

테스트 실행기의 exit 0만으로는 script error를 검출하지 못하는 반례를 관찰했다. 최종 결과는 failure 수뿐 아니라 stderr empty와 실행 assertion 수를 대조했다. 위 실행 로그는 task-local `.tooling/card-duel-*.log`에 생성했으며 기획/게임 자산 정본이 아니다.

## 5회 전체 범위 검토·학습

1. 승인 의도/경계: 별형·그리기·마법사 카드·3라운드·7/7/6을 새 모듈에 도입하지 않음. UI/스토리와 분리.
2. Domain: 4단독/6조합/역순/반사/동시 승패를 표와 대조. StringName 정렬 반례 교정.
3. Safety: 원본 무변경, 중복 instance/command, stale revision, 종료 이후 명령, 손상 필드·버전 거부. 로컬 snapshot 검증이지 변조 방지 보안 인증 아님.
4. Save/consumer: 64-bit RNG 문자열, 정수/receipt 타입 정규화, 셔플 포함 재개와 총 카드 보존 검사. 다른 엔진 버전·파일 저장 UI는 미검증.
5. Simplify/style/delivery: 고정 표/단일 판정 함수/매치 책임 분리. 실제 3 suite 등록. 오래된 Active Context 상태 교정. 사용자 fixture/다른 PR 보호. 이미지 방향 승인과 runtime 승격 분리.

공용 개선 후보: Godot 검증은 exit code + failure 수 + stderr의 script error + 기대 suite 소비를 함께 확인할 것. 현재는 프로젝트 기록과 실제 실행에 반영했으며 Base에 검증기 변경을 무단 승격하지 않았다.

## 미검증·남은 위험·다음 안전 작업

- 새 카드 UI/터치/명시 시전 피드백, 분리 배경/상반신/카드 이미지·모션, 스토리 진입/보상/메인 메뉴 연결: NOT_RUN.
- 카드 파일 저장 서비스는 아직 연결하지 않음. restore는 메모리 snapshot API, 기존 저장 덮어쓰기 없음.
- Human/Device/접근성/성능/출시/전체 게임 완료: NOT_RUN.
- main 통합, exact-head PR CI, post-merge readback: 미완료. 로컬 도메인 PASS와 구분.
- 다음은 승인된 아트 방향(중앙 별 제외)을 바탕으로 분리 자산 및 카드 UI 패키지를 설계·제작하고 이 도메인에 연결하는 작업이다.
