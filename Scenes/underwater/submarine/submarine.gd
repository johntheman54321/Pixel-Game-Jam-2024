extends StaticBody2D

@onready var world = $".".get_parent()
@export var player : CharacterBody2D


func _on_area_2d_body_entered(body):
	if body is Player:
		print("player enter")
	$"../Timer".stop()
	player.moving = false
