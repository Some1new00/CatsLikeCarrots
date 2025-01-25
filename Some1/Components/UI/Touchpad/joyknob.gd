class_name JoyKnob extends Sprite2D

@onready var parent: Node2D = $".."

@export var maxLength = 50
@export var deadZone = 3
var pressing = false

func _ready():
	maxLength *= parent.scale.x
	deadZone *= parent.scale.x

func _process(delta):
	if pressing:
		if get_global_mouse_position().distance_to(parent.global_position) <= maxLength:
			global_position = get_global_mouse_position()
		else:
			var angle = parent.global_position.angle_to_point(get_global_mouse_position())
			global_position.x = parent.global_position.x + cos(angle)*maxLength
			global_position.y = parent.global_position.y + sin(angle)*maxLength
			calculateVector()
	else: 
		global_position = lerp(global_position, parent.global_position, delta * 30)
		parent.posVector = Vector2(0,0)
	
func calculateVector():
	if abs((global_position.x - parent.global_position.x)) >= deadZone:
		parent.posVector.x = (global_position.x - parent.global_position.x)/maxLength
	if abs((global_position.y - parent.global_position.y)) >= deadZone:
		parent.posVector.y = (global_position.y - parent.global_position.y)/maxLength

func _on_button_button_down():
	pressing = true


func _on_button_button_up():
	pressing = false
