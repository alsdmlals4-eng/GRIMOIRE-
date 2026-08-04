class_name GlyphResourceTypes
extends RefCounted

enum Source { UNIVERSAL_STOCK, VAULT }
enum VaultSlotState { EMPTY, AVAILABLE, RESERVED, RESERVED_FOR_SCRIBE }

static func reservation_id(
    transaction_id: StringName,
    node_id: StringName,
    source: int
) -> StringName:
    return StringName("%s:%s:%d" % [transaction_id, node_id, source])
