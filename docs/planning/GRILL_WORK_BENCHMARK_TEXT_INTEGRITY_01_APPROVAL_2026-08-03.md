# GM-GRILL-WORK-QUALITY-GATE-01 — GrillMe·작업 벤치마킹·현업 비교·Text Integrity Gate

## 1. 승인 상태

```yaml
decision_id: GM-GRILL-WORK-QUALITY-GATE-01
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-03T00:04:00+09:00
approved_by: USER_DIRECT_INSTRUCTION
approved_option: A_BENCHMARK_INDUSTRY_RECOMMENDATION_AND_TEXT_INTEGRITY_GATE
benchmark_id: GR-BM-SUMMON-ACTIVE-3-WORK-QUALITY-01
grill_me_batch: 4_of_10
implementation_scope: PROJECT_WORKFLOW_AND_VALIDATION_ONLY
product_implementation: NOT_STARTED
```

## 2. 목적

앞으로 GRIMOIRE의 GrillMe 질문과 실질 작업은 내부 추론만으로 결론을 확정하지 않는다.

```text
프로젝트 근거
+ 외부 벤치마킹
+ 현업·공식·표준 비교
+ 중립적 권장안
+ 적대적 검토
+ Text Integrity 검증
```

위 여섯 요소를 하나의 품질 Gate로 사용한다.

## 3. 적용 범위

필수 적용:

- GrillMe 질문과 승인 후보.
- 새 시스템·규칙·수치·콘텐츠·UX·기술 구조.
- 기존 승인 구조를 의미 있게 변경하는 작업.
- 작업 순서·Gate·정본 라우팅을 바꾸는 운영 결정.
- 사용자가 비교·추천·검증을 요구한 모든 작업.

경량 적용:

- 오탈자·SHA·링크·날짜·상태 동기화.
- 의미가 바뀌지 않는 단순 표기 교정.

경량 작업은 다음을 기록한다.

```yaml
benchmark_applicability: N/A_NO_DESIGN_CHANGE
text_integrity: REQUIRED
readback: REQUIRED
```

## 4. 벤치마킹 최소 계약

### QUICK

- 직접 사례 2개 이상.
- 인접 사례 또는 현업·표준 근거 1개 이상.
- `ADOPT / ADAPT / REJECT` 판정.
- GRIMOIRE 권장안과 적용하지 않을 요소.

### STANDARD

- 사례 5~7개.
- 비교축·비용·실패 위험·제작 영향.
- 프로젝트 고유 계약과 검증 계획.

### DEEP

- 코어 재개방·시장·출시·대규모 구조 전환.
- 별도 Evidence Pack과 복수 적대 검토.

공식 문서·개발자 설명·표준·GDC·엔지니어링 문서를 우선한다. 커뮤니티 의견은 실제 불편을 보조 확인할 때만 사용한다.

## 5. 현업 비교 권장안 출력

모든 실질 작업 결과에는 다음 중 최소 하나가 있어야 한다.

- `현업 일반 패턴`.
- `공식 사례와의 차이`.
- `프로덕션 비용·QA·운영 관점`.
- `Mobile·접근성·성능 관점`.
- `추천안과 채택하지 않은 대안`.

유명 작품 이름만 나열하는 것은 벤치마킹 완료가 아니다. 관찰과 프로젝트 계약 사이의 논리가 있어야 한다.

## 6. 중립·적대적 검토

권장안을 만들기 전에 최소 두 대안을 비교하고, 권장안에도 반대 질문을 적용한다.

필수 공격 질문:

1. 사용자의 최신 의도를 과도하게 확대 해석했는가.
2. 기존 정본과 같은 이름의 다른 시스템을 중복 생성했는가.
3. 편의 기능이 핵심 판단을 대체하는가.
4. Mobile 정보량·입력·접근성 한계를 넘는가.
5. Prototype 값을 최종 밸런스처럼 고정했는가.
6. Save/Resume·중복 Event·상태 소유권이 누락됐는가.
7. 제작량·QA·콘텐츠 비용이 숨겨졌는가.
8. GitHub와 Sheet 중 한쪽만 갱신됐는가.
9. 깨진 문자·잘못된 인코딩·NFC 불일치가 있는가.
10. 미검증 상태를 완료로 표현했는가.

## 7. Text Integrity 표준

모든 저장소 텍스트는 다음을 만족해야 한다.

```yaml
encoding: UTF-8_NO_BOM
unicode_normalization: NFC
replacement_character_u_fffd: PROHIBITED
invalid_control_characters: PROHIBITED
known_mojibake_patterns: PROHIBITED
json_parse: REQUIRED_FOR_JSON
```

대상 확장자:

- `.md`, `.json`, `.yml`, `.yaml`, `.py`, `.gd`.
- `.tscn`, `.tres`, `.txt`, `.csv`.
- 프로젝트가 추가하는 기타 텍스트 형식.

## 8. 깨진 글자 검출

Hard failure:

- UTF-8 strict decode 실패.
- Unicode replacement character `U+FFFD` 존재.
- UTF-8 BOM 존재.
- 탭·개행·캐리지리턴 외 C0 제어문자.
- NFC 정규화 실패.
- mojibake 의심 선행 코드 포인트 `U+00C3`, `U+00C2`, `U+00E2`, `U+00F0`, `U+00EF` 기반 비정상 토큰.
- 한글 문맥에서 `U+00EC`, `U+00ED`, `U+00EB`, `U+00EA`로 시작하는 비정상 연속 토큰.

자동 검출이 애매한 경우 `TEXT_INTEGRITY_WARNING`으로 올리고 사람이 원문·Readback을 확인한다. 자동 수정으로 의미를 추정하지 않는다.

## 9. Readback Sentinel

GitHub와 Google Sheet에 쓰기 후 다음 문자열을 포함한 대상 범위를 다시 읽는다.

```text
소환수
자연충전
적대적 검토
벤치마킹
마도서
```

판정:

```yaml
utf8_decode: PASS
nfc: PASS
replacement_character: 0
mojibake_warning: 0
sentinel_readback: PASS
```

하나라도 실패하면 `SYNCED_TO_WORKING_BRANCH` 또는 `SYNCED_TO_MAIN`으로 승격하지 않는다.

## 10. GitHub Actions Gate

PR CI는 최소 다음을 수행한다.

1. 대상 텍스트 파일 UTF-8 strict decode.
2. NFC 검사.
3. replacement/BOM/control/mojibake 검사.
4. JSON parse.
5. 기존 Generator·Unit 검사.
6. Planning-only 보호 경로 검사.

CI PASS는 사람 문맥 검토를 대체하지 않는다. Sheet는 별도 Write 후 Readback이 필요하다.

## 11. 결과 보고 형식

```text
Decision ID
Benchmark ID / 규모
직접 사례·현업 근거
ADOPT / ADAPT / REJECT
권장안
적대적 위험
GitHub 경로·Commit
Sheet 범위
UTF-8·NFC·깨진 문자 판정
CI·Review·Readback
남은 NOT_RUN
```

## 12. 금지

- 출처 없이 업계 표준이라고 단정.
- 벤치마크 작품의 고유 설계·문구·아트를 복제.
- 한글이 깨진 상태로 커밋·Sheet 확정.
- 인코딩 오류를 추측으로 자동 복구.
- 적대적 검토 없이 사용자 의견에 자동 동의.
- CI 이전 상태를 PASS로 보고.

## 13. 보호 경계

```text
PRODUCT_IMPLEMENTATION = NOT_STARTED
CODEX_EXECUTION = BLOCKED
THIS_POLICY_AUTHORIZES_PRODUCT_RUNTIME = false
RUNTIME_VALIDATION = NOT_RUN
HUMAN_VALIDATION = NOT_RUN
```