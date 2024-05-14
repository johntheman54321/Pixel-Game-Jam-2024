extends CharacterBody2D
class_name Player

@onready var player = $"."
@export var speed = 7
var dir : Vector2



func _process(delta):
	dir = Vector2(get_global_mouse_position() - position).normalized()
	print(position)
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		position += (dir * speed)
	elif Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position += (dir * (speed + 6))
	player.look_at(get_global_mouse_position())
	
	move_and_slide()
