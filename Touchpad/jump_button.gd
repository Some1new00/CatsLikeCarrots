extends Node2D
@onready var button: TouchScreenButton = $Button
@onready var player: Player = $"../Player"
@onready var jump_button: Node2D = $"."


var pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	button.action="Jump"
	
func hidea():
	visible = Globals.OSC

	# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_button_pressed() -> void:
	Input.action_press("Jump")

func _on_button_released() -> void:
	Input.action_release("Jump")
