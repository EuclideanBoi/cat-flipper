extends RigidBody2D


@export var mouseobject : StaticBody2D

var mouseentered = false
var mouseclicked = false

var clickpositionoffset

var clamp = 2000



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var velocity = linear_velocity.length()
	var rotationd = abs(rotation_degrees) 
	if mouseclicked:
		var distance = (global_position - get_global_mouse_position()).length()

		if distance > 500:
			mouseclicked = false
			$PinJoint2D.node_b = NodePath("")


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.is_pressed() and mouseentered:
				mouseclicked = true
				$GrabSFX.play(0.3)
				clickpositionoffset = get_global_mouse_position()
		
				$PinJoint2D.global_position = clickpositionoffset
				$PinJoint2D.node_b = mouseobject.get_path()
				
			
			else:
				mouseclicked = false
				$PinJoint2D.node_b = NodePath("")

func _on_mouse_entered() -> void:
	mouseentered = true


func _on_mouse_exited() -> void:
	mouseentered = false


	
