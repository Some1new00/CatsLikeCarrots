class_name Bunny
extends CharacterBody2D
var direction

var speed = 240

@onready var bunny_sheet: Sprite2D = $"Bunny-sheet"

# Called when the node enters the scene tree for the first time.
func _ready() -> void: bunny_sheet.frame = randi_range(0,2)
var knockback_strength = 10
var target_pos
func set_target(target_pos:Vector2):
	self.target_pos = target_pos
	direction = global_position.direction_to(target_pos)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		print ("Yeehaw")

func _physics_process(delta):
	#position += transform.x * speed * delta
	if target_pos != null:	
		velocity = direction * speed
	

	


	move_and_slide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	
	pass
