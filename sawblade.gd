extends RigidBody2D
@export var hurts : bool = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Sprite2D.rotation_degrees += delta * -600
