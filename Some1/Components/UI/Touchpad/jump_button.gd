extends Node2D
@onready var button: TouchScreenButton = $Button
@onready var player: Player = $"../Player"
@onready var jump_button: Node2D = $"."


var pressed :bool = false

func _ready() -> void:
	button.action="Jump"
	
func hide_touch_controls():visible = Globals.OSC	

func jump() -> void :		Input.action_release("Jump")
func _on_button_pressed() -> void:		jump()
func _on_button_released() -> void:		jump()
