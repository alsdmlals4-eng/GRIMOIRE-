# GRIMOIRE 재기획 접수와 Aseprite 임시 작업 승인

## 현재 사용자 결정

- 최신 `둘 다 똑같아 보이는데. 캐릭부터 다시만들자`: 질감만 변경한 시안은 미채택. 기존008 외형 보존을 새 캐릭터 후보의 의무로 삼지 않고, 기존 이미지 입력 없이 얼굴/머리/교복/포즈부터 재설계한다. 학생다운 상반신·비도트·Aseprite 미사용은 유지. 새 외형은 후보 검토 전이며 옛 파일/승인 이력을 삭제하지 않는다.

- 후속 사용자: 이번 프로젝트에서는 Aseprite/도트 방향을 사용하지 않고 이미지 모델로 다른 비도트 그림체를 제작한다. 기존 비교 시안은 미채택 참고. 주인공1명의 담백한 동화책풍(큰 색면·절제된 음영·잉크 선) 후보를 먼저 검토하며, 학생 정체성/상반신/책/남색 외투/청록 스카프 유지. 이전 Aseprite 임시 경로 허용은 역사 기록이며 새 제작의 필수 단계가 아니다. 카드 외형은 사용자 제공 세로형 일러스트 카드 참고, 손패에서 겹쳐 조합하고 단독 시전도 가능하다는 방향 유지. 최종 후보 승인/새 runtime 적용은 별도.

- 2026-09-11 사용자: 십보강호 사람용 블루프린트 PDF는 구조 참고만 하며 GRIMOIRE 전용 상세 기획·SWOT 보완·아틀라스·시스템·데이터·실사용 이미지 후보를 준비한다. 세부 기획/조사/필요 이미지 제작은 위임, 최종 검토 뒤 게임 구현 승인. [사람용 본책](../superpowers/specs/2026-09-11-human-blueprint.md)이 첫 학교생활 장의 콘텐츠/화면/인계 구조를 소유하고 기존 공통 규칙은 포함 발행한다. 이전 이미지 제작 보류는 이 범위에서 해제한다. 생성 성공은 최종 외형 승인·runtime 적용이 아니다.

- 최신 사용자 `맞아 세부규칙은 네가 권장안대로 잡아줘`: 결투 밖에서는 배운 글자를 선택하며, 공통 주문을 실습·온실·축제에서도 사용한다. 카드 형식은 선택 도구이고 손패/드로우는 결투 규칙이다. [공통 주문 규칙 설계](../superpowers/specs/2026-09-10-shared-spell-rules-design.md)가 상세 권장 기준을 소유한다. 수치는 시험 기준이며 실행 검증·사람 검증을 뜻하지 않는다. 규칙을 이미지보다 먼저 진행한다. 로컬 알파 분리 방식은 허용됐으나 현재 설치·처리는 보류한다.

- 최신 `이전에 승인된 캐릭터 시안들도 확인하고 그거 기준으로 만들어`: 첫 학생은 이전 008 승인 외형을 우선 참조한다. 사용자 제공 전신 그림은 003과 동일하며 상반신 제작 방향을 취소한 지시가 아니다. 현재 참조/거부 이력과 새 검토본은 `docs/planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md`의 최신 교정 절이 소유한다.
- 최신 `확정할게 진행해`: `duel-background-candidate-01.png` (SHA-256 `8445F4409DA8CB388F1157D9CF1CE41C1222746F3818D48FF71325EC1F4F6F36`)를 배경으로 채택한다. 인물·카드·모션은 이 승인으로 자동 확정되지 않는다. 첫 학생 기본 포즈 후보와 투명화 검사는 `docs/planning/visual/CARD_DUEL_STUDENT_LEFT_01_2026-09-10.md`를 따른다.
- 최신 `좋아 권장안대로 계속 진행해`: 화면 후보의 학생 비율·따뜻한 연습실·남색/금색을 방향 참고로 채택하고 중앙 별 장식은 제외한다. 합성 그림은 runtime에 직접 넣지 않는다. 승인된 첫 결투 도메인 구현을 진행했으며 현재 결과는 `docs/validation/CARD_DUEL_DOMAIN_2026-09-10.md`가 소유한다. 새 UI/분리 아트/스토리 연결·main 통합은 남아 있다.
- 다시 `권장안대로 진행`: 대표 결투의 두 장 무순서 조합·한 교환 해소·단판 결계 승리·손패 보존/순환·행동 기반 시간 권장안을 채택한다. 수치는 플레이테스트용이며 조정 가능하다. 새 이미지 후보와 구현 계획을 진행하며 이미지 최종 확정은 별도다. 도메인 계획: `docs/superpowers/plans/2026-09-10-card-duel-domain-implementation.md`.
- 후속 `좋아 권장안대로 진행해`: 제한된 짧은 조합 A를 상세 블루프린트 기준으로 채택한다. 새 턴·승패·소비 수치를 이미 승인한 것으로 확대하지 않는다. 상세 검토본은 `docs/superpowers/specs/2026-09-10-card-duel-blueprint.md`다.
- 2026-09-10 후속 확정: 글자·마법 직접 그리기 대신 카드 조합으로 주문을 표현한다. 마법사 결투·카드 게임은 미니게임이 아니라 메인 진행 방식이다. 마법사 종류 카드는 제외한다. 상세 규칙은 임의 확정하지 않는다.
- 기존 요소의 유지·변경·보완은 [카드 결투 재기획 조사](CARD_DUEL_REPLANNING_RESEARCH_2026-09-10.md)에서 공식 자료·벤치마크·SWOT·구현 실태를 비교한다. 그 문서의 제안은 사용자 확정 방향과 구별한다.
- 2026-09-10: current-authority read order로 프로젝트를 다시 읽고 기획부터 재검토한다. 기존 이미지는 새 제작의 참고자료로만 사용하며 새 이미지를 제작한다.
- 같은 날 `허용`: Aseprite 처리에 한해 `C:/Users/user/.local/share/aseprite-local/candidates`의 GRIMOIRE 전용 하위 폴더를 임시 작업에 사용할 수 있다. 필요한 결과와 증거는 프로젝트로 회수하고 임시 복사본을 정리한다.
- 이전 이미지의 승인 이력은 역사 증거로 보존한다. 이력 자체를 지우거나 기존 실행 씬의 이미지를 일괄 제거하는 승인이 아니다. 새 제작에 옛 이미지 잠금을 자동 승계하지 않는다.
- 기획 재검토는 특정 새 그림체, 카드 상세 규칙, 이동 방식 또는 기존 코드 전면 폐기를 자동 확정하지 않는다.

## Fresh-read 결과와 적용 범위

프로젝트 main `d384c454768a8aa3b0adb939e0b035ac2afa426e`와 Base main `2f93e872d9ed4fa18018ac759b01acd7d34e9b58`을 fetch 후 확인했다. 이 값은 이번 관찰의 출처이며 다음 작업의 영구 실행 권한이 아니다.

- 프로젝트의 v9.4.3 version lock을 유지했다. 프로젝트 operating-contract validator는 `OPERATING_CONTRACT_VALID`, 19 routes, generated views `CURRENT`를 반환했다.
- main에는 별형 Product Root가 있고, 서클·시계·스토리 구현은 열린 Draft PR #253의 `6f92a4c5d50c5b6cb75598b8ee627ab79ba99076`에 있다. 미병합 구현과 병합된 구현을 구별한다.
- 열린 PR #249, #187, #166도 확인했다. 이번 접수는 이 PR들의 수정·흡수·병합을 수행하지 않는다.
- main의 기존 `artifacts/foundation-poc/glyph-fixture-rows.json` 수정은 보존한다.
- 기존 AGENTS/START_HERE/Active Context의 승인·단계 정보는 새 재기획 완료를 뜻하지 않는다. 새 작업 방향은 이 사용자 결정이 소유하며, 옛 코드와 문서는 실태 및 비교 증거다.

## 적용한 Base owner

최신 원격 파일에서 다음을 읽었다. 프로젝트 계약 전체를 최신 Base로 교체하지 않는다.

- `docs/knowledge/game-development/ART_DIRECTION_AND_ASSET_PLANNING_GUIDE.md`, 특히 Aseprite 조건부 도구 선택.
- `skills/designing-art-prompts-and-technique-cards/SKILL.md`.
- 같은 Skill의 `references/sprite-pose-sequence-controls.md` 및 `references/effect-stage-compositing-controls.md`.
- `skills/managing-project-intake-and-work-contract/SKILL.md`와 `templates/planning/EXECUTION_SEQUENCE_PLAN.md`.

공식 기능 근거: https://www.aseprite.org/docs/cli/ 및 https://www.aseprite.org/docs/animation/ (2026-09-10 조회). 이미지/JSON export와 프레임 편집 기능은 제작 수단이며 현재 게임 애니메이션 완성 증거가 아니다.

## 승인된 임시 처리 경계와 호출 증거

- 작업 폴더: `C:/Users/user/.local/share/aseprite-local/candidates/grimoire-replanning-20260910-01`.
- 사용 지침: `C:/Users/user/.local/share/aseprite-local/LOCAL_USAGE.md`.
- transport: 현재 세션의 native `aseprite-candidates` MCP.
- executable version readback: `Aseprite 1.3.18.5-dev`.
- `create_canvas` → `get_sprite_info`: 성공. 16×16 RGB, 1 frame, 1 visible layer, duration 100 ms, tags 없음.
- 시험 파일 SHA-256: `0547BE7F8303FF064ED7E2ACD11F9E3D9207C983B2AC67C2E5E4E0804B99E7B3`.
- 이 크기와 duration은 도구 시험값이다. 게임 제작 규격·동작 속도로 채택하지 않는다.
- 상태: `CLIENT_DISCOVERED`, `CALL_VERIFIED`. 실제 이미지 import/export 상태군 작업은 `TASK_VERIFIED` 미도달.
- 시험 파일은 호출 증거 기록 후 제거한다. 새 그림 제작이나 애니메이션 완성을 주장하지 않는다.

## 이어갈 제작 순서

1. 핵심 플레이 경험과 장기 학교생활 구조를 재검토하고, 기존 결정별 유지·수정·재검토 근거를 작성한다.
2. 새 화면 흐름과 와이어프레임을 만든다. 각 화면의 입력·결과·회복과 실제 이미지 소비처를 지정한다.
3. 새 아트 방향을 비교하고 실제 장면용 이미지·캐릭터 핵심 포즈를 이미지 모델로 제작한다. Aseprite 사용 자체로 픽셀 아트를 확정하지 않는다.
4. 포즈 제작 전 연출을 조사하고 준비·실행·접점·결과별 반응·복귀, 시선·실루엣·소품·카메라·크롭을 설계한다.
5. 필요한 경우 Aseprite로 복사본의 레이어·프레임·duration을 정리하고 PNG+JSON을 내보낸다. 파일마다 source hash, frame/state, pivot/offset, export 설정, 결과 hash를 기록한다.
6. Godot 소비처에서 실제 입력·판정·피드백과 연결한다. 애니메이션 누락·중단이 자원·저장·진행 결과를 바꾸지 않도록 한다.
7. 이펙트 OFF/ON, 실제 표시 크기, 밝고 어두운 배경, 반복·전환을 검수한다. 이미지 후보·최종 승인·엔진 적용·사람 검수 상태를 구분한다.

배경·캐릭터·이펙트·기능 텍스트를 각각 제어한다. 핵심 포즈를 검토한 뒤 중간 프레임으로 확장하며, 정지 이미지들을 시트로 묶었다는 사실만으로 동작 제작 완료를 주장하지 않는다.

## 현재 완료 범위

임시 경로 승인 기록과 Aseprite 기본 호출 확인까지 완료했다. 전체 재기획, 새 아트 방향 확정, 새 이미지·모션 제작, Godot 통합은 후속 작업이다. 이 접수 기록은 기존 기획서나 PDF를 새 완성본으로 대체하지 않는다.
