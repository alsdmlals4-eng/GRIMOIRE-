# GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01 — 작업 전 벤치마킹·현업조사 Gate

## 1. 상태

```yaml
decision_id: GM-PREWORK-BENCHMARK-INDUSTRY-RESEARCH-01
sync_id: GR-SYNC-20260811-13-PREWORK-BENCHMARK-INDUSTRY-RESEARCH
status: USER_APPROVED_ACTIVE
approved_at: 2026-08-11T09:49+09:00
scope: PROJECT_PROCESS_ONLY
product_decision_mutation: NONE
persistent_godot_source_mutation: NONE
```

사용자 지시: **앞으로 모든 새 작업 단위는 작업을 시작하기 전에 벤치마킹과 현업조사를 먼저 수행한 뒤 진행한다.**

이 Decision은 제품/세계관/밸런스 정본을 바꾸지 않는다. 작업을 시작하기 전에 최신 외부 근거와 현재 프로젝트 상태를 대조하도록 강제하는 품질 Gate다.

## 2. Base 정합성

현재 Base main `315c66eea9614c284b9c11c4d522141065dfa4b0`의 Source Context 운용은 다음을 요구한다.

```text
current Base / PR overlap 확인
→ original source backtrace
→ source role / evidence tier
→ freshness / scope 확인
→ SOURCE_CONTEXT_PACKET
→ Existing Solution First
→ adversarial attack / critique validation
→ ADOPT | ADAPT | TEST | AVOID | IGNORE | REFERENCE_ONLY
→ exact-head validation
```

프로젝트 Gate는 이 Base 흐름을 복제하지 않고 **작업 시작 조건**으로 연결하는 thin adapter다.

## 3. 모든 새 작업 단위의 선행 순서

```text
1. Base current main / relevant owners 재조회
2. GRIMOIRE default branch / latest commit / open PR 재조회
3. Google Sheet current data 재조회
4. 이번 작업 질문과 비교 대상 정의
5. 벤치마킹 + 현업조사 수행
6. 출처 역할·권위·freshness·적용조건 기록
7. 프로젝트와 비교해 disposition 판정
8. 적대검토 + Existing Solution First
9. 그 뒤에만 설계·계획·구현·정본 편집 시작
10. exact-head 검증 + GitHub/Sheet readback
```

1~3은 기존 GRIMOIRE 시작 규칙이며, 4~8이 이번 Decision이 추가하는 선행 Gate다.

## 4. 무엇을 벤치마킹하는가

작업 성격에 맞는 비교군을 고른다.

- 게임 디자인/콘텐츠: 유사 장르의 공식 제품·매뉴얼·개발자 발표·GDC/플랫폼 개발자료.
- UX/UI/접근성: 플랫폼 공식 HIG, 접근성 가이드, 실제 인접 게임 패턴.
- 기술/엔진/API: 공식 문서·release notes·원 연구/표준을 우선.
- 제작/운영/마케팅: Steamworks·플랫폼 공식 문서와 방법·표본이 공개된 현업 자료.
- 서사/게임라이팅: 실제 상호작용형 서사 사례와 전문 게임라이팅 자료를 우선.
- 프로세스/CI: Base current canon, GitHub/플랫폼 공식 문서, 현재 저장소 회귀 패턴.

단순히 유명한 게임을 고르는 것이 아니라 **이번 결정에 실제로 영향을 줄 비교군**을 고른다.

## 5. Source 권위

기본 우선순위:

```text
공식/원출처·표준·플랫폼 문서
> 개발사/개발자 1차 자료·GDC 등 전문 발표
> 방법과 표본을 공개한 현업 자료
> 관찰/분석 자료
> 발견용 큐레이션
```

- 제3자 요약은 원출처를 대체하지 않는다.
- 최신성이 중요한 항목은 현재 날짜 기준으로 다시 확인한다.
- 오래됐어도 설계 원리의 정적 Reference로 유효하면 `STATIC_REFERENCE`라고 명시한다.
- 외부 자료가 현재 프로젝트에 직접 적용되지 않으면 적용조건과 한계를 기록한다.

## 6. 필수 판정

각 핵심 비교 결과에는 최소 하나의 disposition을 붙인다.

```yaml
disposition:
  - ADOPT          # 그대로 적용 가능한 원칙/제약
  - ADAPT          # 프로젝트 문맥에 맞게 변형
  - TEST           # 플레이테스트/실험 전에는 채택하지 않음
  - AVOID          # 프로젝트 목표와 충돌해 피함
  - IGNORE         # 현재 작업 의사결정에는 의미 없음
  - REFERENCE_ONLY # 비교·설명용, 정본 소유권 없음
```

숫자·성공사례를 보편 정답으로 승격하지 않는다.

## 7. Existing Solution First

외부 사례가 좋아 보여도 먼저 현재 GRIMOIRE에 이미 같은 책임을 소유한 시스템이 있는지 확인한다.

```text
ALREADY_COVERED / PARTIAL
→ 기존 owner 흡수 우선
→ 누락된 test / guardrail / source / condition만 보강
→ 새 시스템·새 화폐·새 메뉴·새 서비스는 마지막 선택
```

경쟁작의 기능을 추가하는 것 자체가 목표가 아니다. GRIMOIRE의 현재 약속을 더 잘 증명하는 데 필요한 최소 차이만 채택한다.

## 8. 복제 금지

벤치마킹은 패턴·제약·실패모드·검증방법을 배우기 위한 것이다.

- 경쟁작의 대사·서사 사건·캐릭터·레벨·UI 표현·아트 스타일·코드·에셋을 복제하지 않는다.
- “Persona처럼”, “Dishonored처럼” 같은 모호한 구현 지시를 남기지 않는다.
- 항상 `무엇을 ADAPT하고 무엇을 REJECT/AVOID하는지` GRIMOIRE 언어로 번역한다.

## 9. 작업 산출물의 Research Receipt

모든 **새 substantive work unit**은 작업 산출물 또는 연결된 benchmark 문서에 다음을 남긴다.

```yaml
prework_research:
  checked_at:
  work_question:
  current_base:
  current_project_main:
  sheet_readback:
  sources:
    - source:
      role:
      freshness:
      fact_or_practice:
      applicability:
      disposition:
  existing_solution_check:
  adversarial_notes:
  decision_delta:
```

같은 work unit 안의 CI 재실행·readback·오타 수정처럼 질문과 비교군이 바뀌지 않는 후속 동작은 **그 work unit의 Research Receipt를 재사용**할 수 있다. 범위·제품 결정·핵심 가정이 달라지면 새 work unit으로 간주해 다시 조사한다.

## 10. Stop Gate

다음 중 하나면 본 작업을 시작하지 않는다.

- 최신성이 필요한 핵심 사실을 과거 기억만으로 가정함.
- 유사 사례를 조사하지 않고 새로운 시스템/콘텐츠 방향을 확정함.
- 현업 수치/성공사례의 표본·조건을 무시하고 목표치로 고정함.
- 현재 Base/GRIMOIRE owner보다 경쟁작 패턴을 우선함.
- 비교군을 조사했지만 ADOPT/ADAPT/TEST/AVOID 판정이 없음.
- 외부 표현을 복제하려 함.
- 조사 결과와 현재 정본이 충돌하는데 보고하지 않음.

## 11. 이번 D 작업 적용 증거

`GM-FROSTBLOOM-INTERNAL-VERTICAL-SLICE-01`의 written-spec 승인 이후 writing-plans를 시작하기 전에 다음을 실제 수행했다.

- Witchbrook / Persona 5 Royal: 학교생활·자유시간 시장/구조 비교.
- Atelier Ryza: 제작 선택과 사용 결과 연결.
- Dishonored 2: 실제 systemic choice와 가짜 선택 배제.
- Steamworks: 장르/태그가 고객 설명과 추천에 미치는 역할.
- Microsoft/ID@Xbox: vertical slice를 작은 가설 검증·고유 핵심 표현으로 다루는 현업 관점.
- Base current Source Context rule: freshness, Existing Solution First, disposition, exact-head.

D benchmark receipt:
`docs/planning/FROSTBLOOM_INTERNAL_VERTICAL_SLICE_IMPLEMENTATION_BENCHMARK_2026-08-11.md`

즉 이 프로세스 Decision은 앞으로의 규칙을 만들면서, 이번 작업에서도 이미 요구 행동을 선행 실행한 상태다.

## 12. 증거 한계

이 Gate는 좋은 게임·좋은 설계를 자동 보장하지 않는다. 조사 품질과 프로젝트 적합성을 높이는 절차이며 최종 판단은 사용자 승인, 테스트, 실제 플레이 증거에 따른다.
