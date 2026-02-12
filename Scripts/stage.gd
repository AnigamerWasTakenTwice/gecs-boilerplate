# Welcome one and all!
# Each stage is a scene that orchestrates the ECS world.
extends Node2D

@onready var world = $World

# This just loads all of the entity prefabs and stores them in a convenient place.
const ENTITIES = {
	"entity_2d": preload("res://ECS/Entities/entity_2d/entity_2d.tscn")
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	world.add_entity(ENTITIES.entity_2d.instantiate())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	world.process(delta)
	pass
