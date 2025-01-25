class_name Player
extends CharacterBody2D

var facing_right = true

@onready var joystick: Node2D = $"../Joystick"


var player_death = 0
@onready var player_sprite = $Sprite2D
@onready var stage_start: Node2D = $"../StageStart"
@onready var death_sfx: AudioStreamPlayer2D = $DeathSFX
@onready var game_over_sfx: AudioStreamPlayer2D = $"../GameOverSFX"
@onready var background_music: AudioStreamPlayer2D = $"../BackgroundMusic"
@onready var jump_sfx: AudioStreamPlayer2D = $JumpSFX
@onready var hud_3: Sprite2D = $"../CanvasLayer/Hud3"
@onready var hud_2: Sprite2D = $"../CanvasLayer/Hud2"
@onready var hud_1: Sprite2D = $"../CanvasLayer/Hud1"
@onready var hud_4: Sprite2D = $"../CanvasLayer/Hud-4"
@onready var area2d: Area2D = %Area2D
const SPEED = 190.0
const speed = 190.0

const JUMP_VELOCITY = -500.0
var can_control : bool = true
var bounce = -600
var motion = Vector2()
func _ready() -> void:
	Globals.player_ref = self as Player

func turn():
	if velocity.x < 0:
		player_sprite.flip_h = true
	if velocity.x > 0:
		player_sprite.flip_h = false
	
func handle_danger() -> void:
	visible = false
	print("Player Died!")	
	can_control = false
	death_sfx.play()
	player_death += 1
	if player_death >= 4:
		background_music.stop()
		game_over_sfx.play()
		var tween = get_tree().create_tween()
		tween.tween_property(Engine,"time_scale",0.01,.4)
		await tween.tween_callback(game_over)
			
	elif player_death < 4:
		print(player_death)
		await get_tree().create_timer(1).timeout
		reset_play()
	_hud_setup()


func _hud_setup() -> void:
	if player_death == 1:
		hud_4.visible = false
		hud_3.visible = true
	if player_death == 2:
		hud_3.visible = false
		hud_2.visible = true
	if player_death >= 3:
		hud_2.visible = false
		hud_1.visible = true
	
func reset_play() -> void:
	global_position = stage_start.global_position
	visible = true
	can_control = true
	
	
func game_over():
	get_tree().change_scene_to_file("res://Title/title_screen.tscn")
	

	
func _physics_process(delta) -> void:
	var jdirection = joystick.posVector

	
	
	if not can_control: return
	velocity += get_gravity() * delta
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		jump_sfx.play()
		velocity.y = JUMP_VELOCITY

	var direction :float= Input.get_axis("Left", "Right") + joystick.posVector.x
	if direction:
		$Sprite2D.play("run")
		velocity.x = direction * SPEED
	elif velocity.y < 0:
		$Sprite2D.play("jump")
	elif not is_on_floor():
		$Sprite2D.play("fall")
	else:
		$Sprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)
	turn()

	move_and_slide()



	
