extends Control
@onready var restarttimer: Timer = %restarttimer
@onready var restart_button: Button = $Restart_Button


func _ready() -> void:
	await restarttimer.timeout.connect(_on_restart_button_visibility_changed)

func _on_restart_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Title/title_screen.tscn")
	
func _on_restart_button_visibility_changed() -> void:
	$Restart_Button.visible = true
func _process(delta: float) -> void:
	await get_tree().create_timer(6).timeout
	if Input.is_action_just_pressed("Jump"):
		_on_restart_button_pressed()
	else:
		pass
