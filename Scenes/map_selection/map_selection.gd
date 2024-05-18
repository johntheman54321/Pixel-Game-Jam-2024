extends Node2D

var map_switch : String
@onready var animation_player = $AnimationPlayer
@onready var leaderboard_scene = preload("res://addons/silent_wolf/Scores/Leaderboard.tscn")


func _ready():
	RenderingServer.set_default_clear_color(Color(0,1,1))
	animation_player.play("Fade In")

func _process(delta):
	if Global.map1_highscore != 0:
		$Control/Map1/Highscore.text = "Highscore
		" + Global.map1_highscore_text
	if Global.map2_highscore != 0:
		$Control/Map2/Highscore.text = "Highscore
		" + Global.map2_highscore_text
	if Global.map3_highscore != 0:
		$Control/Map3/Highscore.text = "Highscore
		" + Global.map3_highscore_text

func play_fade_out(map_switch):
	animation_player.play("Fade Out")
	await get_tree().create_timer(1).timeout
	RenderingServer.set_default_clear_color(Color(0,0,0))
	get_tree().change_scene_to_file("res://Scenes/Maps/Map " + str(map_switch) + "/map_" + str(map_switch) + ".tscn")



func _on_map_1_pressed():
	play_fade_out(1)


func _on_map_2_pressed():
	map_switch = "2"


func _on_map_3_pressed():
	map_switch = "3"


func _on_button_pressed():
	get_tree().change_scene_to_packed(leaderboard_scene)
