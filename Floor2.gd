class_name Floor2
extends StaticBody2D
@export var speed_vec : Vector2 = Vector2(0,-1)
@export var speed = 88

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _physics_process(delta):
	position += (speed_vec * speed) * delta
	pass
