extends StaticBody2D

@onready var world = $".".get_parent()
@export var player : CharacterBody2D


func _on_area_2d_body_entered(body):
	if body is Player:
		print("player enter")
		$"../Timer".stop()
		player.moving = false
		world.animation_player.play("EnterSubmarine")
		player.dir = Vector2(0, 1)
		await get_tree().create_timer(1.5).timeout
		world.animation_player.play("Fade out")
		print("done")
