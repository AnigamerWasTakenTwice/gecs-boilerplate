extends System
class_name RotationSystem

# This is a Query! It tells the system what entities or components to act on.
# Since we don't need entity access, this query tells the system to operate on every Transform component.
func query() -> QueryBuilder:
	return q.iterate([C_Transform2D])

# This is the process function, where the logic happens! This just loops through the components the Query fetched, and makes them rotate by delta.
func process(entities: Array[Entity], components: Array, delta: float) -> void:
	for c in components[0]:
		var transform = c as C_Transform2D
		transform.rotation_rad += delta
