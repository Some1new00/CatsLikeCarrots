extends Node2D
@onready var game_win: Timer = $GameWin
@export var level_start_pos : Node2D


func _ready() -> void:
	get_tree().call_group("ctrls", "hidea")
	await game_win.timeout.connect(_game_has_won)
	Engine.time_scale = 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _game_has_won() -> void:
	get_tree().change_scene_to_file("res://End/end.tscn")
