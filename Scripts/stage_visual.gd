extends Node2D

@onready var world = $World

func _process(delta: float) -> void:
	world.process(delta)
