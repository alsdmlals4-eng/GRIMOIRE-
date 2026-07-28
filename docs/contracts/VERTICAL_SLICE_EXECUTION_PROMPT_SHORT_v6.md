---
document_role: LEGACY_COMPATIBILITY
active_authority: false
implementation_authority: NONE
replacement_execution_prompt: templates/prompts/VERTICAL_SLICE_INTEGRATED_EXECUTION_PROMPT_v8.md
status: LEGACY_COMPATIBILITY
---

> `VERTICAL_SLICE_EXECUTION_PROMPT_SHORT_v6`은 과거 비교·호환 기록이다. 새 작업 실행은 Base v8 통합 실행문과 Spell 프로젝트 정본을 사용한다.

# 버티컬 슬라이스 작업 축약 실행문 v6

첨부한 `VERTICAL_SLICE_MASTER_REFERENCE_v6.md`를 이번 작업의 최상위 참고 계약으로 사용해줘.

## 대상

- Base: https://github.com/alsdmlals4-eng/Base
- 프로젝트: <대상 프로젝트 GitHub URL>
- 프로젝트명: <프로젝트명>
- 플랫폼: PC / MOBILE
- 현재 제품 단계: <CONCEPT_APPROVAL / PROTOTYPE_AND_VERTICAL_SLICE / PRODUCTION_APPROVAL / RELEASE_CANDIDATE_APPROVAL>
- 실행 프로필: <PLANNING_ONLY_PROFILE / VERTICAL_SLICE_FULL_PROFILE / REVIEW_ONLY_PROFILE / PUBLICATION_PROFILE / HIGODOT_IMPLEMENTATION_PROFILE>
- 이번 요청: <이번에 달성할 구체적인 결과>
- 우선 사용 모듈: <필요 시 CONCEPT / VERTICAL_SLICE / PC_RELEASE_PREP / MOBILE_GOOGLE_PLAY / CROWDFUNDING / ASSET_AND_MASCOT / CODEX_HANDOFF / HIGODOT / PUBLICATION / REVIEW>

## 실행 규칙

1. 참고 파일을 응답에 복사하지 말고 현재 요청에 필요한 절과 조건부 모듈만 적용한다.
2. Base와 프로젝트의 START_HERE·AGENTS·OPERATING_MODEL·Documentation Map·Registry·현재 책임 원본·실제 파일을 순서대로 조사한다.
3. `managing-project-intake-and-work-contract`로 현재 단계·Work Mode·실행 계약·의존성 순서를 정한다.
4. **Grill Me와 적대적 검토만으로 작업을 완료하지 않는다.** 단계별 Skill Coverage Audit에 따라 콘셉트·코어·문서·버티컬 슬라이스·에셋·구현·검증·인계 Skill을 순차적으로 사용한다.
5. `최소 Skill`은 전체 Skill 수를 줄이는 뜻이 아니라 각 하위 작업에 중복되지 않는 최소 충분 Skill을 선택한다는 뜻이다. 장기 단계에서는 여러 Skill을 순차 실행한다.
6. 시작 보고에 `Skill Execution Plan`을 포함한다. 각 Skill의 정확한 ID·Mode·Trigger·사용 이유·예상 산출물·검증 증거를 적는다.
7. 실제로 사용한 Skill은 `Skill Execution Evidence`에 결과와 증거를 남긴다. Skill 파일을 읽은 것과 실제 절차 실행을 구분한다.
8. 저장소에서 확인 가능한 사실·기술 세부값·개별 밸런스 수치를 사용자에게 다시 묻지 않는다.
9. 기술 판단과 세부 수치는 `TECHNICAL_REVIEW_PROPOSAL` 및 `Balance Tuning Backlog`로 일괄 정리한다.
10. 프로젝트 코어·플레이어 경험·주요 UX·콘텐츠 의미·범위가 충돌하는 경우만 Grill Me 방식으로 한 번에 하나씩 선택지·장단점·권장안과 함께 질문한다.
11. Stage 2의 종료점은 프로토타입이 아니라 외부 플레이 가능한 버티컬 슬라이스 통합 데모다.
12. 이미지·UI·사운드·마스코트는 콘셉트 역할 정의→기존 승인 자산→보유 자산→에셋스토어·플러그인 및 라이선스 검토→적합한 것이 없을 때만 생성 순서로 처리한다.
13. 각 게임에는 세계관에 맞는 귀여운 마스코트 또는 상징 동반자 후보를 설계하되, UI·피드백·핵심 루프·스토어·후원 중 실제 역할을 부여한다.
14. 구현 전 설계 승인, Codex read-only Plan, TDD, systematic debugging, code review, verification-before-completion 순서를 적용한다. 실제 설치된 Superpowers Skill만 사용한다.
15. REVIEW는 영향 범위 지도→공격→비판 재검증→Finding 라우팅→기술안 일괄화→기획 충돌 한 문항→승인 최소 수정→정적·런타임·참조·접근성·성능·회귀 검증 순서로 진행한다.
16. 외부 AI·DeepSeek 결과는 격리된 검수 대기 입력으로 취급하고 실제 정본·파일·테스트와 대조한다.
17. 사용자 승인 범위 밖 수정, 기본 Branch 직접 수정, 사용자 승인 없는 PR 병합을 하지 않는다.
18. 실제 빌드·diff·정적·런타임·저장·참조·회귀·플레이테스트 증거 없이 완료를 주장하지 않는다.
19. 장기 작업 종료 전 `Requirement Coverage / Skill Coverage / Artifact Coverage` 세 감사를 수행한다.
20. 변경 결과는 프로젝트 전용 내용, Learning Log 후보, Base 승격 후보로 분리한다.

먼저 아래 항목을 압축 보고한 뒤, 차단되는 기획 결정이 없으면 작업을 계속 진행해줘.

- 현재 제품 단계·실행 프로필·Work Mode
- 기준 Branch·Commit과 책임 원본
- 현재 플레이어 약속·프로젝트 코어·뾰족한 재미·Core Loop
- 보호할 결정·자산·정상 동작
- 이번 목표와 완료 증거
- `Skill Execution Plan` — Skill ID / Mode / Trigger / 산출물 / 검증
- 확인된 충돌·P0·P1·BLOCKED_UNVERIFIED
- 바로 진행할 첫 결과 단위
