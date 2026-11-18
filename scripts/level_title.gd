extends Control
@export var title: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = title
	await get_tree().create_timer(3.0).timeout
	var tween = get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 3.0)
