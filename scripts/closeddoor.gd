extends StaticBody2D
@export var lever: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lever and lever.flipped:
		$Sprite2D.modulate.a = 0.5
		$CollisionShape2D.set_deferred("disabled", true)
	else:
		$Sprite2D.modulate.a = 1
		$CollisionShape2D.set_deferred("disabled", false)
