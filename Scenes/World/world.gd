extends Node2D

@export var end_scn : PackedScene = preload("res://Scenes/End/end.tscn")
@onready var game_win: Timer = $GameWin


@export var level_start_pos : Node2D

@export var level_duration :float = 89.99

func _ready() -> void:
	game_win.start(level_duration)
	get_tree().call_group("ctrls", "hide_touch_controls")
	await game_win.timeout.connect(_game_has_won)
	Engine.time_scale = 1
	
func _game_has_won() -> void:
	get_tree().change_scene_to_file(end_scn.resource_path)

func _physics_process(delta: float) -> void:
	print("Time:", str(game_win.time_left))
