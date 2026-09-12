extends RefCounted
## Fixed first-chapter event definitions. Each start returns independent state.

const IDS := ["LESSON_HEAT_01", "GREENHOUSE_LEAK_01", "FESTIVAL_LIGHTS_01"]
const TITLES := ["대상을 읽는 수업", "온실: 원인과 잔여 위험", "축제: 안전한 연출 준비"]

func start(event_id: String, attempt_id: String) -> Dictionary:
    if event_id not in IDS or attempt_id.is_empty():
        return {}
    var objects: Dictionary
    match event_id:
        "LESSON_HEAT_01":
            objects = {"vessel": _heat("vessel", "내열 용기"), "sample": _heat("sample", "실습 표본")}
            objects.sample.heat_sensitive = true
        "GREENHOUSE_LEAK_01":
            objects = {"leak": _heat("leak", "누출 장치"),
                "cloud": {"id": "cloud", "label": "부유 꽃가루", "empty": false, "airborne_light": true,
                    "routes": {"receiver": true}, "zone": "air"},
                "receiver": _receiver("receiver", "필터 수집함")}
            objects.leak.merge({"closed": false, "heat_sensitive": true, "blockable_boundary": true,
                "small_leak": true, "boundary_intact": true})
        "FESTIVAL_LIGHTS_01":
            objects = {"lamp": _heat("lamp", "내열 조명 용기"),
                "decorations": _heat("decorations", "종이 장식"),
                "latch": {"id": "latch", "label": "작업 구역 잠금", "closed": false, "blockable_boundary": true},
                "stage": _receiver("stage", "무대 배치점"), "audience": _receiver("audience", "관객 방향")}
            objects.decorations.merge({"light": true, "airborne_light": true, "heat_sensitive": true,
                "empty": false, "location_id": "floor", "routes": {"stage": true, "audience": true}})
            objects.audience.audience = true
    return {"schema": "GRIMOIRE_EVENT_SESSION_1", "event_id": event_id,
        "title": TITLES[IDS.find(event_id)], "outcome": "ONGOING", "consequences": [],
        "hazard": 2 if event_id == "GREENHOUSE_LEAK_01" else 0,
        "cleanup_step": 0, "placement_step": 0, "receipts": {},
        "spell_state": {"schema": "GRIMOIRE_EVENT_CAST_1", "attempt_id": attempt_id, "revision": 0,
            "mana": 6, "elapsed_actions": 0, "receipts": {},
            "learned": ["EMBER", "WIND", "WARD", "GATHER"], "objects": objects}}

func _heat(id: String, label: String) -> Dictionary:
    return {"id": id, "label": label, "heatable": true, "small": true,
        "airflow_movable": true, "boundary": true, "temperature": "cold"}

func _receiver(id: String, label: String) -> Dictionary:
    return {"id": id, "label": label, "blocked": false, "audience": false,
        "capture_ready": true, "capture_load": 0, "capture_capacity": 3, "receiver_open": false}
