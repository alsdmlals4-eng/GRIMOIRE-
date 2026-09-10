# 사람용 블루프린트 발행 검증 — 2026-09-11

상태: DESIGN_REVIEW_USER_FINAL_APPROVAL_PENDING. 제품 코드 변경 없음. 최종 승인 후 첫 구현 구간을 시작할 문서·시각 후보 패키지이며 전 학년 콘텐츠/출시 패키지 완성이 아니다.

## 입력과 현재 권위

- 사용자 예시 PDF 92쪽은 구조 참고만 했다. GRIMOIRE 전용 시스템·수치·인물·이미지를 사용했다.
- 현재 작업 브랜치: codex/replanning-intake-20260910. 작업 시작 HEAD 9281935211c93d92b83c631ef9b4fee2ecd0142e.
- fresh origin/main: d384c454768a8aa3b0adb939e0b035ac2afa426e. Base origin/main: 2f93e872d9ed4fa18018ac759b01acd7d34e9b58. 프로젝트 pin 9.4.3 유지.
- AGENTS/START_HERE/Active Context/재기획/공통 규칙/실제 project.godot·card_duel·씬 및 live open PR 조회. #253/#249/#187/#166은 Draft read-only 유지.
- Base managing-design-documents, 이미지 제작/Aseprite 선택, PDF·이미지 제작·완료 전 검증 지침을 적용했다. Base 규칙 자체는 수정하지 않았다.

## 5회 교차 검토와 교정

각 회차는 방향·규칙·소비처·데이터·시각·증거를 다시 대조했으며 독립 외부 전문가 검수나 사람 플레이테스트가 아니다.

| 회차 | 반증 질문·발견 | 교정과 남은 경계 |
|---|---|---|
| 1 권위/범위 | 예시의 전투·역사 별형 문서가 새 기획으로 섞이는가? | 카드형 글자, 결투 밖 배운 글자 선택, 첫 장/장기 확장 구분. final 승인 전 제품 변경 금지 |
| 2 경험/연구 | 조합 자체를 독창성으로 과장하는가? 온실만 반복하면 선택이 생기는가? | 10작품 ADOPT/ADAPT/REJECT, SWOT→TOWS 실행 전략. 후속 시료 실습 제안. 새 과제 실제 재미는 NOT_RUN |
| 3 의미/구현 | 장면별 효과·비용·저장·소비가 일치하는가? | 수업/축제 화면의 온실 비용 제거, 결투 바람+막기 예고와 결과 일치. 온실 수동청소 첫/둘째 상태 명확화. 실제 새 의미 엔진은 미구현 |
| 4 시각/자산 | 체크무늬를 alpha로 착각하거나 후보를 승인으로 부르는가? | 동료 그림체를008 참고로 모델 보정, 동료/교수 로컬 alpha 분리. 원본 보존.16 region 경계 지정. 시계는 독립 프레임+엔진 상태 표시 |
| 5 발행/재현 | 부록 누락·고립된 표 행·종횡비 왜곡·부풀린 PASS가 있는가? | 10작품 원본 부록 합성, 표/그림 크기와16:9 비율 교정.58쪽 전체 렌더 접촉시트 검토 및 주요 페이지 확대 검토. 문서 검증과 runtime/Human 분리 |

공식 재조회 링크는 본책38장과 연구 원본에 있다. GDC는 공개 발표 개요를 읽었으며 전체 강연을 시청했다고 주장하지 않는다. Witchbrook 공개 계획은 출시/성공 증거가 아니다.

## 실제 발행 증거

- PDF: output/pdf/GRIMOIRE_HUMAN_BLUEPRINT_20260911.pdf
- SHA256: 4e7695daf084dbf938cb2d2d445abc3e04cc7b005ffb469369fe134dee11934a
- 58페이지 / 21,876,832 bytes. 원본PNG는 유지하고 PDF 내 RGB 표현만 JPEG90으로 압축했다.
- build_human_blueprint_pdf.py: exit0, 비어 있는 페이지0. 원본/공통규칙/연구/생성기/PDF 해시 연결.
- inspect_human_blueprint_pdf.py: exit0; 58페이지=58렌더, 13개 소비 자산 해시 일치,16개 region 경계/면적 검사.
- 모든58페이지를1100px 렌더 후5개 접촉시트로 검토. 주요 화면·초상·시계 페이지를 개별 확인. 표 고립 행과 늘어난 초상 비율은 최종본에서 교정.
- Python 작성 도구3개 문법 검사 실행. 프로젝트 validator: OPERATING_CONTRACT_VALID / 19 routes / CURRENT.
- manifest의 render_review는 실제 검토 후 붙인 관찰값이다. 재생성하면 PENDING으로 돌아가므로 다시 렌더 검토해야 한다.

## 이미지·Aseprite와 실사용 경계

최종 PDF 소비: 새 후보12개와 이전 승인 결투 배경1개. 새 배경4, 상반신3, 글자 atlas1, 대상 상태 atlas1, VFX atlas1, 대화 프레임1, 시계 프레임1. 모든 실제 경로·규격·alpha extrema·SHA는 manifest가 소유한다. 프롬프트는 production-input/refinement-input/clock-input에 있다.

동료 최초원본→그림체 수정원본→최종 alpha와 교수 원본→alpha는 출처/재보정 입력으로 남긴다. alpha 분리는 로컬 rembg2.0.84/u2netp이며 원격 업로드가 아니다. 학생의 alpha 최대254는 실제 측정치로 보존, 불투명255라고 꾸미지 않는다. 밝은 책 페이지와 남색/배경 합성에서 초상 경계를 확인했으나 실제 기기 가장자리·축소 필터 검수는 별도다.

Aseprite glyphs.aseprite의1254×1254/rgb/1frame을 실제 조회하고 sheet/JSON export 성공. raw export JSON은 작업 영수증이며 실제4글자 tile영역은 atlas-regions.json이 소유한다.4글자와4VFX를 애니메이션4프레임으로 취급하지 않는다. props1254폭은4등분 정수 경계0/313/627/940/1254로 기록했다. 실제 Godot region/pivot 검증 전이다.

UI frame9-slice 늘어남, 시계 동적 칸 표시, VFX 경계/지속시간, 오브젝트 기준점, 모션·음원은 통합 단계 검증/제작 항목이다. 이미지 후보가 있다는 이유로 ASSET_READY 전체 PASS를 선언하지 않는다.

## 자동화·학습과 남은 작업

- 규칙 원본을 PDF 부록으로 직접 합성해 중복 수치 편집을 방지했다. PDF/해시/페이지/alpha/atlas 검사 도구는 프로젝트에서 재사용한다.
- 공용 후보: 문서 내부 screen 합성은 종횡비 유지, atlas 구획은 실제 픽셀 치수로 검사, raw export 영수증과 runtime atlas를 분리. 다른 프로젝트 재현 전 Base로 자동 승격하지 않는다.
- 전달 검사에서 PDF에 global diff=astextplain이 적용되어 binary 스트림을 공백 오류로 검사하는 문제를 재현했다. 이 PDF 한 경로에만 binary 속성을 지정해 텍스트 변환과 diff를 차단했다. 문서 bytes/해시는 바꾸지 않았다.
- 임시 PDF 렌더·중간 접촉시트는 검수 후 제거 가능하며 도구로 재생성한다. Aseprite 외부 task staging은 프로젝트 패키지 해시 일치 확인 후 좁게 정리한다. 사용자 fixture/역사 이미지/다른 브랜치·PR은 보호한다.
- 실제 정리: PDF 중간 렌더67,548,222 bytes 제거, 최종 아틀라스 미리보기1개 보존. Aseprite task staging은 .aseprite/JSON 해시 일치 후 제거. 미사용 peer-alpha 파생본만 제거하고 원본/현재 보정본은 보존했다. 삭제 파일은 남은 원본·도구에서 재생성 가능하다.
- 다음 사용자 결정: 본책 첫 학교생활 장의 상세 설계 및 이미지 후보 최종 검토. 승인 후 규칙 테스트→사건/결투→이야기/저장→화면→모션→Godot runtime 순서.
- 신규 제품 자동 테스트, 새 화면 runtime, 모바일/성능/접근성/청감/사람 재미, 최종 권리·출시: NOT_RUN. 과거2153 assertions를 새 기획 PASS로 재사용하지 않는다.
- 원격 작업 브랜치 동기화와 main 병합은 별도다. 이번 main 병합/post-merge readback은 NOT_RUN; 열린 PR을 건드리지 않는다.
