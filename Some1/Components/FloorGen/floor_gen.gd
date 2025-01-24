class_name FloorGen
extends CharacterBody2D
var speed = 500
var facing_right = true

@onready var interval: Timer = %Interval
@export var target_spawnable : PackedScene
@export var target_spawnable2 : PackedScene
@export var target_spawnable3 : PackedScene
@export var target_spawnable4 : PackedScene
@export var target_spawnable5 : PackedScene
@export var target_spawnable6 : PackedScene

func _ready():
	await interval.timeout.connect(spawn_platform)


func spawn_platform():
	var ranfloor = randi_range(1,6)
	print(ranfloor)
	var platform : Floor = target_spawnable.instantiate()
	var platform2 : Floor2 = target_spawnable2.instantiate()
	var platform3 : Floor3 = target_spawnable3.instantiate()
	var platform4 : Floor4 = target_spawnable4.instantiate()
	var platform5 : Floor5 = target_spawnable5.instantiate()
	var platform6 : Floor6 = target_spawnable6.instantiate()
	if ranfloor == 1:
		platform.global_position = global_position
		platform.scale.x = randf_range(1,3)
		get_parent().add_child(platform)
	if ranfloor == 2:
		platform2.scale.x = 1.3
		platform2.scale.y = 1.3
		platform2.global_position = global_position
		get_parent().add_child(platform2)
	if ranfloor == 3:
		platform3.scale.x = 1.3
		platform3.scale.y = 1.3
		platform3.global_position = global_position
		get_parent().add_child(platform3)
	if ranfloor == 4:
		platform4.scale.x = 1.3
		platform4.scale.y = 1.3
		platform4.global_position = global_position
		get_parent().add_child(platform4)
	if ranfloor == 5:
		platform5.scale.x = 1.3
		platform5.scale.y = 1.3
		platform5.global_position = global_position
		get_parent().add_child(platform5)
	if ranfloor == 6:
		platform6.scale.x = 1.3
		platform6.scale.y = 1.3
		platform6.global_position = global_position
		get_parent().add_child(platform6)
#func spawn_platform():
	#var platform : Floor 
	#platform.scale.x = randf_range(1,10)
	#platform.global_position = global_position
	#get_parent().add_child(platform)
	
	
func _physics_process(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	if !$RayCast2D.is_colliding() and is_on_floor():
		flip()
	velocity.x = speed
	move_and_slide()
	
func flip():
	facing_right = !facing_right
	scale.x =abs(scale.x) * -1
	if facing_right:
		speed = abs(speed)
	else:
		speed = abs(speed) * -1
		
