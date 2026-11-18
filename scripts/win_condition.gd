
extends Node2D
@export var cats: Array[RigidBody2D] = []
@export var confettiscene : PackedScene
@export var nextlevel : String

var win = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var shouldwin = true
	for cat in cats:
		if cat.flipped == false:
			shouldwin = false
		if cat.has_node("Camera2D"):
			
			global_position = cat.get_node("Camera2D").global_position + Vector2(-337,-278)
			
	if shouldwin and win == false:
		win = true
		
		$ConfettiSFX.play()
		var particles = confettiscene.instantiate()
		add_child(particles)
		particles.global_position = Vector2(326.0,150.0)
		particles.get_node("GPUParticles2D").emitting = true
		
		var tween = get_tree().create_tween()
		
		$WinTexture.scale = Vector2.ZERO
		tween.tween_property($WinTexture, "scale", Vector2(1,1), 1.0)
		$WinTexture.visible = true
		$NextButton.visible = true

var prrr = false


func _on_texture_button_pressed() -> void:
	if not prrr:
		$Splat.pitch_scale = randf_range(1.8,2.2)
		$Splat.play()
		prrr = true
		await get_tree().create_timer(0.6).timeout
		get_tree().change_scene_to_file(nextlevel) 
	
