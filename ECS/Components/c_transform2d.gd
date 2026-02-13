class_name C_Transform2D
extends Component

# Welcome to the Components! These are the blocks of data that are operated on by systems.
# This component represents 2d transforms, allowing you to modify position, rotation, and scale through ECS.

@export var position: Vector2:
	set(p):
		emit_signal("property_changed", self, "position", position, p)
		position = p
@export var rotation_rad: float:
	set(p):
		emit_signal("property_changed", self, "rotation_rad", rotation_rad, p)
		rotation_rad = p
@export var scale: Vector2:
	set(p):
		emit_signal("property_changed", self, "scale", scale, p)
		scale = p

@export var programmatic_setup = false

# This allows you to set 
func _init(prg: bool = false, pos: Vector2 = Vector2.ZERO, rad:float = 0, size:Vector2 = Vector2.ONE) -> void:
	position = pos
	rotation_rad = rad
	scale = size
	programmatic_setup = prg
