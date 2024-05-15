extends StaticBody2D

@onready var world = $".".get_parent()
@onready var player = world.player


func _on_area_2d_body_entered(body):
	if body is Player:
		print("player enter")
