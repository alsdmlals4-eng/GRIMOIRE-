# GRIMOIRE 작업 규칙

## 항상 적용할 경계

- 최신 사용자 지시 → 이 파일과 START_HERE → 현재 체크아웃의 Active Context·승인 결정 → 실제 코드·데이터·씬·자산·검증 → 채택 Base 계약 → 최신 Base drift 순으로 판단한다.
- 작업 전 branch/HEAD/dirty, 최신 origin/main, 관련 PR과 대상 consumer를 확인한다. 과거 채팅·PDF·고정 SHA·옛 단계 기록은 현재 실행 권한이 아니다.
- 새 변경은 의도·현재 상태·변경/보호 범위·구현 방향·완료/검증 기준을 한국어로 설명하고 승인받는다. 같은 승인 범위의 기획·구현·교정·검증·허용 병합은 재승인하지 않는다.
- 승인 범위 안에서 실제 도구로 실행한다. 새 방향·추가 비용·보안·파괴적 작업은 다시 결정받는다. 필수 근거 미확인은 해당 의존 작업만 보류하고 독립된 승인 작업은 계속한다.
- 현재 작업에 필요한 최소 Skill·reference만 읽는다. 관련 구현·승인 자산·유효한 조사부터 재사용하고 근거가 부족하거나 바뀐 판단에만 새 조사를 한다.
- Base/플러그인/단계마다 동일 승인·계획·검토 예산을 초기화하지 않는다. 전체 검토는 같은 승인 후보 계보에서 총 2회, 이후에는 결함별 교정·표적 검증을 수행한다. 필수 CI와 실제 acceptance는 생략하지 않는다.
- 상위 시스템·도구 안전 규칙을 우회하지 않는다. 설치 플러그인·캐시·전역 설정·다른 저장소를 이 프로젝트 지침 수정에 끌어들이지 않는다.

## 읽기와 기록

[START_HERE.md](START_HERE.md)의 경로만 먼저 따른다. 게임 규칙과 진행 상태를 이 파일에 복제하지 않는다.
채택 운영 조항·Base 출처·검토 기록은 [기존 계약](docs/contracts/GRIMOIRE_PROJECT_CONTRACT_V4_8_BINDING.md),
현재 작업과 다음 단계는 [Active Context](docs/ACTIVE_CONTEXT.md)가 소유한다.
상세 Skill은 [프로젝트 라우터](.agents/skills/grimoire-workflow-router/SKILL.md)를 사용한다.
공용 Base Skill 본문을 복제해 두 번째 owner를 만들지 않는다.

## 보호할 것

- 게임 의미·엔진·저장 호환성·승인 자산은 운영 지침 정리로 바꾸지 않는다. 현재 project.godot와 실제 consumer가 실행 사실을 결정한다.
- 사용자 변경과 다른 PR/worktree는 보존한다. 오래된 이름만으로 삭제하지 않으며, 폐기 근거·참조·복구 경로가 확인된 승인 범위만 정리한다.
- Repository가 기획·코드·자산·증거의 정본이다. Notion은 역사 discovery-only, Sheets는 migration-only이며 일반 작업에 생성·동기화하지 않는다.
- 다른 open/draft/ready PR은 읽기 전용이다. 이번 current-task PR만 승인 범위·exact HEAD 검사·리뷰·미해결 thread·보호 규칙을 확인한 뒤 정상 병합한다. force/direct-main/admin 우회는 금지한다.
- 이미지는 실제 이미지 도구와 확인된 consumer/규격에 따라 제작한다. 분리 자산은 단색 크로마키 원본 → 배경 제거 → RGBA·가장자리 검수. 원본·결과·provenance를 보존하고 후보/사용자 승인/등록/적용/실행 검증을 분리한다.
- 월간 작업일지는 기존 파일에 날짜별로 누적한다. 실제 작업일·기록일·검증 상태를 구분하고 개인 입력·계정·결제 자료는 공개 Git에 넣지 않는다. 사용자 지정 증빙 폴더는 파생 출력 예외다.
- 출시·권리 작업에서만 docs/PLATFORM_RELEASE_AND_ASSET_RIGHTS_PROFILE.md, docs/ASSET_RIGHTS_AND_PROVENANCE_RECORD.md, docs/GAME_RELEASE_COMPLIANCE_EVIDENCE_PACK.md를 읽는다.

## 검증과 마무리

변경 영향 검사 → 관련 회귀 → 필수 CI → 정상 병합 → main readback을 연결한다.
문서·정적 검사·자동 시험·Godot 실행·Human·기기·최종 자산 승인·출시를 구분한다.
실행하지 않은 검증은 NOT_RUN이다. 문서만 수정한 작업에는 불필요한 Godot 실행을 요구하지 않는다.
플레이어 경험 변경은 [UX/UI의 재미 검증 연결](docs/UX_UI_SYSTEM.md#fun-verification-binding)을 따른다. 자동 검사나 AI 평가로 HUMAN/FUN_PASS를 선언하지 않는다.
보고는 결과 → 이유/작동 방식 → 직접 확인 방법 → 검증·남은 위험 순으로 짧게 쓴다.
역사 진입 문서는 docs/archive/authority-before-lean/에 보존하며 현재 지시로 로드하지 않는다.
