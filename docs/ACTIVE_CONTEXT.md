# GRIMOIRE Active Context

## 2026-09-13 저장 안내 후속 교정

대화 장면의 이어하기 실패는 상태만 바꾸고 화면 Label을 갱신하지 않던 결함을 RED 재현 후 수정했다. 대화/활동 모두 기존 저장 알림 경로를 사용한다. 실패 시 현재 진행 보존과 표시를 테스트했고 storyscreen22/storyflow27/eventsave12 총61 assertions0 failures를 재실행했다. 저장 형식/규칙/기존 파일 변경 없음. 직전 전체1038 검사와 별도 후속 회귀 결과이며 전체 재실행1040으로 혼동하지 않는다. 최종 화면을 다시 실행해 이어하기와 diagnostics 확인. 실패 분기의 실제 기기 조작은 NOT_RUN; headless UI 검증이다.

## 2026-09-13 연속 루프2: 후속 시료 과제→축제→마무리

최신 구현은 `src/ui/story/story_screen.tscn`의 S00-S08 기능 연결이다. Blueprint24의 LAB_SAMPLE_02를 공통 규칙13절에 구체화하고 별도 사건으로 구현했다. 기존 세 사건 IDS/독립 화면 순서는 보존했다. 위험2/마력2, 즉시정지/막기/시료이동/시간누출/위험6교수개입을 처리한다. 교체 가능한 시료 처리 중단과 보존을 구분하고 이미 보존한 시료를 개입으로 지우지 않는다. S05명시 설명→S06시료→S07축제→S08실행기록, 자동저장/이어하기를 연결했다. 아래 S05까지라는 기록은 이전 검증 시점이다.

최종11 runners1038 assertions0 failures: lab17/storyflow27/storyscreen20/duelscreen23/duelsession459/exchange77/eventscreen21/eventsession60/eventsave12/eventcast70/shared252. 기능 부재/설명 부재/저장 알림/결과별 마무리 대사 RED를 확인 후 교정했다. 중간 수정에서 나온 script error는 최종 실행에서0. 실제 editor11900: S00입학→수업불씨해결→결투중단→온실도움→설명선택→시료 막기/이동/정지(위험2,마력1,보존)→축제 불씨/바람/잠금→S08 확인. final runtime32020 재실행/이어하기/diagnostics0/0. 캡처 `artifacts/local-validation/story-lab-preserved-20260913.png`, `story-final-record-20260913.png`.

상태는 기능 구현/기계 검증/자동 조작PC runtime까지. 시료 고위험 분기는headless검증, 최종모바일/플레이어 재미/접근성/성능/출시/전체장편게임 PASS가 아니다. 입학·복기·마무리는 기능 text UI이며 최종아트/프로필편집/대사로그/메인복귀/다음학기 미완료. defaultmain과 구저장, 사용자 fixture/project.godot, 다른PR은 보존했다. Base pin9.4.3/19routes CURRENT, 최신Base로 임의이동 없음.

다음 안전 작업: 새 이야기 화면의 메인/이어하기 진입 통합을 기존 메뉴 owner와 대조, 공통 문자 설명/룬 자산 상태군, 저장 실패·중단 복구 강화, 첫장 화면정보 밀도/모바일 점검. 기본 메뉴에서 활동 선택 모드로 바꾸지 않는다. 새 이야기 보상/관계 수치/장편내용을 완료로 주장하지 않는다.

## 2026-09-13 이야기 연결 S00-S05

`src/ui/story/story_screen.tscn`에 입학 안내/소개→수업→안내 결투→온실→복기를 연결했다. 기존 사건/결투 화면은 story_mode의 명시 signal로 재사용하며 독립 실행 경로는 유지한다. story_flow/story_save는 현재 활동과 이전 실제 결과를 새 전용 두 슬롯에 저장한다. 중단/도움도 다음으로 진행하되 승리/해결로 위장하지 않는다. 복기 접근 설명은 명시 선택·저장하며 행동 사실/보상과 분리한다. 아직 default main/최종 아트/프로필 편집/후속 S06-S08 연결은 미완료다.

8 runners687 assertions0 failures: story flow21, story screen14, duel screen23/session459/exchange77, event screen21/session60/save12. 최초 모듈/화면/선택 부재 RED, 저장 알림 덮임 RED 후 교정. 장면 교체 시 이전 child에 새 stage 알림을 보낸 script error는 actual child metadata로 교정하고 전체 재실행 오류0. 실제 editor11900에서 입학→수업 불씨 해결→결투 중단→온실 도움→복기, 최종runtime26212에서 이어하기/설명 선택을 확인했다. diagnostics0/0, capture artifacts/local-validation/story-bridge-review-20260913.png. Human/mobile/performance/full chapter은 NOT_RUN. 공식 ink 자료에서 narrative-state/UI 분리를 ADAPT, 외부 엔진은 추가하지 않았다.

추가 탐색에서 Human Blueprint24절에 LAB_SAMPLE_02의 구체적 표가 존재함을 확인했다. 따라서 계획 초안의 'S06 미명세'는 탐색 중 잠정 판단이며 최신 결론은 '문서 명세 존재, runtime 미구현'이다. 다음 루프는 이 표를 공통 규칙 owner와 대조해 시료 과제 구현 후 축제/장 마무리 연결이다.

## 2026-09-13 연속 개선: 결투 직전 실행 복기

일반 승인 없이 개선/구현을 계속하라는 최신 지시에 따라 Task5 계획→RED→구현→검증을 수행했다. shared_duel_screen.gd가 저장된 마지막 command/receipt로 별도120px scroll 복기를 표시한다. 피해/차단/반격/복구/집중 사용/상대 방패 흡수/비용과 무복구 경고를 표시하며 preview/저장/중단/재연습과 분리한다. 피해 수치는 남은 결계를 넘는 값도 포함한다고 명시, 새 계산이나 save schema 없음. rune candidate02 최종 확정과 runtime 적용은 이 기능 개선과 별개다.

신규 검사 포함 화면23 + session459 + exchange77 =559 assertions/0 failures. 복기 consumer 부재 RED1을 확인했다. GRIMOIRE editor11900에서 실제 선택·시전·저장→대기→이어하기로 복기 복원 확인; 마지막 문구 수정 뒤 runtime15960 재실행/이어하기/캡처, diagnostics errors0 warnings0. artifacts/local-validation/duel-review-20260913.png 는1280x720 실화면. 이번 native drag/mobile/Human/performance/fullgame은 NOT_RUN. 다른 사건 테스트는 이번 변경에서 재실행하지 않았다.

조사: Into the Breach 공식 페이지 직접 요청 timeout 후 검색의 공식 원문 발췌로 공격 예고 설명 재확인. ADAPT 예고와 결과를 분리해 판단을 돕기; 다른 게임 규칙/최적해 안내는 도입하지 않음. 로컬 학습: 기존 authoritative receipt를 표시하고 UI에서 전투를 재계산하지 않는다. Base pin9.4.3 validator CURRENT 유지. 기존 사용자 fixture/project.godot/import와 다른 PR/main은 변경 대상으로 삼지 않았다.

다음 안전 순서: 남은 결투 결과/이야기 진입 연결을 현재 스토리 owner와 대조해 계획 → 공통 글자 카드 설명을 사건/결투에서 일관되게 표시 → 룬 자산 상태군/모바일 가독성 → 승인 자산 통합. 아직 기본main은 구형이고 전체 스토리 연결/카드 최종아트/모바일/출시 준비는 완료되지 않았다.

## 최신 사용자 교정 — 마법 글자 중심 카드

최신: 사용자 '더 마법적이고 신비한 느낌, 마법문자/룬 참조'로 candidate01 재작업 요청. 계획 교정→박물관/도서관 자료 조사→이미지 모델 candidate02 제작. `output/imagegen/spell-glyphs-20260913/glyph-family-candidate-02.png` 및 production-record-02.json이 현행 검토 후보다. 원본 문자/주문 내용 복사 없이 분지 획/말단 고리/작은 보조 부호를 참고했다. BM 직접 페이지403으로 검색 발췌만, BL은 catalogue 설명만 확인했으며 고문서 이미지 직접 검수라고 주장하지 않는다. 금속 같은 재질, 불씨/모으기의 마름모 공통성, 작은 크기 가독성은 검토점. 후보01은 재작업 요청 상태로 교정하고 보존. 게임 코드/runtime/main 변경 없음.

제작 결과: `output/imagegen/spell-glyphs-20260913/glyph-family-candidate-01.png`는 왼쪽부터 불씨/바람/막기/모으기인 문자 견본 후보다. 첫 출력의 불씨·바람 유사성을 발견하고 불씨만 보정했다. 전체 프롬프트/보정/해시/한계는 동일 폴더 production-record.json. 후보 외형 승인·개별 알파·작은 손패 가독성·조합 화면/runtime은 미완료. 각진 불씨가 번개처럼 읽힐 가능성을 검토점으로 남겼다. 기존 불꽃 삽화는 삭제/이동/승격하지 않았다. 이번 산출물은 글자 시안과 정본 방향 교정이며 게임 코드 변경은 없다.

사용자는 '마법 주문같은 글자 형식', '글자를 조합해서 주문을 만든다'를 명확히 하고 제작 진행을 승인했다. Task4 계획을 먼저 교정했다. 아래 불씨 현상 삽화는 미채택 참고 후보이며 카드 방향으로 승계하지 않는다. 현재 네 글자의 뜻/조합 코드/카드 겹치기와 명시 시전은 유지한다. 새 글자 견본은 사용자 최종 시각 승인 전 후보, runtime 및 개별 투명 자산 준비와 분리한다. 직접 그리기/별형 회로/순서 민감 레시피를 추가하지 않는다.

## 2026-09-13 스펠 카드 삽화와 의미 연결

사용자는 개선 루프를 유사 게임 조사→기획 구체화/연결→구현으로 명확히 하고 스펠 카드 삽화와 글자 설명을 요청했다. 기존 결투 계획Task4에 제작 전 순서/공식 비교/consumer를 작성했다. 승인 애니메이션 스타일 참고로 `output/imagegen/spell-cards-20260913/ember-candidate-01.png` 한 장을 이미지 모델로 제작했다. 동일 폴더 production-record.json에 전체 프롬프트/해시/네 글자 뜻/검수 한계를 기록했다. 불씨의 작은 국소 열을 표현하며 기능 글씨/비용은 별도 UI다. 그림 속 그릇은 설명용 시각 소품이지 새 아이템 규칙이 아니다.

현재는 사용자 검토 후보이고 runtime 미적용. 나머지 바람/막기/모으기 삽화, 별도 카드 프레임/설명 UI, 작은 손패 크기 가독성은 남는다. 이번 턴은 새 카드 준비이며 기존963 assertions와 실행 증거를 새 작업 검증으로 재사용하지 않는다. 코드/규칙/기존 자산 삭제/정본 승격 없음. 대표 시안에서 작은 불씨 대비 불꽃 크기와 회화적 재질을 검토점으로 남겼다.

## 2026-09-13 결투 화면·저장 UI·직접 조작

계획Task3의 배치/입력/자산 소비처를 먼저 작성하고 `src/ui/shared_duel/shared_duel_screen.tscn`을 구현했다. 승인 연습실 배경을 원본 경로에서 사용, 기능 글자/수치는 별도 노드다. 캐릭터 알파·카드 일러스트는 미완료로 유지한다. `duel_save.gd`는 기존 두 슬롯 envelope와 checksum을 재사용하고 새 결투 snapshot 검증을 특수화한다. 전용 개발 폴더를 사용하며 기존 사건/구형 저장은 공유하지 않는다.

신규 화면/저장12 assertions, 관련 총963 assertions/0 failures. 그리모어 편집기11900/게임16444에서 실제 선택·시전·저장 후 변경·이어하기 복원, 대기로 패배·재연습을 확인했다. Computer Use의 정확한 게임 창에서 native drag로 모으기+불씨→응축 불씨 preview를 확인했으며 자동 시전/수치 소비 없음. 최종 diagnostics error0/warning0. 로컬 캡처 `artifacts/local-validation/shared-duel-drag-preview-20260913.png`, `shared-duel-loss-20260913.png`, `shared-duel-retry-20260913.png`. 밝은 배경 위 글자 대비를 개선했다.

현재 범위는 기능 연습 화면. 실제 화면 승리 경로, 모바일 touch/접근성/성능/Human/balance는 미검증이다. 기본 main은 구형 유지, 다음은 카드 일러스트/승인 초상 준비 및 결투 결과 상세 복기·이야기/메인 연결 계획이다. 저장은 개발 폴더이고 export user path 미완료. 사용자 변경/다른 PR/기존 저장 보존, 삭제 없음.

## 2026-09-13 새 결투 매치·손패·스냅샷 연결

승인된 계획Task2를 먼저 세부화한 뒤 `src/core/shared_spell/duel_session.gd`와 테스트를 구현했다. 학습용 네 글자 손패, 일반 seeded 손패, 단독/조합 시전, 보충/재순환, 정돈, 대기/중단, 중복 요청 replay와 충돌/stale 거절, 집중/억제 저장 상태를 연결했다. restore는 동일 규칙/엔진의 초기 상태부터 명령을 재현해 전체 snapshot과 비교한다. 반환값은 독립 복사본이며 preview도 같은 전이 함수를 사용한다.

신규459 assertions/0 failures: 실제 로컬 binary 파일 roundtrip,12 seeded 대기/정돈 및20 seeded 합법 시전 경로의 카드 보존/상태 재현, 승리 경로와 terminal 차단. 이것은 headless match 검증이며 실제 플레이 화면/Human/balance PASS가 아니다. 개발용 snapshot 저장만 확인했고 두 슬롯 crash-safe 사용자 저장 연결, 장기 로그 성능, 엔진 변경 migration은 남는다. 다음 계획Task3은 와이어프레임/승인 자산 consumer 검토 후 실제 결투 화면과 저장 UI를 연결한다. 구 main/구 저장/다른 PR/사용자 변경은 보존했다.

## 2026-09-13 계획 선행: 새 결투 한 교환 판정

사용자는 앞으로 구현/수정 계획을 먼저 작성하도록 지시했고, 첫 연습 결투 계획 진행을 승인했다. `docs/superpowers/plans/2026-09-13-shared-duel-implementation.md`를 코드 전에 작성했다. 첫 단위 `src/core/shared_spell/duel_spell_exchange.gd`는 공통 compose를 소비하여 10주문, 성질 조건, 집중/억제 만료, 복구 선적용, 반격/동시 피해를 독립 복사본으로 계산한다. 기존 FIRST_DUEL_1/저장/main은 변경하지 않았다.

신규77 assertions와 기존415 assertions, 총492/0 failures. 서비스 부재와 억제 재시전 중첩 오류의 RED→GREEN을 확인했다. 억제 중 재시전은 현재 제거량 최대3, 다음 교환 기간만 갱신한다. 아직 hand/transaction/save/UI consumer와 미연결이므로 실제 새 결투 한 판/runtime PASS가 아니다. 다음은 계획Task2를 세부화하여 물리 카드 보존·정돈·드로우·원자적 명령·버전별 저장을 연결한다. Task3의 화면은 와이어프레임/자산 확인이 먼저다. 이번 새 이미지/삭제/기존 사용자 변경 없음.

## 2026-09-12 연속 구현: 세 사건 플레이·저장·실제 조작 검증

최신 사용자 지시에 따라 Base/current authority를 다시 읽고 벤치마킹→구현→회귀→실제 조작→교정 루프를 수행했다. `event_definitions/event_session/event_save`와 `src/ui/event_session/event_session_screen.tscn`이 수업→온실→축제, 단독/조합 주문, 대상/목적지, 명시 실행, 위험 시계, 일반 행동, 도움/중단, 결과 확인, 새 저장/재개를 연결한다. 규칙·저장 책임은 공통 규칙13절, 실행 단위는 `docs/superpowers/plans/2026-09-12-event-playable-loop.md`가 소유한다.

최종 재실행: Godot 관련5 runners 415 assertions/0 failures(252+70+60+12+21), Python4 tests PASS, 프로젝트 operating contract CURRENT(pin9.4.3). 정확한 GRIMOIRE 편집기21468/실행50976에서 수업→온실→축제 해결을 확인했고 진단 error0/warning0이다. 실제 PC 마우스 드래그 조합과 저장 후 변경→불러오기 복원도 별도 관찰했다. 로컬 증거는 `artifacts/local-validation/event-drag-preview-20260912.png`, `event-greenhouse-solved-20260912.png`, `event-festival-solved-20260912.png`다. 이는 자동 조작 runtime 증거이며 독립 플레이어/모바일/출시 검증이 아니다.

독립 읽기 전용 검토의 결과 변화·만료 표시 누락과 잘못된 저장 consequences 값 통과를 실패 검사로 재현하고 수정했다. 긴 결과로 720px 화면 하단 버튼이 밀리는 문제도 회귀 검사 후 상세 영역 스크롤로 교정했다. 현재 화면은 기능 검증판이며 최종 카드 아트/원형 시계/캐릭터/전체 스토리/새 결투는 미적용이다. 저장은 프로젝트 내부 개발용 두 슬롯이며 구형 저장을 건드리지 않는다.

다음 안전 순서: 새 결투의 지속효과·적법 손패·교환/종료/저장 재현을 현행 명세와 연결 → 학교생활의 이야기·보상 연결 → 승인 아트/메인 통합 → 모바일/Human 검증. 현재 단위는 첫 세 사건 조작 검증이고 전체 게임 완료가 아니다. 구 main, 사용자 fixture, 자동 생성된 범위 밖 파일과 다른 Draft PR은 보존했다. Base 최신 공용2회 검토와 프로젝트5회 계약 드리프트는 pin 유지로 처리했다. 아래 기록의 '사건/저장/UI 미연결'은 이전 관찰이며 본 항목으로 갱신된다. PDF는9/11 검토본 그대로다.

## 2026-09-12 재개: 사건 주문 효과와 원자적 시전

사용자 `작업재개`로 직전 후속 범위를 계속했다. `src/core/shared_spell/event_spell_cast.gd`가 등록 대상 재평가, 10종 효과, 마력/행동/개정번호의 일괄 변경, 동일 요청 재전송/충돌/오래된 상태 거절을 처리한다. 구형 재고 기반 시전 서비스는 보존하고 기존 `AtomicResultLedger`를 재사용했다. 데이터 계약·효과·만료·증거 상한은 공통 규칙11절이 소유한다.

Godot 신규70 assertions/0 failures 및 기존252 assertions/0 failures. 최초 서비스 부재, 포화 가열의 잘못된 변화 표시를 각각 실패 검사로 확인하고 교정했다. 현재 스냅샷 내부 원자성까지이며 실제 저장 파일, 사건 목표/위험 시계, 발견 정보 필터, 새 카드 화면은 아직 미연결이다. 현재 Godot 메인 화면이 새 카드 게임으로 바뀐 것은 아니다. 다음은 이 서비스 위에 수업/온실의 행동 시간·목표/위험 해소를 연결하고, 그 다음 사용자 입력 화면을 통합하는 순서다.

작업 시작 branch `c8135ce3`, main `d384c454`; Base remote `d830c0f6`와 pin9.4.3 계약 검사 CURRENT. 다른 Draft PR/사용자 fixture/자동 생성 파일은 보존한다. 이 아래 기록은 이전 완료 단위의 관찰이며 최신 구현 상태는 위 항목을 따른다. 9/11 PDF는 당시 검토본으로 유지한다.

## 2026-09-12 편집기 확인 후 장면 대상 평가 확장

사용자 `좋아 계속 진행해`에 따라 다음 승인 단위인 장면 대상 평가를 구현했다. `spell_semantics.assess_scene`은 등록 객체의 목적지·경로·용량·국소 관계·위험을 확인한다. 규격/회귀/한계는 공통 규칙11절이 소유한다. Godot252 assertions/0 failures, Python4 tests PASS. 실제 효과/명시 시전/시간/저장/새 카드 UI는 아직 미연결이며 전체 완료가 아니다.

직전 편집기 확인에서는 기존 Product Root의 스크롤, 사건 설명 열기/복귀, 후보 없음/다시 그리기 안내를 실제 클릭 확인했다. 관찰 패널 겹침과 하단 핵심 버튼 배치를 확인했고, 새 카드 조작은 존재하지 않는다. 캡처는 `artifacts/local-validation/grimoire-editor-verified-20260912.png`(로컬)다. 새 API의 게임 화면 검증과 기존 UI 입력 확인을 혼동하지 않는다.

현재 main `d384c454` / 작업 시작 branch `6c602bdf`, 열린 Draft253/249/187/166 read-only 재확인. Base remote `d830c0f6`와 pin9.4.3 계약 검사 CURRENT. 사용자 fixture 및 Godot 자동 import/uid 파일은 보존했다. 다음은 효과 해소·명시 시전 거래를 구현한 뒤 실제 장면 데이터/카드 화면에 연결하는 작업이다. PDF는9/11 검토 발행본이며 최신 구현 증거는 이 문서/공통 규칙을 따른다.

## 2026-09-12 공통 주문 구성·대상 평가 구현

`src/core/shared_spell/spell_semantics.gd`의 compose/assess 구현. 10주문 공유 의미, 순서 독립, 미학습/중복/대상 부적합 무소비 거절, 무변화 비용 quote, 위험 경고를 처리한다. 실제 효과·시간·마력 차감·발견 정보 필터·저장은 아직 연결하지 않았다. 신규112+구 결투 회귀38=150 Godot headless assertions PASS, Python 진단4 methods PASS. 실행 명령/데이터 키/책임 경계는 공통 규칙11절이 소유한다.

다음 구현: 장면 대상 데이터가 실제 목적지/경로/수용량을 공급하는 adapter와 효과 해소·명시 시전 거래. 이후 결투 지속효과/사건 시간 처리·스토리·UI 연결. 아래 첫 제품 단위 중 구성/대상 평가만 완료이며 전체10주문 시전 완료가 아니다. 다른 프로젝트 Hera 편집기는 read-only 확인 후 그대로 두었고 Godot 화면/입력 검증은 NOT_RUN이다. 새 임시 파일/이미지 생성이나 삭제 없음.

## 2026-09-12 구현 재개: 남은 업무와 첫 완료 단위

사용자 `프로젝트에서 남은 구현 업무 확인하고 진행해`에 따라 현재 main/열린 PR/새 본책/실제 duel_rules를 fresh-read했다. main은 구형 Star POC, 현재 branch의 duel_rules도 새 의미/지속 효과와 다르다. Draft253/249/187/166은 read-only 유지, 임의 흡수 없음. 이미지 승인은 그대로 보존한다.

기존 독립 수치 진단 계획 실행 완료: 산술9사례와 물리 초기손패70개, unittest4 methods PASS. 테스트 선행 RED→GREEN 두 단계 확인. 실제 게임 화면 변경이나 Godot runtime 검증은 이번 단위에 포함하지 않았다. 상세 결과/한계는 공통 규칙17절이 소유한다.

남은 구현 순서는 본책34절을 따른다:

1. 공통 의미·10주문: 단독/두 장 조합, 대상 적합성, 무변화 결과 구분. 다음 제품 구현 단위.
2. 새 결투 엔진: 적법 손패·정돈·드로우·소비·만료·반사·동시 피해·종료·저장 재현. 현행 구 효과 PASS와 구분.
3. 사건 엔진: 효과→행동 시간→목표/위험, 수업·온실·축제 및 도움/중단.
4. 이야기와 저장: 새게임부터 첫 장 종료, 패배/도움 뒤 진행, 중복 보상 방지.
5. 공통 화면·승인 자산: 메인 메뉴, 손패 겹치기/단독/취소/명시 시전, 초상 여백·알파·표정·상태 연결.
6. 연출·접근성·최종 통합: skip/중단 복귀, 큰 글자, 실제 Godot 입력/화면/기기/Human 검수.

첫 구현 재개 범위는 기존 진단 계획을 닫는 데 한정했으며, 제품 실행본/전체 기획 구현 완료를 주장하지 않는다. 기존 사용자 fixture는 보존. 새 임시 파일/이미지 생성 없음. 문서·수치 검증과 제품 runtime을 분리한다.

## 2026-09-12 현재 승인과 정리 방식

PEER `peer-personality-01.png`와 TUTOR `tutor-personality-01.png` 외형·동작·그림체 사용자 승인 완료. runtime·알파·여백·표정군은 미완료. 아래 이전 승인 대기 기록은 역사 상태다.

앞으로 삭제 가능한 작업 파일은 의존성·승인 자산·복구 가능성을 확인한 뒤 `.cleanup-review/<date>/`로 이동하고 사용자에게 폴더 링크를 준다. 자동 물리 삭제하지 않는다. 이번111개/34,067,240 bytes의 원경로/해시/이유는 `docs/validation/CLEANUP_REVIEW_20260912.json` 참조. Git/Godot 제외 폴더이며 원문 보존 기록·승인 이미지·PDF 원본과 생성 소스·사용자 dirty fixture·미병합 worktree는 보존한다.

## 후속 캐릭터 그림체 재검토

최신 사용자: 직전 1번 이미지의 그림체를 유지하고 구도·동작·소품으로 다른 인물의 개성을 살린다. 2번 동료 보정본과 3번 교수는 미채택/수정 요청. `peer-anime-01-style-anchor.png`를 새 supporting cast 스타일 기준으로 회수했고, 표본병 관찰 PEER/기록과 펜으로 설명하는 TUTOR 후보를 제작한다. 주인공 승인 유지, 새 인물 후보/소품 기능/runtime 미승인. 상세 최신 상태는 학생 외형 owner 및 `supporting-cast-personality-input.json` 참조.

최신 사용자 확정: `student-anime-reference-01.png`는 주인공 외형·그림체 승인본이다. 이전 아래 승인 대기는 해소됐다. 다른 인물 우선 요청에 따라 첫 장 PEER/TUTOR 두 기본 상반신 후보를 같은 애니메이션풍으로 제작한다. 새 인물은 검토 전, 주인공 여백/알파/표정군·모든 새 초상 runtime은 미완료다. 최신 결과는 학생 외형 owner와 `output/imagegen/character-style-comparison/supporting-cast-production-input.json`을 따른다.

최신 제공 참고 4장에 따라 정교한 애니메이션풍 학생 후보 `student-anime-reference-01.png`를 제작했다. 2번의 비율·채색과 4번의 선화·표정을 주 참고로 사용했다. 직전 `student-redesign-01.png`는 사용자 거부. 현재 후보는 불투명 배경 스타일 검토본이며 여백 교정·알파·표정군·runtime은 미완료다. 최종 사용자 승인 전이며 [학생 외형 owner](planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md)가 최신 이미지/해시/한계를 소유한다.

사용자는 이번 프로젝트에서 Aseprite/도트 방향을 사용하지 않는다. 이전 동화책풍·비교/블루프린트 캐릭터는 최종 채택하지 않는다. 카드 세로형 일러스트/손패 겹치기 조합/단독 시전 방향은 유지. 기존58쪽 PDF는 발행 당시 검토본이고 새 캐릭터의 최종 승인을 뜻하지 않는다.

## 2026-09-11 사람용 블루프린트 제작

최신 사용자 위임으로 [사람용 본책](superpowers/specs/2026-09-11-human-blueprint.md)과 `output/pdf/GRIMOIRE_HUMAN_BLUEPRINT_20260911.pdf` 58쪽을 발행했다. 구조 참고 PDF92쪽의 아틀라스→경험→시스템→데이터→구현지도만 차용한다. 새 인게임 레이어 후보/상세 SWOT/첫 학교생활 장을 포함, 기존 공통 주문 규칙·10작품 비교는 부록으로 합성 발행한다. 최종 사용자 검토 전이며 게임 구현은 보류. 58쪽 렌더 검토, 13개 소비 자산 해시, 16개 atlas region 검사와 한계는 [발행 검증](validation/HUMAN_BLUEPRINT_20260911.md)을 확인한다. 생성/알파/아틀라스 검사는 runtime·Human PASS가 아니다. 아래9/10의 이미지 보류는 이 새 제작 범위에서 해제됐다.

## 2026-09-10 재기획 진입

공통 규칙 17절의 제한 산술 진단 9사례를 실행했다. 모으기→불씨는 방패3→0에서 불씨2회보다 피해1 우세, 방패0→0에서는 피해2 열세다(손패/생존/순환 제외). 열 장막은 열5부터 막기와 차이가 나며 차회 억제는 차회 방패0에서 이득0이다. 수치 잠금은 유지 보류. [진단 구현 계획](superpowers/plans/2026-09-10-spell-balance-diagnostic.md)에 재현 테스트와 손패 포함 비교 범위를 정했다. 제품 코드·이미지·Godot runtime 변경 없음. 다음 실행 단위는 계획의 독립 진단 검사이며 전체 매치 구현이 아니다.

공통 규칙 v0.4 16절에 재미·차별화 검토를 통합했다. 공식4자료 재조회 결과 '조합 주문을 전투/환경에 사용' 자체는 독창성 근거가 아니며, 학교생활에서의 응용/기록/인물 반응을 차별화 가설로 둔다. 현재 결투 전문 방어·차회 방패 억제는 기존 패턴에서 가치가 약해 BALANCE_REWORK_REQUIRED. 온실은 학습 예시이지 복수 선택 재미 증거가 아니다. 다음은 기획 축 추가보다 해당 반례를 다룰 검산/시뮬레이션과 구현 계획. 이미지/코드/Human 검증은 미실행.

공통 규칙 v0.3 15절에 조사 기반 세부 기획을 통합했다. 초기 손패70 조합 중 직접 공격 글자 없는 경우1을 확인(패배 확률 아님), 정돈 행동·학습용 초기 손패·보상/성장·공통 입력 상태·단계 힌트를 권장 기준으로 정의했다. 기존10작품 비교와 공식4자료 재조회. 이미지/코드/전체 결투 시뮬레이션은 미실행. 다음은 이 명세 기반 구현 계획과 시뮬레이션/검증 범위 정리다.

공통 규칙 v0.2의 11~14절에 10종 대상 반응, 결투 성질별 시험 효과/해소 순서, 수업·온실·축제의 목표·실패·마력고갈 경로를 추가했다. 문서 명세/수치 검산까지이며 새 실행 데이터·코드·균형 시뮬레이션은 NOT_RUN. 다음은 이 명세 검토 후 입력 와이어프레임·상태 흐름과 구현 계획이다. 이미지 보류 유지.

최신 사용자 확정: 결투 외 실습·온실·축제에서도 같은 글자를 조합해 주문을 쓴다. 사건에서는 무작위 손패 없이 배운 글자를 선택한다. `세부규칙은 네가 권장안대로 잡아줘`에 따라 [공통 주문·사건·결투 규칙](superpowers/specs/2026-09-10-shared-spell-rules-design.md)을 설계 기준으로 작성했다. 상태 SPECIFIED_RECOMMENDED_BASELINE, 새 구현/Human NOT_RUN. 이미지·알파 분리·모션 제작은 보류한다. 아래 아트 우선 순서와 기존 공격/방어 수치를 공통 규칙으로 해석하지 않는다. 다음 작업은 주문 반응표·결투 수치 정합화와 사건 명세이며, 기존 코드/저장/이미지는 보존한다.

최신 사용자 지시로 이전 승인 캐릭터 시안을 재확인했다. 첫 학생 기준은 역사 manifest의 **Y1-IMG-WALK-PLAYER-008 USER_APPROVED_VISUAL_MASTER**이며, 현재 참조 파일은 `assets/reference/visual/GRIMOIRE_student_008_approved_appearance_reference.png`다. 사용자 제공 전신 그림은 003과 해시가 같으며 학생 비율 참고, 007/009는 거부·수정 대상으로 유지. 직전 신규 얼굴 후보는 대체 기준에서 제외한다. [학생 owner의 최신 교정 절](planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md)을 먼저 읽는다. 새 008 기반 검토본은 불투명/사용자 검토 전이고 runtime·모션 미완료다. 아래 '얼굴 사용자 확인 전'은 직전 후보에 대한 역사 상태다.

분리 배경 `output/imagegen/card-duel/duel-background-candidate-01.png`는 사용자 `확정할게 진행해`로 USER_APPROVED다. 1672×941, 원본 해시 유지. [화면 후보 기록](planning/visual/CARD_DUEL_SURFACE_CANDIDATE_01_2026-09-10.md)이 승인 owner다. [첫 학생 기본 포즈 후보](planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md)를 생성했으나 생성본/배경제거 보정본 모두 RGB로 실제 알파가 없어 TECHNICAL_REVISION_REQUIRED다. 얼굴/의상/포즈도 사용자 확인 전이며 runtime에는 넣지 않았다. 새 화면·모션·카드 자산 연결은 미완료다.

후속 `권장안대로 계속 진행해`로 학생 비율·따뜻한 연습실·남색/금색 방향을 채택하며 중앙 별 장식은 제외한다. [도메인 구현 계획](superpowers/plans/2026-09-10-card-duel-domain-implementation.md)의 규칙/동시 판정/매치·저장 재개가 작업 브랜치에 구현됐다. Godot headless 54 suites / 2153 assertions / 0 failures, stderr empty. [검증 기록](validation/CARD_DUEL_DOMAIN_2026-09-10.md)을 읽는다. 시험 수치는 조정 가능하며 PDF는 발행 당시 DESIGN_REVIEW 상태를 보존한다. 다음은 분리 아트·카드 선택/명시 시전 UI·스토리 handoff 패키지다. 새 UI/runtime 화면·Human·Device는 NOT_RUN, main 병합도 미완료다.

제한 조합 A 및 대표 결투 상세 규칙은 후속 사용자 승인으로 구현 기준이 됐다. [대표 결투 블루프린트](superpowers/specs/2026-09-10-card-duel-blueprint.md)와 `output/pdf/GRIMOIRE_CARD_DUEL_BLUEPRINT_2026-09-10.pdf`를 검토한다. PDF의 DESIGN_REVIEW는 발행 당시 상태다. [첫 화면 후보](planning/visual/CARD_DUEL_SURFACE_CANDIDATE_01_2026-09-10.md)는 분리 제작 참고 자료이며 새 런타임 자산이 아니다.

현재 조사 산출물은 [카드 결투 재기획 검토](planning/CARD_DUEL_REPLANNING_RESEARCH_2026-09-10.md)다. 카드 조합 중심·마법사 종류 카드 제외는 최신 사용자 방향이며, 상세 규칙 승인과 도메인 검증은 위 최신 상태를 따른다. 새 카드 화면 Runtime/Human 검증은 NOT_RUN이다.

최신 사용자 방향·Aseprite 임시 경로 승인·확인된 main/PR 차이·후속 제작 순서는 [재기획 접수 기록](planning/REPLANNING_INTAKE_2026-09-10.md)이 소유한다. 아래 기존 기획 완료와 시각 잠금은 과거 작업의 상태이며 새 재기획의 완료 상태가 아니다.

```yaml
project: "GRIMOIRE: 세계를 다시 쓰는 법"
repository: alsdmlals4-eng/GRIMOIRE-
active_contract: PROJECT_TOTAL_PLANNING_IMPLEMENTATION_AND_DELIVERY_INSTRUCTION_v4.8
contract_revision: 2026-08-26-r5.4-superset-final
contract_binding_decision: GM-CONTRACT-V4-8-BINDING-01
contract_binding_sync: GR-SYNC-20260826-36-V4-8-R5-4-VISUAL-COVERAGE
contract_binding_path: docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
current_governance_overlay: GM-REPOSITORY-ONLY-HUMAN-CANON-20260828-01
current_governance_overlay_owner: docs/planning/REPOSITORY_ONLY_HUMAN_CANON_NOTION_RETIREMENT_2026-08-28.md
historical_contract_binding: GM-CONTRACT-V4-5-BINDING-01
project_main_authority: LIVE_GITHUB_DEFAULT_BRANCH_READBACK
current_state_sync_predecessor: GR-SYNC-20260824-35-V4-8-AUTHORITY-SYNC
authority_sync_pr_predecessor: 158
current_authority_sync: GR-SYNC-20260826-37-SPELL-FLOW-PLAYER-FACING
spell_workflow_predecessor_sync: GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
task8_continuation_sync: GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
task8_current_reverify: docs/planning/TASK8_REMOTE_LOCAL_REVERIFY_2026-08-21.md
task8_preservation_observation: docs/planning/TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVATION_2026-08-24.md
task8_current_reconciliation_receipt: docs/planning/TASK8_CURRENT_MAIN_RECONCILIATION_2026-08-27.md
base_snapshot_policy: ALWAYS_REFETCH_CURRENT_COMPLETED_MAIN
adapter_policy: THIN_ADAPTER_DO_NOT_DUPLICATE_BASE_CANON
base_project_pin: v9.4.3
planning: COMPLETE_FROSTBLOOM_FIRST_SESSION
implementation: PARTIAL_FOUNDATION__W6_MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS
current_user_work_scope: FROSTBLOOM_W6_POSTMERGE_EVIDENCE_AND_HUMAN_VALIDATION
product_implementation_authorized_by_current_user_work_scope: true
visual_asset_coverage: docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
visual_asset_coverage_status: CURRENT_PREFLIGHT_COMPLETE
visual_generation_state: FROSTBLOOM_W6_PLANNING_REFERENCE_LOCKED__L3_IMPLEMENTED__NO_RUNTIME_ASSET_BATCH
visual_candidate_generation_policy: USER_PREAUTHORIZED_GENERATE_CANDIDATE__FINAL_LOCK_ONLY
visual_tone_overlay: GM-VISUAL-TONE-20260828-01
visual_tone_owner: docs/planning/visual/GRIMOIRE_WARM_ACADEMY_TONE_LOCK_2026-08-28.md
frostbloom_w6_preservation_priority_decision: GM-FROSTBLOOM-W6-PRESERVATION-PRIORITY-01
frostbloom_w6_preservation_priority_status: USER_APPROVED_ACTIVE_PLANNING_ONLY
frostbloom_w6_preservation_priority_issue: 221
frostbloom_w6_preservation_priority_owner: docs/planning/FROSTBLOOM_W6_PRESERVATION_PRIORITY_01_APPROVAL_2026-08-28.md
frostbloom_w6_visual_brief: docs/planning/visual/FROSTBLOOM_W6_PRESERVATION_PRIORITY_VISUAL_BRIEF_2026-08-28.md
frostbloom_w6_visual_brief_state: SUPERSEDED_BY_USER_APPROVED_WARM_ACADEMY_TONE_LOCK
frostbloom_w6_visual_candidate_issue: 223
frostbloom_w6_visual_candidate_owner: docs/planning/visual/FROSTBLOOM_W6_PRESERVATION_PRIORITY_VISUAL_BRIEF_2026-08-28.md
frostbloom_w6_key_decision_visual_issue: 231
frostbloom_w6_key_decision_visual_owner: docs/planning/visual/FROSTBLOOM_W6_WARM_ACADEMY_CORE_SCENE_BOARD_BRIEF_2026-08-28.md
frostbloom_w6_key_decision_visual_state: USER_APPROVED_PLANNING_REFERENCE_ONLY
frostbloom_w6_key_decision_visual_age_read: YOUNG_ADULT_ACADEMY_RESEARCHER__USER_DIRECTED_REFINEMENT
w6_bundled_contract_preflight: docs/planning/audits/2026-08-28-frostbloom-w6-bundled-contract-preflight.md
w6_decision_loop_feature_spec: docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md
w6_decision_loop_feature_spec_issue: 236
w6_decision_loop_feature_spec_status: USER_APPROVED_L2__L3_MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS
w6_decision_loop_traceability_packet: docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md
w6_decision_loop_implementation_plan: docs/superpowers/plans/2026-08-28-frostbloom-w6-decision-loop-implementation.md
w6_decision_loop_l3_issue: 242
w6_decision_loop_implementation_authority: USER_APPROVED_2026-08-29__MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS
w6_decision_loop_implementation_receipt: docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md
w6_decision_loop_pr: 245
w6_decision_loop_exact_head: b0f34b538680b5046705f36196eae71ed1b9b0a8
w6_decision_loop_merge_commit: 713bfbfc4c16b9ea469f2aa2c313a72bc50e1b67
post_visual_lock_next_gate: W6_HUMAN_PLAYER_DEVICE_PERFORMANCE_ACCESSIBILITY_EXPORT_FULL_SLICE
adversarial_research_feasibility_gate: docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md
adversarial_research_feasibility_gate_status: USER_APPROVED_ACTIVE__REQUIRED_ON_MATERIAL_WORK
visual_direction_decision: GM-VISUAL-DIRECTION-20260825-01
representative_screen_decision: GM-REPRESENTATIVE-SCREENS-20260825-01
art_style_lock: ART-STYLE-01
workspace_human_canon: REPOSITORY_HUMAN_FACING_CANON
workspace_repository_canon: REPOSITORY_STRUCTURED_AND_RUNTIME_CANON
notion_policy: RETIRED_HISTORICAL_DISCOVERY_ONLY__NO_ROUTINE_READ_OR_WRITE
notion_retirement_owner: docs/planning/REPOSITORY_ONLY_HUMAN_CANON_NOTION_RETIREMENT_2026-08-28.md
notion_migration_audit: docs/planning/NOTION_TO_REPOSITORY_MIGRATION_AUDIT_2026-08-28.md
notion_migration_state: MERGED_MAIN_READ_BACK__GR_NOTION_MIGRATION_20260828_01
google_sheets: MIGRATION_ONLY_UNTIL_REMOVAL
github_actions_decision: GM-PUBLIC-REPO-FREE-GITHUB-ACTIONS-01
repo_wide_actions_full_sha: PASS
product_decision: GM-SPELL-WORKFLOW-UI-V2-01
product_decision_overlay: docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
product_decision_revision: 2026-08-26-PLAYER-FACING-SIMPLIFICATION
player_facing_spell_flow: GLYPH_TO_SPELL_TO_TARGET_TO_CAST
player_facing_ux_groups: SPELL_BUILD_AND_SPELL_CAST
latest_product_main_for_task7_lineage: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
spell_workflow_predecessor_status: TASK7_MERGED_MAIN_VERIFIED
next_product_task: TASK9_USER_VERTICAL_SLICE_VALIDATION
next_product_gate: TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING
task8_recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
task8_recovery_subgate: TASK8_CURRENT_MAIN_LOCAL_VALIDATION_PASS
task8_recovery_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_local_delta_existence: OBSERVED_PRESENT
task8_candidate_preservation: OBSERVED_PASS
task8_primary_recovery_branch: feat/task8-spell-use-screen-v2
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_branch: task8/spell-use-screen
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: 68211069eb3b778fb43e68f3fbd049c8a0ac2733
task8_remote_product_branch: codex/task8-spell-use-reconcile-v320-20260827
task8_remote_product_pr: 190
task9_product_commit: db038a4fd964ca037bfe97f6aee5d0cc7d0daf93
task9_product_pr: 192
task9_status: MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY
task10_ui_hierarchy_issue: 196
task10_ui_hierarchy_pr: 197
task10_ui_hierarchy_merge_commit: 9eca31c52f06ce59afeacea9959075987ffb16ab
task10_ui_hierarchy_status: MERGED_MAIN_RUNTIME_UI_HIERARCHY_REPAIRED
pre_canon_audit_main_readback: 6377cbcf31958fc2b3215d7a9603dfa5f0199c04
task11_visual_surface_pr: 205
task11_visual_surface_status: MERGED_MAIN_BACKGROUND_AND_ACADEMY_THEME_BOUND
task12_direct_glyph_input_pr: 208
task12_direct_glyph_input_status: MERGED_MAIN_CLARIFICATION
task13_result_receipt_pr: 210
task13_result_receipt_status: MERGED_MAIN_RECEIPT_PAYLOAD_RENDERED
greenhouse_spirit_idle_seed_pr: 217
greenhouse_spirit_idle_seed_status: PROJECT_ASSET_APPROVED_IMPLEMENTATION_PENDING
canon_fun_visual_audit_pr: 219
canon_fun_visual_audit_merge_commit: 6ab3dd11a9bff9e5f3c3c9aebd87f63e613c5444
open_pr_state_authority: LIVE_GITHUB_READBACK_REQUIRED
component_sheet_pr151: MERGED_MAIN_VERIFIED
preserved_runtime_decision: GM-STAR-CIRCUIT-MASTERY-BALANCE-01
circuit_topology: FIVE_POINT_STAR
higodot_release: v3.2.0
higodot_tracked_vendor_release: v3.2.0
higodot_tracked_vendor_subtree: 66a9df59a92f0029efcd35c22fea355c93e8fe49
higodot_tracked_vendor_evidence: docs/validation/HIGODOT_V3_2_0_VENDOR_INTEGRITY.json
higodot_historical_live_alignment: LIVE_V3_1_4_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_current_reconciliation_readback: LIVE_V3_2_0_EXACT_PROJECT_SESSION_READY_OBSERVED
higodot_expected_actual_fields: NOT_SURFACED_DO_NOT_CLAIM
gut_formal_adoption: GUT_FORMALLY_ADOPTED
hera_status: HERA_V1_0_0_EXACT_PAIR_LIVE_CANARY_PASS
hera_authority: LIVE_QA_AND_OBSERVABILITY_ONLY
windows_android_shared_core: WINDOWS_ANDROID_SHARED_CORE_STRUCTURAL_PASS
three_screen_runtime: TASK9_PRODUCT_ROOT_AUTOMATED_VERTICAL_SLICE_READY
three_screen_runtime_historical: THREE_SCREEN_RUNTIME_AWAITING_TASKS_2_9
local_execution_state_authority: FRESH_LOCAL_EXECUTOR_READBACK_REQUIRED
authority_sync_local_observation: BLOCKED_NO_LOCAL_ACCESS
authority_sync_godot_observation: BLOCKED_NO_LOCAL_ACCESS
human_validation: NOT_RUN
device_validation: NOT_RUN
performance_validation: NOT_RUN
full_vertical_slice: FULL_VERTICAL_SLICE_NOT_RUN
windows_export: NOT_RUN
android_export: NOT_RUN
android_device: NOT_RUN
```

`authority_sync_local_observation` / `authority_sync_godot_observation`은 이전 authority sync 당시의 역사 관찰값이다. 현재 Task8 reconciliation의 local/Godot 실행 증거와 보존 상태는 별도 Task8 receipt가 소유한다.

## 현재 사용자 작업 범위

2026-08-26 사용자는 Visual 시안 검토 뒤 `GM-SPELL-WORKFLOW-UI-V2-01`의 플레이어 노출 흐름을 다음처럼 단순화하는 방향을 명시적으로 승인했다.

```text
글자
→ 주문
→ 대상
→ 시전
```

화면 경험은 다음 두 덩어리다.

```text
주문 만들기
= 글자 선택·작성 + FIVE_POINT_STAR 회로 조합 + 완성 주문 이름 확인

주문 쓰기
= 게임 장면의 대상 지정 + 필요한 최종 Preview + 명시 시전
```

이후 사용자는 Task8과 Task9 제품 구현을 명시적으로 승인했다. Task9 Product Root는 PR #192로 `db038a4` main에 병합됐고, 현재 범위는 `SPELL_WORKFLOW_PRODUCT_ROOT_AUTOMATED_VERTICAL_SLICE`다.

- Task9/Godot 제품 구현: **MERGED_MAIN_AUTOMATED_VERTICAL_SLICE_READY**
- Task10/UI hierarchy repair: **MERGED_MAIN_RUNTIME_UI_HIERARCHY_REPAIRED** — product root duplicate descendants were removed; glyph actions and circuit source-panel sizing were repaired. Component Sheet capture samples remain English-safe until the Korean font gate; the current product-facing W6 labels are Korean by approved player-flow direction, while Korean font rights/readability evidence remains `NOT_RUN`.
- Task11/Product Root visual surface: **MERGED_MAIN** — `bg_greenhouse_field_base.webp`와 Academy theme가 Product Root에 실제 연결됐다. 이는 첫 세션 Field/Dialogue/Battle Scene binding이나 Human visual validation이 아니다.
- Task12/direct glyph input: **MERGED_MAIN** — 직접 쓴 글자 입력의 player-facing 설명만 보완했다.
- Task13/result receipt: **MERGED_MAIN** — 실제 result payload의 대상·사용 마력·결과 문장을 Result Panel에 표시한다. 새 경제·전투·보상 authority는 추가하지 않았다.
- PR #217 greenhouse spirit idle seed: **PROJECT_ASSET_APPROVED_IMPLEMENTATION_PENDING** — 투명 PNG와 provenance는 존재하지만 battle Scene binding·Godot import·runtime evidence는 아직 없다.
- Frostbloom W6 preservation priority: **MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS** — `희귀 묘목 우선`과 `온실 구조 우선`은 같은 위협을 서로 다른 방식으로 보존하는 두 유효한 대상 우선순위다. Product Root는 W6 typed Resource의 `FROST_SEEDLINGS` / `GREENHOUSE_STRUCTURE`를 사용하고, 기존 Target/Preview/Explicit Cast/Result authority를 재사용한다. 역사 `WARD`/`FLOWER` prototype은 W6 Product Root 정본에서 superseded이며 generic selector 호환 입력으로만 남는다.
- Frostbloom W6 visual board: **SUPERSEDED_BY_USER_APPROVED_WARM_ACADEMY_TONE_LOCK** — 이전 생성 후보는 user-rejected historical exploration이다. 현재 시각 톤은 `GM-VISUAL-TONE-20260828-01`: 학습자 주도·따뜻한 마법학교 실습이며, 사용자 제공 이미지는 reference-only이고 runtime asset이 아니다.
- Frostbloom W6 key-decision scene: **USER_APPROVED_PLANNING_REFERENCE_ONLY** — 사용자는 이 한 장만 W6 계획용 시각 기준으로 확정했다. 묘목(좌)과 균열 구조물/등불(우)의 동등한 보존 가치와 얼굴을 숨긴 성인 초년 마법학교 연구생의 직접 필기를 보존한다. 다른 이미지·runtime asset·Godot 구현·character canon·Human/Device validation은 확정하지 않았다. full five-panel board는 생성 구조 QA에서 `PARTIAL`로 남고, 정확한 흐름/결과 계약은 구조화된 brief가 소유한다.
- W6 단일 구현계약: **USER_APPROVED_L2__L3_MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS** — 역사 `WARD`/`FLOWER`와 difficulty/Mana 차이 prototype은 Frostbloom 정본이 아니며 Product Root의 W6 typed Resource로 대체됐다. 사용자는 L2 review gate에서 `진행해`로 승인했고, L3는 typed Godot Resource 한 개로 target 의미/forecast/receipt를 소유한다. PR #245 exact head `b0f34b5`의 적용 가능한 checks 통과 뒤 squash merge `713bfbf`가 main에 반영됐다. owner: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_VERTICAL_SLICE_01_FEATURE_DESIGN_SPEC_2026-08-28.md`; traceability: `docs/planning/FROSTBLOOM_W6_DECISION_LOOP_01_TRACEABILITY_PACKET_2026-08-28.md`; receipt: `docs/validation/W6_FROSTBLOOM_DECISION_LOOP_IMPLEMENTATION_RECEIPT_2026-08-29.md`; Issue #242 is closed.
- 다음 W6 evidence gate: **W6_HUMAN_PLAYER_DEVICE_PERFORMANCE_ACCESSIBILITY_EXPORT_FULL_SLICE** — 자동화와 1280×720 런타임 스모크는 main에 병합됐지만, 사람/플레이어·기기·성능·접근성·export·full slice 검증은 아직 `NOT_RUN`이다. 이 gate는 기존 제품 gate `TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING`를 대체하지 않는다.
- Notion: **RETIRED_AS_CURRENT_CANON_AND_WORK_SURFACE__MIGRATION_COMPLETE** — GitHub repository가 사람용·구조화된 정본을 모두 소유한다. `GR-NOTION-MIGRATION-20260828-01`은 PR #238 merged main `1a30b9e0715b1d19e56e24f256f695b869369ca2` readback으로 완료됐다. Notion은 historical discovery-only이며 routine read/write/delete/archive/export/destination readback은 금지한다. owner: `docs/planning/REPOSITORY_ONLY_HUMAN_CANON_NOTION_RETIREMENT_2026-08-28.md`.
- 적대적·조사·구현가능성 게이트: **USER_APPROVED_ACTIVE** — 모든 material work는 fresh external research check, actual implementation-feasibility recheck, adversarial attack/validate를 거친다. L1 기획·implementation·PR·정본 교정은 최소 다섯 번의 full-scope loop와 post-merge readback을 요구한다. owner: `docs/planning/ADVERSARIAL_REVIEW_AND_EXTERNAL_RESEARCH_GATE_2026-08-28.md`. W6의 현재 판정은 `PARTIAL_EVIDENCED__MERGED_MAIN_AUTOMATED_RUNTIME_SMOKE_PASS`; 사용자 L2 review, changed-head execution과 main readback은 완료됐고 Human/Player evidence는 남아 있다.
- 다음 게이트: **TASK9_USER_VERTICAL_SLICE_VALIDATION_PENDING**
- 이미지 후보 생성: **USER_PREAUTHORIZED_GENERATE_CANDIDATE__FINAL_LOCK_ONLY** — canon·consumer·rights preflight 후 후보는 재승인 없이 생성하며, final lock·runtime use·production batch만 사용자 확정이 필요하다.
- Google Sheet 신규 canon write: **FORBIDDEN / MIGRATION_ONLY**
- unrelated open PR: **READ_ONLY**

현재 revision/implementation owner:

`docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md` + `docs/planning/TASK9_SPELL_WORKFLOW_PRODUCT_ROOT_2026-08-27.md`

## 현재 제품 현실

Frostbloom 00~46분 첫 세션 기획은 완료됐지만 제품 구현은 `PARTIAL_FOUNDATION`이다. 현재 `project.godot` 기본 실행점은 `res://src/ui/spell_workflow/spell_workflow_product_root.tscn`이며 역할은 `DEVELOPMENT_PRODUCT_ROOT_ENTRY`다. 기존 Star Harness는 삭제하지 않고 별도 POC 장면으로 보존한다. 이는 완성형 첫 세션 전체 승격을 뜻하지 않는다.

Star Circuit Runtime과 Component Sheets A–D에는 자동화/렌더 evidence가 있다. 이 component evidence와 전체 제품 상태를 혼동하지 않는다. `FULL_VERTICAL_SLICE_NOT_RUN`, `HUMAN_NOT_RUN`, `DEVICE_NOT_RUN`, `PERFORMANCE_NOT_RUN`은 유지한다.

## Workspace authority

```text
Repository
→ 사람이 읽는 Markdown 기획 / 결정 / Visual / Asset / Flow / Work
→ JSON / game data / code / Scene / Resource / Test / runtime evidence

Notion
→ HISTORICAL_DISCOVERY_ONLY
→ routine read/write / destination readback / delete / archive / export 금지

Google Sheets
→ MIGRATION_ONLY_UNTIL_REMOVAL
→ NO_NEW_CANON_WRITES
```

Google Sheet와 Notion의 과거 문구는 current authority가 아니다. `GR-NOTION-MIGRATION-20260828-01`은 main readback까지 완료됐고, Notion은 사용자가 명시적으로 허용한 historical discovery에만 읽는다. 신규 정본은 GitHub repository Markdown/JSON이며 external canon write는 하지 않는다.

## 현재 Player-facing Spell Workflow

```yaml
player_flow:
  - 글자
  - 주문
  - 대상
  - 시전
ux_group_1:
  name: 주문 만들기
  includes:
    - 글자 선택·작성
    - FIVE_POINT_STAR 회로 조합
    - 완성 주문 이름 확인
ux_group_2:
  name: 주문 쓰기
  includes:
    - 게임 장면에서 대상 지정
    - 필요한 최종 Preview
    - 명시 시전
```

플레이어 UI 기본 용어에서는 `Stock / PreparedSpell / Stage2 / Stage3 / Main / Auxiliary`를 먼저 가르치지 않는다. 내부 구현·데이터·테스트 정본에서는 이 용어와 authority를 그대로 유지한다.

플레이어 용어 매핑:

```text
Stock / Vault source → 글자 / 보관 글자
Stage2 placement → 주문 회로
PreparedSpell → 완성 주문 / 완성 주문 이름
Stage3 target selection → 대상
Stage3 explicit commit/use → 시전
```

회로 조합 결과는 숫자 목록보다 **완성 주문 이름**을 먼저 읽게 한다. 단, 실제 이름 생성 문법·조사·로컬라이징·중복 처리·효과 수치와의 대응 규칙은 이번 결정에서 새로 발명하지 않으며 별도 설계 대상이다.

완성 주문 선택 뒤 별도의 복잡한 대상 선택 전용 화면을 필수 가정하지 않는다. 권장 UX는 **게임 장면 유지/복귀 → 대상 직접 선택 → 필요한 Preview → 시전**이다.

## 현재 Visual authority

```yaml
base_style_lock:
  decision: ART-STYLE-01
  name: Soft Storybook Cel 2D Hybrid
  source_edit_regenerate_recompose: PROHIBITED_WITHOUT_EXPLICIT_USER_OVERRIDE
current_overlay:
  decision: GM-VISUAL-DIRECTION-20260825-01
  logo: LOGO_01_FIXED_AS_DEFAULT_VISUAL_DIRECTION
  style: MAGIC_ANIME_EMPHASIS_OVER_STORYBOOK_ENVIRONMENT
representative_screen_boundary:
  decision: GM-REPRESENTATIVE-SCREENS-20260825-01
  dialogue: APPROVED_REFERENCE
  battle_spell_mood_and_composition: APPROVED_REFERENCE
  battle_spell_system_ui: REWORK_REQUIRED_AGAINST_CURRENT_CANON
movement:
  previous_3d_like_presentation: USER_REJECTED
  current_direction: SIMPLE_2D_MOVEMENT_OR_SCENE_TRANSITION
```

Current coverage summary:

```text
REUSE
- Logo 01 / approved style
- Component Sheets A–D / semantic UI family

ADAPT
- dialogue
- glyph drawing
- typed glyph Vault/Stock presentation
- spell name/result presentation
- feedback/VFX
- Result/Grimoire
- simple 2D movement/scene transition
- initial companion
- font/icon support

CREATE
- Frostbloom environment candidates
- first-session character half-body set
- Frostbloom focal threat/entity

DEFER
- Task8 implementation-bound final use visual until product implementation is authorized/reconciled
- store/key art
- long-term companion growth forms

CUT
- new 3D exploration asset family
- current Slice multi-enemy wave asset family
- baked functional text/numbers/state truth
```

## 최근 Spell Visual 검토 결과

Stage2 시안은 FIVE_POINT_STAR 흐름을 읽는 데는 유효했지만, 처음 생성본의 글자가 세로 패찰/부적처럼 보이는 문제가 있었다. 후속 수정에서 사용자는 이전 글자 작성 시안의 **간략한 직접 필기형 마법 문자**를 재사용하는 방향을 승인했다.

현재 시각 규칙:

- 글자는 부적·패찰·카드보다 획/필기감이 있는 직접 쓰인 문자로 보인다.
- 회로 슬롯에는 패찰을 꽂기보다 글자를 직접 놓거나 쓰는 느낌을 우선한다.
- `준비 주문`보다 **완성 주문 / 완성 주문 이름**을 플레이어 결과 라벨로 우선한다.
- `대상 / 시전`은 게임 장면과 연결된 두 번째 UX 덩어리로 취급한다.
- 사용자 메시지는 새 이미지 생성 요청이 아니므로 이 work unit에서 추가 이미지를 만들지 않는다.

## Spell Workflow 내부 authority

```yaml
task3:
  pr: 104
  scope: IMMUTABLE_PREPARED_SPELL_AND_EXACTLY_ONCE_INVENTORY
task4:
  pr: 105
  scope: STAGE2_ATOMIC_GLYPH_PREPARATION
task5:
  pr: 106
  scope: STAGE3_TARGET_USE_ATOMIC_TRANSACTION
task6:
  pr: 108
  scope: GLYPH_DRAWING_WORKFLOW_SCREEN
  player_group: 주문 만들기
task7:
  pr: 110
  merge: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
  status: TASK7_MERGED_MAIN_VERIFIED
  player_group: 주문 만들기
next_product_task: TASK8_SPELL_USE_SCREEN
next_product_player_group: 주문 쓰기
```

이번 간략화는 내부 transaction authority를 변경하지 않는다. Task8은 기존 Task5 Stage3 authority의 thin UI consumer다. 새 Mana/inventory/result/rollback/transaction authority를 만들지 않는다. 자동 target·자동 commit·회로 자동 최적화도 금지한다.

역사 compatibility locator:

```text
GR-SYNC-20260811-01-SPELL-WORKFLOW-TASK7-CURRENT-STATE
TASK7_MERGED_MAIN_VERIFIED
TASK8_LOCAL_REFINEMENT_GREEN_UNMERGED_MERGE_GATES_PENDING
TASK8_RECEIPT_HERA_REVIEW_PR
TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
```

현재 continuation state:

```yaml
product_status_historical: TASK8_LOCAL_ACCEPTANCE_PASS_UNMERGED
product_branch_local_historical: feat/task8-spell-use-screen-v2
task8_local_git_head_baseline: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_primary_recovery_head: 8c611f601aa98397ed1558e92ab207e0e8347a9b
task8_secondary_recovery_head: fcb5dbe1cbbb23ef195633b1f6680f45d46c5a3f
task8_product_commit: 68211069eb3b778fb43e68f3fbd049c8a0ac2733
task8_remote_product_branch: codex/task8-spell-use-reconcile-v320-20260827
task8_remote_product_pr: 190
historical_product_state: UNMERGED_LOCAL_WORKTREE_DELTA
resume_gate: TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
historical_predecessor_gate: TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED
recovery_state: TASK8_LOCAL_CANDIDATE_PRESERVATION_OBSERVED_PASS
current_execution_subgate: TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
```

`8c611f...`는 당시 local Git baseline이지 Task8 product commit이 아니다. 과거 `15 tests / 90 assertions / 0 failures`, predecessor `42 suites / 1,588 assertions / 0 failures`, `HERA_SOURCE_DELTA_NONE_OBSERVED`는 그때 관찰한 uncommitted worktree의 역사 evidence다.

2026-08-24 사용자 PC read-only recovery probe로 두 로컬 Task8 후보가 실제 존재함을 확인했고, 이어 병합된 preservation tool을 실행해 외부 snapshot으로 보존했다. 직접 반환된 receipt는 `TASK8_CANDIDATES_PRESERVED`, `source_unchanged=true`, `source_content_unchanged=true`이며 primary 11 files, secondary 33 files가 snapshot에 기록됐다.

따라서 `TASK8_LOCAL_WORKTREE_DELTA_RECOVERY_REQUIRED`와 candidate-preservation gate는 닫혔다. compatibility consumer 검색을 위해 locator 문자열은 보존하지만 current gate로 재해석하지 않는다. 2026-08-27 current-main reconciliation은 새 clean worktree와 live Godot AI v3.2.0 세션에서 `6821106`으로 재작성·검증됐으며, exact-head CI·review·merge는 아직 남아 있다. 상세 증거는 `docs/planning/TASK8_CURRENT_MAIN_RECONCILIATION_2026-08-27.md`가 소유한다.

제품 구현이 다시 명시적으로 승인되면 역사 worktree에 pull/rebase/clean을 하지 않고 fresh `origin/main`에서 별도 clean reconciliation worktree를 만든다. 이후 exact-project HiGodot readback을 거쳐 primary v2를 우선 복구하고 secondary는 parity evidence로만 비교한다.

## Sync21 continuation / executor boundary — historical compatibility anchors

아래 문자열은 과거 handoff 탐색과 machine consumer compatibility를 위해 보존한다. r5.4의 current GPT→local Codex 운영 방식으로 재승격하지 않는다.

```text
GR-SYNC-20260812-21-TASK8-HANDOFF-BCP
CURRENT_DEDICATED_CODEX_REUSE_ALLOWED_FOR_CODEX_ONLY_CONTINUATION
FRESH_POWERSHELL_REQUIRED_WHEN_SESSION_RECREATION_OR_CAPABILITY_BOUNDARY
REMOTE_AUTHORITY_RECEIPT
LOCAL_EXECUTION_RECEIPT
EXECUTOR_CAPABILITY_BLOCKER
DO_NOT_RETRY_BLOCKED_REMOTE_CHECK_IN_CODEX
FRESH_GITHUB_CONNECTOR_READBACK_REQUIRED_BEFORE_REMOTE_WRITE
```

Remote authority readback은 local worktree/HEAD/HiGodot evidence를 대체하지 않는다. 현재 r5.4의 local Codex policy는 retired이며, 위 문자열은 current orchestration instruction이 아니라 historical locator다.

## Base proposal / learning closure provenance

```yaml
base_proposal_id: BCP-2026-024-execution-sandbox-authority-split-recovery
base_proposal_pr: https://github.com/alsdmlals4-eng/Base/pull/297
base_proposal_merge: 449b83c6f1afdf191327a52a8e71d11b4fba7eb3
base_proposal_state: BASE_PROPOSAL_STORAGE_MERGED_SUBMITTED
base_implementation_authority: BASE_IMPLEMENTATION_AUTHORITY_NOT_GRANTED_IN_THIS_STAGE
learning_closure: LEARNING_CLOSURE_OPEN_COUNT = 0
```

이 값들은 Sync21 handoff가 닫은 역사 provenance이며 r5.4 전환이 새로운 Base implementation authority를 부여하지 않는다.

## Tool authority

- Current tracked project vendor: HiGodot/Godot AI `v3.2.0`, exact plugin subtree `66a9df59a92f0029efcd35c22fea355c93e8fe49`; see `docs/validation/HIGODOT_V3_2_0_VENDOR_INTEGRITY.json`.
- Historical project tool provenance: HiGodot/Godot AI `v3.1.2`–`v3.1.4`, GUT `v9.7.1`, Hera `v1.0.0`. Historical live receipts do not prove a current v3.2.0 session.
- r5.4는 project-specific local Codex home/binary/port를 current invariant로 사용하지 않는다.
- 실제 shared Godot/Godot AI runtime/session readiness는 fresh local executor/session readback 없이 주장하지 않는다.
- historical live receipts는 현재 local readiness를 자동 증명하지 않는다.

## PR #151 / current open PR boundary

PR #151 `feat(ui): build GRIMOIRE component sheets A-D`는 **병합 완료**된 current-main 역사다. Component Sheet A–D와 semantic UI pack은 병합된 사실로 읽되, 이것이 Task8 또는 Human/Device/Performance/Full Slice PASS를 의미하지 않는다.

2026-08-26 이번 work unit 시작 시 live open PR은 PR #166 하나이며 `README.md`만 변경하는 Draft other-workstream이다. `OPEN_PR_READ_ONLY_BY_DEFAULT`로 유지하고 이번 current-task branch에 흡수하지 않는다.

## v4.8 migration / legacy snapshot boundary

`docs/planning/CURRENT_CONFIRMED_DECISIONS.md`와 `CURRENT_UNRESOLVED_GATES.md`는 v4.5 시기의 장기 machine snapshot을 보존한다. v4.8 thin-adapter 전환 후에는 **HISTORICAL_COMPATIBILITY_SNAPSHOT**으로만 사용하고 새 current decision/gate를 기록하지 않는다.

현재 authority chain:

```text
사용자 최신 지시
→ AGENTS.md
→ START_HERE.md
→ docs/ACTIVE_CONTEXT.md
→ docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md
→ docs/planning/SPELL_WORKFLOW_PLAYER_FACING_SIMPLIFICATION_2026-08-26.md
→ docs/planning/visual/GRIMOIRE_VISUAL_ASSET_COVERAGE_2026-08-26.json
→ task/domain-specific current owner
→ actual code/data/Scene/Resource/Test/runtime evidence
```

## 제품 구현을 다시 시작할 때의 순서

```text
1. TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
2. fresh exact-project HiGodot readback + primary v2 recovery / secondary parity comparison
3. 새 player-facing overlay를 Task8 UI 용어·동선에 매핑하고 기존 Stage3 authority와 충돌 없는지 확인
4. fresh Task8 GUT + predecessor/full runner + Hera source-delta + exact-path adversarial review
5. Task8 product PR / exact-head CI / merge / merged-main readback
6. Task9 Product Root + responsive/E2E integration
7. 대표 00~10분 Human Slice
8. 10~23 → 46분 증거 확장
```

## 완료로 주장하지 않는 항목

```text
TASK8_PR_PREP_REVERIFY_PENDING
TASK8_CLEAN_RECONCILIATION_WORKTREE_REQUIRED
TASK8_PR_EXACT_HEAD_CI_REVIEW_MERGE_PENDING
TASK8_CURRENT_MAIN_LOCAL_VALIDATION_PASS_PR_PENDING
HIGODOT_EXPECTED_VERSION_FIELD_NOT_SURFACED
AUDIO_VAULT_PATH_UNVERIFIED
AUDIO_RIGHTS_UNVERIFIED
VISUAL_AUDIO_COMPLETE_NOT_PROVEN
RUNTIME_VISUAL_COMPLETE_NOT_PROVEN
HUMAN_NOT_RUN
DEVICE_NOT_RUN
PERFORMANCE_NOT_RUN
FULL_VERTICAL_SLICE_NOT_RUN
WINDOWS_EXPORT_NOT_RUN
ANDROID_EXPORT_NOT_RUN
ANDROID_DEVICE_NOT_RUN
```
