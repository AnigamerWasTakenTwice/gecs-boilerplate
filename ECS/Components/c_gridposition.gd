extends Component
class_name C_GridPosition

const CELL_SIZE = Vector2i(128, 128)
@export var grid_pos:Vector2:
	set(p):
		emit_signal("property_changed", self, "grid_pos", grid_pos, p)
		grid_pos = p
