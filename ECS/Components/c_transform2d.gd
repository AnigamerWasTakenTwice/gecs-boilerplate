class_name C_Transform2D
extends Component

# Welcome to the Components! These are the blocks of data that are operated on by systems.
# This component represents 2d transforms, allowing you to modify position, rotation, and scale through ECS.

# Observers (for some sad reason) don't observe property changes by default. You have to emit them with a setter.
# Also, for some odd reason, you have to export every variable. No clue why.
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

# This allows you to set if you want the position to be set through the component or through the entity's position itself.
@export var programmatic_setup = false

# Remember to have an Init Function so you can instantiate the component through code!
# Every param must be optional.
func _init(prg: bool = false, pos: Vector2 = Vector2.ZERO, rad:float = 0, size:Vector2 = Vector2.ONE) -> void:
	position = pos
	rotation_rad = rad
	scale = size
	programmatic_setup = prg
