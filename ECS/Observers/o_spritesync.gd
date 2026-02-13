extends Observer
class_name SpriteSyncObserver

# This is the Watch function! It's a required function asking what this observer is observing changes in.
# In this case, the component we want to watch is the Sprite.
func watch() -> Resource:
	return C_Sprite

# These functions help sync the "Sprite" component with what's actually in the scene tree.
func on_component_added(entity: Entity, component: Resource) -> void:
	var spr = component as C_Sprite
	if spr.sprite_ref == NodePath():
		var spr_node = Sprite2D.new()
		spr_node.texture = spr.texture
		spr_node.modulate = spr.modulate
		entity.add_child(spr_node)
		spr.sprite_ref = entity.get_path_to(spr_node)
	else:
		var spr_node = entity.get_node(spr.sprite_ref)
		spr_node.texture = spr.texture
		spr_node.modulate = spr.modulate

@warning_ignore("unused_parameter")
func on_component_changed(
	entity: Entity, component: Resource, property: String, new_value: Variant, old_value: Variant
) -> void:
	var spr = component as C_Sprite
	var spr_node = get_node(spr.sprite_ref)
	spr_node.texture = spr.texture
	spr_node.modulate = spr.modulate

@warning_ignore("unused_parameter")
func on_component_removed(entity: Entity, component: Resource) -> void:
	var spr = component as C_Sprite
	get_node(spr.sprite_ref).queue_free()
