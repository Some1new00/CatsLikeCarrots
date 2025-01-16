extends Control
@onready var start_button: Button = $StartButton
@onready var touch_controls: Button = %"Touch Controls"




	

func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://World/world.tscn")
	pass # Replace with function body.
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Jump"):
		_on_start_button_pressed()
	else:
		pass


func _on_touch_controls_pressed() -> void:
	Globals.OSC = touch_controls.button_pressed
	$RichTextLabel2.visible = Globals.OSC
	print("pressed")
