extends RigidBody2D
var firing = false
@export var hurts : bool = true

# Called when the node enters the scene tree for the first time.

		
		
func _ready() -> void:
	while true:
		$AnimatedSprite2D.play("default")
		firing = false
		$CollisionShape2D.set_deferred("disabled", true)
		await get_tree().create_timer(2).timeout
		$AnimatedSprite2D.play("burning")
		$AudioStreamPlayer2D.play(0.26)
		await get_tree().create_timer(0.1).timeout
		firing = true
		$CollisionShape2D.set_deferred("disabled", false)
		await get_tree().create_timer(0.8).timeout
		
		
