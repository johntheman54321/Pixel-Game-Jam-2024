extends StaticBody2D

@onready var world = $".".get_parent()
@export var player : CharacterBody2D
var which_highscore : float
var which_highscore_text : String


func _on_area_2d_body_entered(body):
	if body is Player:
		$"../Timer".stop()
		player.moving = false
		
		if world.current_map == 1:
			which_highscore = Global.map1_highscore
			which_highscore_text = Global.map1_highscore_text
			print("map is 1")
		if world.current_map == 2:
			which_highscore = Global.map2_highscore
			which_highscore_text= Global.map2_highscore_text
			print("map is 2")
		if world.current_map == 3:
			which_highscore = Global.map3_highscore
			which_highscore_text = Global.map3_highscore_text
			print("map is 3")
		if which_highscore == 0:
			print(which_highscore)
			which_highscore = $"../Timer".check_score()[1]
			which_highscore_text = $"../Timer".check_score()[0]
			print($"../Timer".check_score()[0] + "is the text")
			print(which_highscore)
		elif $"../Timer".check_score()[1] < which_highscore:
			which_highscore_text = $"../Timer".check_score()[0]
			which_highscore = $"../Timer".check_score()[1]
			
		world.animation_player.play("EnterSubmarine")
		player.dir = Vector2(0, 1)
		await get_tree().create_timer(1.5).timeout
		world.animation_player.play("Fade out")
		await get_tree().create_timer(1).timeout
		RenderingServer.set_default_clear_color(Color(0,0,0))
		get_tree().change_scene_to_file("res://Scenes/map_selection/map_selection.tscn")
