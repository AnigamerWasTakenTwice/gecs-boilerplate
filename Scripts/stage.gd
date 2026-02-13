# "Welcome one and all!"
# Welcome to the GECS Boilerplate project! Look around, i've profusely commented everything!
# Ctrl + Click is your friend, friend!

# Each scene that uses ECS should usually have 3 things:
# Not ECS Stuff(tm)
# The World Node
# and a script to set up the world node if done programmatically.

# This script programmatically sets up the world node.
# Why? Because I think programmatically defined scenes and entities are cool.
# But you don't have to! GECS provides ways to use the editor to set things up. 
# Check out "stage_visual.tscn" for info.

extends Node2D

@onready var world = $World

# This just loads all of the entity prefabs and stores them in a convenient place. This probably should be in a Global Autoload.
const ENTITIES = {
	"entity_2d": preload("res://ECS/Entities/entity_2d/entity_2d.tscn"),
	"entity_prefab": preload("res://ECS/Entities/entity_prefab/entity_prefab.tscn")
}


func _ready() -> void:
	# Waow! Systems! Add them to make them process your game!
	world.add_system(RotationSystem.new())
	# Observers are alternative systems that track specific components and run functions when they're changed.
	# Good for things like UI that have to react to changes instead of make changes like Systems.
	world.add_observer(SpriteSyncObserver.new())
	world.add_observer(TransformSyncObserver.new())
	
	
	# This is an entity being programmatically made, with Components being tied to them through a manual array.
	world.add_entity(ENTITIES.entity_2d.instantiate(), [
		C_Transform2D.new(true, Vector2(30, 30)),
		C_Sprite.new(load("res://icon.svg"), Color(1, 1, 1))
	])
	
	# And this is an entity being made through a prefab!
	world.add_entity(ENTITIES.entity_prefab.instantiate())
	
	# The components within entity prefabs can also be overwritten. Useful for positioning!
	world.add_entity(ENTITIES.entity_prefab.instantiate(), [
		C_Transform2D.new(true, Vector2(500, 500))
	])
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# IMPORTANT!!! VERY IMPORTANT!! This is what makes your systems run, and therefore is what makes your game HAPPEN!
	world.process(delta) 
	pass
