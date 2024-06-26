extends Node2D

@export var player : CharacterBody2D
@export var secondPlayer : CharacterBody2D
@export var score_timer : Timer
@onready var speedtimer = $objects/speedboosts/speedtimer
@onready var speed_ui = $CanvasLayer/SpeedTimer
@export var animation_player : AnimationPlayer
@export var current_map : int

func _ready():
	if Global.localMultiplayer:
		$LocalPlayer.visible = true

func _process(delta):
	if speedtimer.time_left != 0:
		speed_ui.show()
		$CanvasLayer/SpeedTimer/ProgressBar.value = (speedtimer.time_left / speedtimer.wait_time) * 100
	else:
		speed_ui.hide()
	$CanvasLayer/oxygenLevel.value = $Player.oxygen
	if Input.is_key_pressed(KEY_R):
		restart_game()


func restart_game():
	get_tree().reload_current_scene()


func _on_speedtimer_timeout():
	player.speed = 400
	secondPlayer.speed = 400


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/map_selection/map_selection.tscn")
