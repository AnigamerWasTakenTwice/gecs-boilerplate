extends Observer
class_name TransformSyncObserver

# This is the Watch function! It's a required function asking what this observer is observing changes in.
# In this case, the component we want to watch is the Transform2D.
func watch() -> Resource:
	return C_Transform2D

# By default, this function just syncs the Transform2D component with the actual properties of the entity.
# But, if you set programmatic setup, the entity will be moved, scaled, and rotated based on the Transform2D
func on_component_added(entity: Entity, component: Resource) -> void:
	var transform = component as C_Transform2D
	if transform.programmatic_setup:
		entity.position = transform.position
		entity.rotation = transform.rotation_rad
		entity.scale = transform.scale
	else:
		transform.position = entity.position
		transform.rotation_rad = entity.rotation
		transform.scale = entity.scale

# This just syncs the node's position, size, and rotation with the Transform2D component.
func on_component_changed(
	entity: Entity, component: Resource, property: String, new_value: Variant, old_value: Variant
) -> void:
	var transform = component as C_Transform2D
	entity.position = transform.position
	entity.rotation = transform.rotation_rad
	entity.scale = transform.scale
