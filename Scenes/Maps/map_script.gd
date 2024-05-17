extends Node2D

@onready var player = $Player
@onready var speedtimer = $objects/speedboosts/speedtimer
@export var animation_player : AnimationPlayer
@export var player_spawn = false
@export var initial_pos : Vector2




func _ready():
	if player_spawn:
		$Player.position = initial_pos
	RenderingServer.set_default_clear_color(Color(0,1,1))
	
func _process(delta):
	pass


func _on_button_pressed():
	get_tree().reload_current_scene()


func _on_button_2_pressed():
	pass


func _on_speedtimer_timeout():
	player.speed = 400
