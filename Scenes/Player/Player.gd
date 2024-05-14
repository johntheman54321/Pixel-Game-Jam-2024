extends CharacterBody2D

@onready var player = $"."
@onready var look_at_angle = $look_at_angle



func _process(delta):
	player.look_at(get_global_mouse_position())
