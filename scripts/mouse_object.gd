extends StaticBody2D


func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = get_global_mouse_position()
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$MouseSprite.play("closed")
	else:
		$MouseSprite.play("open")
