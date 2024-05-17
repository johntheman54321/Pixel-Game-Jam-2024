extends CharacterBody2D
class_name Player

@onready var player = $"."
@export var speed = 400
var moving = true
var dir : Vector2
func _ready():
	pass


func _process(delta):
	if moving:
		dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
		position += dir * speed * delta
		var look_at_cord = (global_position + dir)
		if dir != Vector2.ZERO:
			player.look_at(look_at_cord)
		else:
			player.look_at(global_position + Vector2(0, -1))
		
	move_and_slide()


