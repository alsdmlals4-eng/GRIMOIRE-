# GRIMOIRE 벤치마킹·현업 비교 선행 원칙

## 1. 문서 상태

```yaml
status: ACTIVE_PROJECT_WORK_PRINCIPLE
project: "GRIMOIRE: 세계를 다시 쓰는 법"
work_mode: PLAN
policy_ids:
  - GM-BENCHMARK-FIRST-01
  - GM-GRILL-WORK-QUALITY-GATE-01
effective_date: 2026-08-03
```

## 2. 기본 원칙

GRIMOIRE의 GrillMe 질문과 실질 작업은 내부 추론만으로 권장안을 확정하지 않는다.

```text
프로젝트 현재 정본
→ 결정 질문
→ 범위에 맞는 벤치마킹
→ 공식 사례·현업·표준 비교
→ ADOPT / ADAPT / REJECT
→ GRIMOIRE 권장안
→ 적대적 검토
→ Text Integrity·GitHub·Sheet Readback
```

다른 작품의 정답을 복제하는 것이 아니라, 비교 가능한 설계 원리·제작 비용·실패 위험을 추출한다.

## 3. 필수 발동 조건

다음 중 하나에 해당하면 벤치마킹을 수행한다.

- 모든 GrillMe 결정 후보.
- 플레이어가 반복해서 사용하는 시스템.
- 승리·실패·성장·자원·조합의 핵심 규칙.
- 수치·슬롯·상한·주기·중첩 방식의 의미 있는 변경.
- 에피소드·세션·일정·전투·제작 등 콘텐츠 구조.
- 주요 화면 전환·입력·오류 복구·정보 위계 등 UX.
- 플랫폼·성능·접근성·저장·데이터 구조 결정.
- 프로젝트 Gate·정본·작업 절차를 바꾸는 운영 정책.
- 사용자가 비교·추천·검증을 요구한 작업.

## 4. 경량 비발동

설계 의미가 바뀌지 않는 다음 작업은 외부 조사를 생략할 수 있다.

- 오탈자·SHA·날짜·링크 동기화.
- 승인 구조의 단순 데이터 입력.
- 의미를 바꾸지 않는 명백한 표기 수정.

다만 다음을 기록해야 한다.

```yaml
benchmark_applicability: N/A_NO_DESIGN_CHANGE
text_integrity: REQUIRED
readback: REQUIRED
```

비발동 판단이 애매하면 QUICK 비교 패스를 사용한다.

## 5. 조사 규모

### QUICK

- 대상: 국소 규칙·수치·UX·상한 변경.
- 직접 사례 2개 이상.
- 인접 사례 또는 현업·표준 근거 1개 이상.
- 한 페이지 비교표와 적용·배제 판정.

### STANDARD

- 대상: 새 시스템·핵심 규칙·콘텐츠 구조.
- 사례 5~7개.
- 결정 질문·비교축·비용·실패 위험·프로젝트 계약.

### DEEP

- 대상: 프로젝트 코어 재개방·시장·출시·대규모 구조 전환.
- 사용자 명시 요청 또는 기존 근거로 결론을 내릴 수 없는 경우.
- 별도 Evidence Pack과 복수 적대 검토.

기본값은 `QUICK` 또는 `STANDARD`다.

## 6. 출처 우선순위

1. 공식 게임·제품 문서.
2. 개발자 설명·패치 노트·기술 블로그.
3. 표준 문서·플랫폼 가이드·GDC 등 현업 자료.
4. 신뢰 가능한 전문 분석·리뷰.
5. 실제 불편을 확인하기 위한 커뮤니티 자료.

추론은 사실과 분리해 `PROJECT_INFERENCE`로 표시한다. 출처 없이 `업계 표준`이라고 단정하지 않는다.

## 7. 필수 비교표

| 항목 | 내용 |
|---|---|
| 결정 질문 | 이번 작업이 답해야 하는 한 문장 |
| 사례 | 작품·제품·도구·표준 |
| 관찰 | 실제 구조 또는 명시된 원칙 |
| 유효 이유 | 현재 문제를 어떻게 해결하는가 |
| 위험 | 피로·과밀·비용·QA·독창성 위험 |
| 판정 | `ADOPT / ADAPT / REJECT` |
| 프로젝트 계약 | GRIMOIRE에서 지킬 구체 규칙 |

## 8. 현업 비교 권장안

모든 실질 작업 결과에는 다음 중 최소 하나를 명시한다.

- 프로덕션 제작량과 유지보수 비용.
- QA·자동화·Save/Resume 위험.
- Mobile HUD·입력·접근성·성능 영향.
- 콘텐츠 확장 시 발생하는 운영 비용.
- 권장안과 채택하지 않은 대안의 차이.

유명 사례 이름만 나열하거나 장점만 수집하면 완료가 아니다.

## 9. 완료 조건

- 결정 질문과 비교축.
- 사례별 근거 출처.
- 직접 사례와 인접/현업/표준 사례.
- 적용·변형·배제 판정.
- GRIMOIRE 고유 코어와의 차이.
- 범위·UX·제작·QA 위험.
- 중립 권장안.
- 적대적 검토.
- Text Integrity·GitHub·Sheet Readback.
- 설계 문서와 Registry 라우팅.

## 10. 저장·추적성

- 벤치마킹: `docs/planning/benchmarks/`.
- 승인 Decision: `docs/planning/` 책임 원본.
- 활성 라우팅: `docs/DESIGN_DOCUMENT_REGISTRY.json`.
- 기계 상태: `docs/planning/GRILL_ME_BATCH_MERGE_STATE.json`.
- 사용자용 GDD: 연결 Google Sheet.
- 작업 품질 Gate: `docs/planning/GRILL_WORK_BENCHMARK_TEXT_INTEGRITY_01_APPROVAL_2026-08-03.md`.

## 11. Text Integrity 결합

벤치마킹·설계 문서도 다음 검증을 통과해야 한다.

- UTF-8 strict decode.
- UTF-8 BOM 없음.
- Unicode NFC.
- replacement character `U+FFFD` 없음.
- 허용되지 않은 제어문자 없음.
- 알려진 mojibake 패턴 없음.
- JSON parse.
- GitHub·Sheet sentinel Readback.

깨진 문자를 문맥 추측으로 자동 수정하지 않는다. 원문과 정상 Readback을 기준으로 교정한다.

## 12. 예외

긴급한 보안·데이터 손상·빌드 차단 버그는 우선 복구할 수 있다. 수정이 플레이 규칙·UX·데이터 계약을 바꾸면 복구 후 벤치마킹과 설계 검토를 수행한다.

## 13. 금지

- 사용자 의견에 자동 동의한 뒤 근거를 사후 조립.
- 비교 없이 권장안을 업계 관행으로 표현.
- 벤치마크 작품의 고유 명칭·서사·아트·UI 복제.
- 깨진 한글·잘못된 인코딩 상태로 정본 승격.
- 미실행 Runtime·사람 검증을 완료로 표현.
