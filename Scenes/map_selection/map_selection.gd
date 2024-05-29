extends Node2D

var map_switch : String
@onready var animation_player = $AnimationPlayer

func _process(delta):
	if Global.map1_highscore != 0:
		$Control/Map1/Highscore.text = "Highscore
		" + Global.map1_highscore_text
	if Global.map2_highscore != 0:
		$Control/Map2/Highscore.text = "Highscore
		" + Global.map2_highscore_text
func play_fade_out(map_switch):
	animation_player.play("Back")
	await get_tree().create_timer($AnimationPlayer.current_animation_length).timeout
	get_tree().change_scene_to_file("res://Scenes/Maps/Map " + str(map_switch) + "/map_" + str(map_switch) + ".tscn")
	

func _on_map_1_pressed():
	play_fade_out(1)


func _on_map_2_pressed():
	play_fade_out(2)

func _on_back_pressed():
	$AnimationPlayer.play("Back")
	await get_tree().create_timer($AnimationPlayer.current_animation_length).timeout
	get_tree().change_scene_to_file("res://Scenes/main_menu/main_menu.tscn")


func _on_leaderboard_pressed():
	$Leaderboard.show()

func _on_close_pressed():
	$Leaderboard.hide()
