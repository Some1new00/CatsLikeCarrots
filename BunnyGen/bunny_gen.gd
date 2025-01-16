class_name BunnyGen
extends CharacterBody2D

@onready var bunterval: Timer = %Bunterval

@onready var world: Node2D = $".."
@export var bunny_spawnable : PackedScene

const SPEED = 300.0
const JUMP_VELOCITY = -400.0




func _ready() -> void:
	await bunterval.timeout.connect(spawn_bunny)
	
var angle_to_player
func _physics_process(delta: float) -> void:
	angle_to_player = get_angle_to(Globals.player_ref.global_position)
	
	
func spawn_bunny():
	var bunny : Bunny = bunny_spawnable.instantiate()
	bunny.rotation = move_toward(rotation, angle_to_player, 0)
	bunny.global_position = global_position
	var temp_pos = Globals.player_ref.global_position
	bunny.set_target(temp_pos)
	get_parent().add_child(bunny)
	

	
