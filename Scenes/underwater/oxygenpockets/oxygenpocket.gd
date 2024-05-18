extends Node2D

@onready var world = get_owner()
@onready var player = world.player

func _on_area_2d_body_entered(body):
	if body is Player:
		player.player_entered = true
		print(player.player_entered)


func _on_area_2d_body_exited(body):
	if body is Player:
		player.player_entered = false
		print(player.player_entered)
