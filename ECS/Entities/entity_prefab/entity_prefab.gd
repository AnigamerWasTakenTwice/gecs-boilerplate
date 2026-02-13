@warning_ignore("missing_tool")
extends Entity
class_name Entity2D

# Entities by default are Nodes, NOT Node2Ds or Node3Ds.
# This means they don't have positional data.
# This fixes that, by making a Node2D extend Entity!

# This is an Entity defined entirely through the editor, 
# with child nodes added like any normal Godot scene and components
# added through the "Component Resources" property in the editor.
# This script's kinda just here for explanation's sake, lol.

#you can also add components through a script using the "define components" function!
#func define_components() -> Array:
	#[
		#blah,
		#blah,
		#blaaaahhhhh
	#]
