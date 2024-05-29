extends StaticBody2D

@onready var world = $".".get_parent()
@export var player : CharacterBody2D
var highscore : float
var highscore_text : String
@onready var new_highscore = false


func _on_area_2d_body_entered(body):
	if body is Player:
		$"../Timer".stop()
		player.playerTimer.stop()
		player.moving = false
		
		if world.current_map == 1:
			highscore = Global.map1_highscore
			highscore_text= Global.map1_highscore_text
			print("map is 1")
		elif world.current_map == 2:
			highscore = Global.map2_highscore
			highscore_text= Global.map2_highscore_text
			print("map is 2")
		
		if highscore == 0:
			highscore = $"../Timer".check_score()[1]
			highscore_text = $"../Timer".check_score()[0]
			print($"../Timer".check_score()[0] + "is the text")
			print("first highscore")
			new_highscore = true
		elif $"../Timer".check_score()[1] < highscore:
			highscore_text = $"../Timer".check_score()[0]
			highscore = $"../Timer".check_score()[1]
			print("new highscore")
			new_highscore = true
		
		if world.current_map == 1:
			Global.map1_highscore = highscore
			Global.map1_highscore_text = highscore_text
			print("map is 1")
		elif world.current_map == 2:
			Global.map2_highscore = highscore
			Global.map2_highscore_text = highscore_text
			print("map is 2")

		
		world.animation_player.play("EnterSubmarine")
		player.dir = Vector2(0, 1)
		await get_tree().create_timer(1.5).timeout
		world.animation_player.play("Fade out")
		await get_tree().create_timer(1).timeout
		if new_highscore == true:
			await Leaderboards.post_guest_score("aquarun-map1-fastest-ti-Tov4", Global.map1_highscore, Global.player_name)
		get_tree().change_scene_to_file("res://Scenes/map_selection/map_selection.tscn")
