extends AnimatableBody2D
@export var position1: Vector2 = Vector2(0,0)


@export var duration : float = 1.0



func _ready() -> void:
	var tween = create_tween().set_loops().set_parallel(false)
	tween.tween_property(self, "position", position + position1, duration)
	tween.tween_property(self, "position", position, duration)
