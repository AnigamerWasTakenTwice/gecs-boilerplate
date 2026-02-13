extends Component
class_name C_Sprite

# Welcome to the Components! These are the blocks of data that are operated on by systems.
# This component is a translation of the Sprite node, allowing you to create and modify a sprite through ECS.

# Observers (for some sad reason) don't observe property changes by default. You have to emit them with a setter.
# Also, for some odd reason, you have to export every variable. No clue why.
@export var sprite_ref: NodePath
@export var texture: Texture:
	set(p):
		emit_signal("property_changed", self, "texture", texture, p)
		texture = p
@export var modulate: Color:
	set(p):
		emit_signal("property_changed", self, "modulate", modulate, p)
		modulate = p

# Remember to have an Init Function so you can instantiate the component through code!
# Every param must be optional.
func _init(tx: Texture = load("res://icon.svg"), md: Color = Color.WHITE):
	texture = tx
	modulate = md
