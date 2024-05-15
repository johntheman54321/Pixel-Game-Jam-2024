extends Node2D

var map_switch : String
@onready var animation_player = $AnimationPlayer


func _ready():
	RenderingServer.set_default_clear_color(Color(0,1,1))
	animation_player.play("Fade In")

func _process(delta):
	print(animation_player.current_animation)

func play_fade_out(map_switch):
	animation_player.play("Fade Out")
	await get_tree().create_timer(1.2).timeout
	RenderingServer.set_default_clear_color(Color(0,0,0))
	get_tree().change_scene_to_file("res://Scenes/Maps/Map " + str(map_switch) + "/map_" + str(map_switch) + ".tscn")
	print(map_switch)



func _on_map_1_pressed():
	play_fade_out(1)


func _on_map_2_pressed():
	map_switch = "2"


func _on_map_3_pressed():
	map_switch = "3"
