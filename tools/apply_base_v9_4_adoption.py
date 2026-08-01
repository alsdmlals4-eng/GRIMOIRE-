#!/usr/bin/env python3
from __future__ import annotations
import json
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
V='9.4.0'; P='a728712cb776ec98f4875914a580fcf7d0156593'; E='ef1fba11167e4da0b298123b0c85ebd268191a42'; F='87a0b54c2847ce4b685879209205957c170cc1cd'; R='693a0dff3f054ecdd653079909e044211473838e73dd9aff07734d1ce5694c59'; B='154c7b020b0c181204c7a395292d74b84f8c20fa'; NEW='optimizing-ai-model-and-prompt-costs'
def load(p): return json.loads((ROOT/p).read_text(encoding='utf-8'))
def save(p,d): (ROOT/p).write_text(json.dumps(d,ensure_ascii=False,indent=2)+'\n',encoding='utf-8')

def adapter():
 p='skills/PROJECT_BASE_ADAPTER.json'; a=load(p); b=a['base_release']; b.update({'version':V,'release_commit':P,'release_evidence_commit':E,'registry_sha256':R}); b['finalization_commit']=F; a['protected_baseline']['commit']=B; a['protected_baseline']['main_sync']='SYNCED_TO_MAIN'
 if NEW not in {x['route_id'] for x in a['routing']['base_routes']}: a['routing']['base_routes'].append({'route_id':NEW,'skill_id':NEW,'status':'ACTIVE'})
 a['routing']['base_routes'].sort(key=lambda x:x['route_id']); a.setdefault('base_v94_contract',{'model_recommendation':'USER_CHANGES_SETTING_AT_CHECKPOINT','provider_measurement':'NOT_RUN','runtime_validation':'NOT_RUN','human_validation':'HUMAN_NOT_RUN'}); save(p,a)

def generator():
 p=ROOT/'tools/generate_project_operating_views.py'; t=p.read_text(encoding='utf-8')
 t=t.replace('"version": "9.3.0"','"version": "9.4.0"').replace('"release_commit": "30ca6c7b5f93521f0eb0eed42d01437cd43c50ae"','"release_commit": "'+P+'"').replace('"release_evidence_commit": "462a86db192d23d0f386281a1eb54b0a8cbad62e"','"release_evidence_commit": "'+E+'"').replace('"registry_sha256": "9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1"','"registry_sha256": "'+R+'"').replace('"release_line": "v9.3.0"','"release_line": "v9.4.0"')
 p.write_text(t,encoding='utf-8')

def docs():
 ag=ROOT/'AGENTS.md'; t=ag.read_text(encoding='utf-8'); t=t.replace('## 4. Base v9.3 계약','## 4. Base v9.4 계약').replace('release: v9.3.0','release: v9.4.0').replace('release_commit: 30ca6c7b5f93521f0eb0eed42d01437cd43c50ae','release_commit: '+P).replace('evidence_commit: 462a86db192d23d0f386281a1eb54b0a8cbad62e','evidence_commit: '+E).replace('registry_sha256: 9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1','registry_sha256: '+R)
 if 'finalization_commit:' not in t: t=t.replace('registry_sha256: '+R,'registry_sha256: '+R+'\nfinalization_commit: '+F,1)
 ag.write_text(t,encoding='utf-8')
 (ROOT/'docs/BASE_RULES_VERSION.md').write_text(f'''# GRIMOIRE Base 규칙 버전

```yaml
base: alsdmlals4-eng/Base
base_version: {V}
base_payload_commit: {P}
base_trusted_evidence_commit: {E}
base_pin_finalization_commit: {F}
base_registry_sha256: {R}
release_state: BASE_RELEASED
project: alsdmlals4-eng/GRIMOIRE-
adoption_scope: OPERATING_CONTRACT_ONLY
product_paths_changed: false
```

`skills/PROJECT_BASE_ADAPTER.json`만 편집 가능한 통합 권위이며 Snapshot·Compatibility View는 `tools/generate_project_operating_views.py` 생성물이다. Base v9.4는 모델·추론·Prompt caching·비용 측정, 지시 권위, Interface-first Prompt, Context 큐레이션, Artifact 주장 상한, Godot UI 모션 계약을 제공한다.

## 보호 경계

- 승인된 코어·Vertical Slice·Art Style·Art Bible·Battle Rules·Asset Spec·잠긴 기준 이미지·Decision ID를 변경하지 않는다.
- `PLANNING_ONLY_PROFILE`, `implementation: NOT_STARTED`, `codex: BLOCKED`, Godot 프로젝트 미생성 상태를 유지한다.
- 세계관·서사·글자 의미·주문 설계·전투 규칙·저장 의미·승인 자산을 발명하거나 바꾸지 않는다.
- Sheet는 승인 정본 즉시 동기화 정책을 유지하지만 이 적용에서는 쓰지 않는다.
- Godot·PC/Mobile 입력·사람·provider 비용 검증은 `NOT_RUN` 또는 `HUMAN_NOT_RUN`이다.
''',encoding='utf-8')
 (ROOT/'docs/AI_WORKFLOW.md').write_text(f'''# GRIMOIRE AI·GitHub 작업 흐름

- `[모델 추천]`은 난도·실패 비용·재작업 위험으로 모델과 추론 단계를 제안한다. 실제 설정은 사용자가 변경하고 다음 checkpoint부터 적용한다.
- 승인 Decision·저장 호환성·데이터 무결성·잠긴 아트·불가역 변경은 `HARD_CONSTRAINT`다.
- 일반 기술 구조는 `RECOMMENDED_DEFAULT`, 비파괴 표현 초안은 `JUDGMENT_SPACE`다.
- Prompt는 `problem / player_or_user_value / inputs / authority_and_source / output_contract / invariants / failure_conditions / validation`의 Interface-first 계약을 사용한다.
- `Example-as-Fixture`: 예시는 정상·실패·경계·회귀 Fixture 또는 Golden Set이며 정본 권위가 아니다.
- Context는 `decision_question / include_criteria / exclude_criteria / authority_level / freshness / known_conflicts / progressive_load_trigger / refresh_trigger`를 기록한다.
- 반대 근거·실패 경로·세계 규칙·승인 Decision·잠긴 시각 기준을 큐레이션에서 제거하지 않는다.
- 화면·Schema·Fixture는 실제 Godot 런타임·사람 이해·성능을 자동 증명하지 않는다. 미실행 자동 검증은 `NOT_RUN`, 사람 검증은 `HUMAN_NOT_RUN`이다.

Base identity: `{P}` / `{E}` / `{R}`.
''',encoding='utf-8')
 ux=ROOT/'docs/UX_UI_SYSTEM.md'; u=ux.read_text(encoding='utf-8').replace('Base content commit: `0fd95f4513343e77fd664af2763a01b02f52545b`  ',f'Base content commit: `{P}`')
 if '## 7A. UI 모션·중단·반복 계약' not in u:
  b='''## 7A. UI 모션·중단·반복 계약

```text
입력 접수 → 처리 중 → 도메인 결과 확정 → 결과 표현
```

- 글자 작성·후보 선택·주문 조립·발동·결과·마도서 기록 모션은 중단과 즉시 완료 경로를 가진다.
- 빠른 반복·재진입에서 stroke·후보·비용·불안정도·결과·기록이 중복되지 않아야 한다.
- `AnimationPlayer`·`Tween` 완료 signal은 인식·문법·비용·전투·저장·기록 결과의 권위 시점이 아니다.
- `Reduced Motion`, `mute`, `haptic-off`에서도 인식 상태·오류 종류·비용·위험·결과 원인·다음 행동을 보존한다.
- 실제 입력·인식·PC/Mobile 성능·사람 이해는 `NOT_RUN` / `HUMAN_NOT_RUN`으로 유지한다.

'''; u=u.replace('## 8. 검증 매트릭스',b+'## 8. 검증 매트릭스',1)
 ux.write_text(u,encoding='utf-8')
 ac=ROOT/'docs/ACTIVE_CONTEXT.md'; t=ac.read_text(encoding='utf-8')
 if '## Base v9.4 운영 계약' not in t: t=t.rstrip()+f'''\n\n## Base v9.4 운영 계약\n\n- Base `{V}` payload/evidence를 adapter와 생성기에 적용했다.\n- 승인 기획·아트·전투·Asset Spec·Sheet 내용과 제품 구현 상태는 변경하지 않는다.\n- 런타임·입력·사람·provider 검증은 `NOT_RUN` 또는 `HUMAN_NOT_RUN`이다.\n'''
 ac.write_text(t,encoding='utf-8')
 dm=ROOT/'docs/DOCUMENTATION_MAP.md'; t=dm.read_text(encoding='utf-8')
 if '2026-08-01_BASE_V9_4_ADOPTION_AUDIT' not in t: t=t.rstrip()+'''\n\n## Base v9.4 운영 계약\n\n- `docs/AI_WORKFLOW.md`: 모델 추천·지시 권위·Context 큐레이션·증거 상한.\n- `docs/reviews/2026-08-01_BASE_V9_4_ADOPTION_AUDIT.md`: Base identity와 승인 정본 보호 감사.\n'''
 dm.write_text(t,encoding='utf-8')
 ap=ROOT/'docs/reviews/2026-08-01_BASE_V9_4_ADOPTION_AUDIT.md'; ap.parent.mkdir(parents=True,exist_ok=True); ap.write_text(f'''# Base v9.4 적용 감사 — GRIMOIRE

```yaml
decision_id: DEC-2026-08-01-001
issue: 25
baseline_commit: {B}
base_version: {V}
base_payload: {P}
base_evidence: {E}
base_finalization: {F}
base_registry_sha256: {R}
adoption_scope: OPERATING_CONTRACT_ONLY
product_paths_changed: false
gdd_sheet_written: false
runtime_validation: NOT_RUN
human_validation: HUMAN_NOT_RUN
```

프로젝트 Skill 2개, 승인 코어·Vertical Slice·Art Style/Bible·Battle Rules·Asset Spec·잠긴 기준 이미지·PLANNING_ONLY_PROFILE을 보존한다. Context 큐레이션은 반대 근거·실패 경로·승인 Decision을 제거하지 않으며 UI 모션은 인식·문법·비용·전투·저장·기록 결과의 권위가 아니다.
''',encoding='utf-8')

def tests():
 p=ROOT/'tests/test_base_v9_adoption.py'; t=p.read_text(encoding='utf-8').replace('BaseV93AdoptionTests','BaseV94AdoptionTests').replace('test_canonical_adapter_pins_base_v93','test_canonical_adapter_pins_base_v94').replace('"9.3.0"','"9.4.0"').replace('"30ca6c7b5f93521f0eb0eed42d01437cd43c50ae"','"'+P+'"').replace('"462a86db192d23d0f386281a1eb54b0a8cbad62e"','"'+E+'"').replace('"9847bb2b225c776ad7916930f0f48c490bc2a898bea8e02ea1fdd0e6caac60c1"','"'+R+'"').replace('"v9.3.0"','"v9.4.0"'); p.write_text(t,encoding='utf-8')
 (ROOT/'tests/test_base_v94_ai_operations_adoption.py').write_text(f'''from __future__ import annotations
import json,unittest
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
class TestBaseV94Grimoire(unittest.TestCase):
 def test_identity_routes_and_state(self):
  a=json.loads((ROOT/'skills/PROJECT_BASE_ADAPTER.json').read_text(encoding='utf-8')); self.assertEqual('{V}',a['base_release']['version']); self.assertEqual('{P}',a['base_release']['release_commit']); self.assertEqual('{E}',a['base_release']['release_evidence_commit']); self.assertEqual('{R}',a['base_release']['registry_sha256']); self.assertIn('{NEW}',{{x['route_id'] for x in a['routing']['base_routes']}}); self.assertEqual({{'magic-writing-recovery','art-style-decision-gate'}},{{x['route_id'] for x in a['routing']['project_routes']}}); self.assertEqual('PLANNING_ONLY_PROFILE',a['project']['execution_profile']); self.assertEqual('NOT_STARTED',a['current_state']['implementation'])
 def test_contracts(self):
  ai=(ROOT/'docs/AI_WORKFLOW.md').read_text(encoding='utf-8'); ux=(ROOT/'docs/UX_UI_SYSTEM.md').read_text(encoding='utf-8'); audit=(ROOT/'docs/reviews/2026-08-01_BASE_V9_4_ADOPTION_AUDIT.md').read_text(encoding='utf-8')
  for x in ('[모델 추천]','HARD_CONSTRAINT','Interface-first','Example-as-Fixture','refresh_trigger','NOT_RUN'): self.assertIn(x,ai)
  for x in ('입력 접수','처리 중','중단','즉시 완료','빠른 반복','재진입','Reduced Motion','mute','haptic-off','권위 시점'): self.assertIn(x,ux)
  self.assertIn('product_paths_changed: false',audit); self.assertIn('HUMAN_NOT_RUN',audit)
if __name__=='__main__': unittest.main()
''',encoding='utf-8')
adapter(); generator(); docs(); tests()
