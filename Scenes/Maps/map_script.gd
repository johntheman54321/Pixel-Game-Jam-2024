extends Node2D

@onready var player = $Player
@onready var animation_player = $AnimataionPlayer
@onready var speedtimer = $objects/speedboosts/speedtimer




func _ready():
	RenderingServer.set_default_clear_color(Color(0,1,1))

func _process(delta):
	pass


func _on_button_pressed():
	get_tree().reload_current_scene()


func _on_button_2_pressed():
	pass


func _on_speedtimer_timeout():
	player.speed = 400
	print("pee")
