extends Node2D

@export var player : CharacterBody2D
@export var score_timer : Timer
@onready var speedtimer = $objects/speedboosts/speedtimer
@onready var speed_ui = $CanvasLayer/SpeedTimer
@export var animation_player : AnimationPlayer
@export var current_map : int




func _ready():
	RenderingServer.set_default_clear_color(Color(0,1,1))
	
func _process(delta):
	if speedtimer.time_left != 0:
		speed_ui.show()
		$CanvasLayer/SpeedTimer/ProgressBar.value = (speedtimer.time_left / speedtimer.wait_time) * 100
	else:
		speed_ui.hide()


func _on_button_pressed():
	get_tree().reload_current_scene()


func _on_speedtimer_timeout():
	player.speed = 400
