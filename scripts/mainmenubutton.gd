extends TextureButton
var prrr = false

# Called when the node enters the scene tree for the first time.

func _on_pressed() -> void:
	if not prrr:
		$Splat.play()
		prrr = true
		await get_tree().create_timer(0.6).timeout
		get_tree().change_scene_to_file("res://scenes/levelone.tscn") 
	
