extends Control
@onready var start_button: Button = $StartButton
@onready var touch_controls: Button = %"Touch Controls"

@export var load_target_scene : PackedScene

func _ready() -> void:
	start_button.pressed.connect(load_scene)
	touch_controls.pressed.connect(toggle_touch_controls)


# _input is slightly better than waiting in _process. 
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Jump"): load_scene()


## Toggles Touch controls for the next round
func toggle_touch_controls()->void:
	Globals.OSC = touch_controls.button_pressed
	$RichTextLabel2.visible = Globals.OSC

## Load a target scene
func load_scene()-> void: get_tree().change_scene_to_file(load_target_scene.resource_path)
