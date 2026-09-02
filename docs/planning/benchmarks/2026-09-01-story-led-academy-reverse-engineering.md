# GRIMOIRE 스토리 주도 마법학교 벤치마크 역공학 — 2026-09-01

```yaml
research_id: GR-BENCH-STORY-ACADEMY-20260901-01
status: RESEARCHED__PLANNING_INPUT
scope: admission_to_lesson_practicum_duel_festival__card_archive_presentation
checked_on: 2026-09-01
source_policy: official_or_publisher_owned_pages_first
project_decision: GM-CIRCLE-CLOCK-CARD-CORE-01
expression_policy: functional_patterns_only__no_character_ui_story_or_world_copy
```

## 질문과 방법

질문은 하나다. **마법학교 생활이 단순 활동 선택 메뉴가 아니라, 수업에서 배운 판단이 실습·결투·축제에서 다시 쓰이는 이야기 진행으로 어떻게 읽히는가?**

공식 소개·게임 가이드 페이지를 12종 대조했다. 페이지의 게임 설명은 사실 근거이고, 아래의 프로젝트 적용은 그 사실에서 도출한 `INFERENCE`다. 원작의 고유 캐릭터, 학교 구조, 카드 피부, 대사, 비주얼 구도, 상징과 세계관은 복제하지 않는다. 이 문서의 처분 표기는 `ADOPT / ADAPT / REJECT`이며, 외부 표현을 채택하는 허가가 아니다.

| # | 공식 출처 | 관찰한 기능적 패턴 | GRIMOIRE 적용 | 처분 |
| --- | --- | --- | --- | --- |
| 1 | [Volcano Princess](https://store.steampowered.com/app/1669980/Volcano_Princess/) | 시간 관리·이야기·선택의 누적을 한 학생 성장 흐름으로 제시한다. | 매 장면을 독립 미니게임 선택이 아니라 다음 사건의 학습/관계 맥락으로 연결한다. | ADAPT |
| 2 | [I Was a Teenage Exocolonist](https://store.steampowered.com/app/1148760/I_Was_a_Teenage_Exocolonist/) | 서사적 성장과 카드 기반 대결을 한 선택의 결과로 연결한다. | 카드 해금은 `StoryProgress`가 소유하고, 카드 화면은 기록/맥락 우선으로 둔다. | ADAPT |
| 3 | [Potion Permit](https://store.steampowered.com/app/1337760/Potion_Permit) | 관찰→재료/도구→문제 해결→주민 변화의 문제 해결 루프가 있다. | 수업에서 글자의 성질을 관찰하고, 실습에서 목적·위험·대상을 읽는 순서를 유지한다. | ADAPT |
| 4 | [Fire Emblem: Three Houses](https://www.nintendo.com/us/store/products/fire-emblem-three-houses-us/) | 학교의 학업 생활과 전략 전투를 같은 학생 집단의 이야기로 묶는다. | 수업/결투를 별도 모드가 아니라 다음 서사 비트로 배치한다. 전술 전투 규칙이나 학급 구조는 도입하지 않는다. | ADAPT |
| 5 | [Persona 5 Royal](https://persona.atlus.com/p5r/?lang=en) | 수업·방과 후 활동·관계·위험한 장면을 연간 이야기 리듬으로 제시한다. | 장면 전환마다 "왜 지금 이 행동인가"를 이야기로 설명하고, 허브의 활동 버튼 나열은 피한다. | ADAPT |
| 6 | [GWENT 공식 FAQ](https://www.playgwent.com/en/faq) | 덱 구성·라운드·블러핑을 구분하고, 규칙 학습과 심화 조합을 분리한다. | 카드 UI는 카드 정체성·조합·선택 피드백을 먼저 설계하되, 상세 라운드 규칙은 사용자 제공 전까지 보류한다. | ADAPT |
| 7 | [Shadowverse 공식 가이드](https://shadowverse.com/en_lp/10001/index.php) | 추종자·주문·부적의 역할 구분과 턴제 선택을 명확히 설명한다. | 카드 타입 네 개(`WIZARD`, `ATTACK_SPELL`, `DEFENSE_SPELL`, `SUMMON`)의 라이브 분류 UI만 준비한다. 비용·수치·승패는 정하지 않는다. | ADAPT |
| 8 | [Magical Diary: Horse Hall](https://store.steampowered.com/app/211340/Magical_Diary_Horse_Hall/) | 수업, 시험, 인간관계, 학교 행사가 같은 학기 경험으로 연결된다. | 입학식→수업→실습→결투→축제의 장면 변화를 명시하되, 연애·기숙사·시험 구성은 도입하지 않는다. | ADAPT |
| 9 | [Little Witch in the Woods](https://store.steampowered.com/app/1594940/Little_Witch_in_the_Woods) | 배운 기술을 주변 문제 해결과 주민 관계로 되돌린다. | 첫 실습의 보호/관찰 결과가 축제의 비전투 협력 장면까지 이어지는 의미를 둔다. | ADAPT |
| 10 | [Whimel Academy](https://store.steampowered.com/app/2377250/Whimel_Academy/) | 수업·교내 활동·친구 관계·피로 관리가 학생 생활로 묶인다. | 학생다운 생활 감각은 채택하되, 에너지·경제·관계 수치는 아직 새로 만들지 않는다. | REJECT_AS_CURRENT_RULE |
| 11 | [Academagia](https://store.steampowered.com/app/533480/Academagia_The_Making_of_Mages/) | 수업·기술·동료·탐색을 큰 학교 세계의 여러 선택지로 제공한다. | 학습이 장면의 도구가 되는 구조만 참고한다. 방대한 텍스트/스탯 메뉴와 세계 규모는 현재 모바일 첫 세션에 맞지 않는다. | REJECT_AS_CURRENT_SCOPE |
| 12 | [Hogwarts Legacy 공식 FAQ](https://www.hogwartslegacy.com/en-us/faq) | 수업에서 주문·식물·물약을 배우고 전투/탐색에 활용하는 학교 판타지를 표방한다. | 수업에서 배운 공용 글자가 뒤 장면에서 재사용된다는 원리만 채택한다. 특정 학교, 의상, 기숙사, 주문명, 캐릭터 또는 표현은 복제하지 않는다. | REJECT_EXPRESSION__ADAPT_PRINCIPLE |

## 역공학 결론

### ADOPT — GRIMOIRE가 이미 가진 강점

1. `StoryProgress`가 장면 접근을 소유한다. 메인 화면에서 수업/실습/결투/축제를 버튼으로 고르는 구조는 만들지 않는다.
2. 직접 글자 쓰기 → 겹서클 → 대상 → 명시 시전 → 사건 시계 결과라는 코어 문법을 모든 사건의 공통 언어로 쓴다.
3. `Goal Clock`과 `Threat Clock`은 승패 숫자판이 아니라, 수업의 안전한 관찰·실습의 압박·결투의 주고받기·축제의 공동 복구를 각각 다르게 보이게 하는 라이브 UI다.

### ADAPT — 이 작품만의 구조

```text
입학식: 학교의 약속을 듣는다
→ 수업: 안전한 반응을 직접 관찰한다
→ 첫 실습: 두 보존 대상을 읽고 명시 시전한다
→ 결투 연습: 다른 학생의 시전을 읽고 안전한 대응을 고른다
→ 축제: 여러 유효한 돌봄의 표현을 함께 완성한다
```

- 결투는 처치·적 물결·자동 정답이 아니라 **학생끼리 안전하게 대응과 대가를 배우는 사건 시계 장면**이다.
- 카드의 “기록”은 이야기가 먼저, 대결 규칙은 나중이다. 카드 아카이브에서 독립 결투를 시작하지 않는다.
- 2D 이동은 배경·짧은 대화·장면 전환으로 표현한다. 3D 탐색 자산군은 만들지 않는다.

### REJECT — 현재 보류 또는 금지

- 외부 게임의 카드 프레임·전장·애니메이션·캐릭터·세계관·승리 연출 복제
- 고정 마력 20, 7·7·6 분배, 고정 승패/라운드 규칙의 임의 확정
- 활동 선택 허브, 자동 대상, 자동 시전, 교수의 정답 강요
- 배경에 기능 글자·숫자·룬·UI를 구워 넣는 방식

## 근거의 한계

이 조사로 특정 수치, 재미, 인간 UX, 모바일 조작성, 카드 규칙의 균형, 실제 런타임 품질은 증명하지 않는다. 그 항목은 현행 Godot 구현·테스트·향후 사람/기기 세션에서 별도로 검증한다.
