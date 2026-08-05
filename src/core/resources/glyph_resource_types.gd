class_name GlyphResourceTypes
extends RefCounted

enum Source { UNIVERSAL_STOCK, VAULT }

# Source value 0 is retained for save compatibility. New active star-circuit
# runtime treats it as typed glyph stock; the old enum name is legacy only.
const TYPED_STOCK: int = Source.UNIVERSAL_STOCK

enum VaultSlotState { EMPTY, AVAILABLE, RESERVED, RESERVED_FOR_SCRIBE }

static func reservation_id(
    transaction_id: StringName,
    node_id: StringName,
    source: int
) -> StringName:
    return StringName("%s:%s:%d" % [transaction_id, node_id, source])
