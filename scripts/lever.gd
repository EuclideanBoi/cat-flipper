extends Node2D

@export var flipped : bool
@export var mouseobject : StaticBody2D

var mouseentered = false
var mouseclicked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var degrees = $Handle.rotation_degrees 
	if degrees > 40:
		if flipped == false:
			flipped = true
			$LeverSFX.pitch_scale = 2
			$LeverSFX.play(0.4)
	elif degrees < -4:
		if flipped == true:
			flipped = false
			$LeverSFX.pitch_scale = 1
			$LeverSFX.play(0.4)
	
		#$Handle.linear_velocity = $Handle.global_position - get_global_mouse_position()

func _input(event):
	
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed() and mouseentered:
				mouseclicked = true
				$GrabPinJoint.global_position = get_global_mouse_position()
				$GrabPinJoint.node_b = mouseobject.get_path()
			else:
				mouseclicked = false
				$GrabPinJoint.node_b = NodePath("")


func _on_handle_mouse_entered() -> void:
	mouseentered = true


func _on_handle_mouse_exited() -> void:
	mouseentered = false
