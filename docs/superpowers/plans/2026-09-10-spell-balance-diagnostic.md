# Shared Spell Balance Diagnostic Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task in the current task. Do not dispatch agents without applicable authorization. Steps use checkbox (`- [x]`) syntax for tracking.

**Goal:** 공통 규칙의 제한 산술 결과를 재현하고 적법 손패별 선택 가능성을 검사한다. 최종 균형·승률·재미 판정은 하지 않는다.

**Architecture:** 제품과 분리된 표준 라이브러리 진단 모듈 하나와 unittest 하나를 둔다. 수치 owner는 공통 규칙 문서이며 모듈에 출처 절과 diagnostic-only 상태를 명시한다. 결과는 기존 owner 17절에 반영한다. 새 앱·대시보드·영구 보고서 생성기는 만들지 않는다.

**Tech Stack:** 로컬 Python 3, itertools, unittest. 추가 설치 없음. Godot 코드/저장 스키마/이미지 변경 없음.

**Spec:** `docs/superpowers/specs/2026-09-10-shared-spell-rules-design.md` 12, 15.1, 16, 17절.

## Global Constraints

- 현재 수치 BALANCE_REWORK_REQUIRED. 진단 상수는 제품 채택이 아니다.
- 실행 전 current authority, 실제 Python 명령 경로, 기존 도구 중복 여부를 재확인한다.
- 현재 사용자 fixture, 기존 저장, 이미지, 모든 unrelated Draft PR은 수정하지 않는다.
- 순환/정돈/승패/지속 해소 전체 구현은 이 작은 계획에서 제외한다. 다음 전체 매치 계획은 이 결과를 입력으로 별도 작성한다.
- 미래 드로우를 알고 고르는 정책을 만들지 않는다. 아래 검사는 현재 손패에서 첫 행동 가능 여부만 세며 두 번째 손패의 도달성을 보장하지 않는다.
- 각 task 뒤 해당 두 파일만 확인해 별도 commit. 마지막 branch push/readback, main 직접 push 금지.

## Files and interfaces

- Create `tools/spell_balance_diagnostic.py`: `damage(attack: int, guard: int) -> int`, `focus_pair(shields: tuple[int, int]) -> tuple[int, int]`, `opening_counts() -> dict[str, int]`. 부작용·파일 출력·난수 없음.
- Create `tests/test_spell_balance_diagnostic.py`: unittest regression, 모듈 import는 `from tools.spell_balance_diagnostic import ...`.
- Update 기존 rules 17절과 `docs/ACTIVE_CONTEXT.md`: 실행 명령/실제 결과/미검증 경계만 교정.

## Task 1: Non-negative damage and nine arithmetic cases

- [x] 아래 테스트를 작성한다. 명령 `python -m unittest discover -s tests -p test_spell_balance_diagnostic.py -v`를 실행해 모듈 없음으로 실패하는지 확인한다. 다른 실패면 먼저 원인을 분리한다.

```python
import unittest
from tools.spell_balance_diagnostic import damage, focus_pair

class ArithmeticTests(unittest.TestCase):
    def test_heat_boundaries(self):
        self.assertEqual([(damage(h, 4), damage(h, 5)) for h in (3, 4, 5, 6)],
                         [(0, 0), (0, 0), (1, 0), (2, 1)])
    def test_shield_suppression(self):
        self.assertEqual([(damage(3, s), damage(3, max(0, s-3))) for s in (0, 3)],
                         [(3, 3), (0, 3)])
    def test_focus_pair(self):
        self.assertEqual([focus_pair(s) for s in ((0, 3), (3, 0), (0, 0))],
                         [(1, 3), (4, 3), (4, 6)])
```

- [x] 최소 구현:

```python
def damage(attack: int, guard: int) -> int:
    return max(0, attack - guard)

def focus_pair(shields: tuple[int, int]) -> tuple[int, int]:
    return (damage(4, shields[1]),
            damage(3, shields[0]) + damage(3, shields[1]))
```

- [x] 같은 명령으로 3 test methods 통과를 확인한다. 9사례와 test method 수를 혼동하지 않는다. 각 함수 docstring에 비음수 내부 진단 입력 전용·생존 미모델링을 명시한다.
- [x] 두 새 파일만 diff 검토 후 commit한다.

## Task 2: Opening-hand eligibility, not win probability

- [x] 테스트 import에 `opening_counts` 추가, 아래 method를 추가하고 누락 함수 실패를 확인한다.

```python
def test_opening_counts(self):
    self.assertEqual(opening_counts(), {
        'total': 70, 'no_direct_glyph': 1,
        'gather_and_ember': 41, 'two_embers': 15})
```

- [x] 다음 최소 구현을 추가한다. 중복 물리 카드를 index로 구분하고 종류별 축약 손패를 균등분포로 오인하지 않는다.

```python
from itertools import combinations

def opening_counts() -> dict[str, int]:
    deck = ('EMBER', 'EMBER', 'WIND', 'WIND',
            'WARD', 'WARD', 'GATHER', 'GATHER')
    rows = [tuple(deck[i] for i in ids) for ids in combinations(range(8), 4)]
    return {
        'total': len(rows),
        'no_direct_glyph': sum('EMBER' not in h and 'WIND' not in h for h in rows),
        'gather_and_ember': sum('GATHER' in h and 'EMBER' in h for h in rows),
        'two_embers': sum(h.count('EMBER') == 2 for h in rows),
    }
```

- [x] 같은 unittest 명령으로 4 methods 통과 확인. `41`과 `15`는 중첩 가능 집합이며 상호배타 확률이 아님을 기록한다. 초기 손패가 미래 시전을 보장하지 않는다는 주석을 추가한다.
- [x] 해당 두 파일만 commit한다.

## Task 3: Evidence and stop boundary

- [x] 전체 새 unittest 실행, `git diff --check`, 프로젝트 operating-contract validator를 실행한다. 실제 성공/실패 수와 stderr를 읽는다.
- [x] rules 17절과 Active Context에 증거를 기록한다. 기존 Godot suite는 제품 무변경이라 미실행이라고 명시하고 새 규칙 runtime PASS로 바꾸지 않는다.
- [x] 5회 전체 범위 자체 검토: 수치 owner, 손패 분포, 정책 정보 경계, 소비/저장 비모델링, 제품/진단 증거 분리. 수정 뒤 재검사한다.
- [x] 문서만 별도 commit 후 현재 branch push/fetch/readback. 기존 dirty fixture와 main 상태를 보고한다.
- [x] 다음 계획 입력은 제한 결과와 누락 목록이다: 적법 매 교환 손패, 드로우/정돈, 생존/조기 종료, 만료, 동시 승패, 재개 동일성. 이 여섯 항목 없이 승률·전략 우세·최종 수치를 발표하지 않는다.

## Plan self-review

2026-09-12 계획 실행 완료: 체크박스는 이번 실행을 반영한다. 4 test methods PASS, RED→GREEN 확인, 순수 진단만 구현했다. 도구 내 9사례 산술 실행은 rules 17절이 소유한다. 41/15는 구현 테스트의 기대값이며 계획 작성 시 NOT_RUN이었으나 현재 PASS다. 공통 이벤트 엔진과 UI까지 이 계획에 묶지 않는다.
