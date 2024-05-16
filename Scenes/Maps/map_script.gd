extends Node2D

@onready var player = $Player
@onready var animation_player = $AnimationPlayer


func _ready():
	RenderingServer.set_default_clear_color(Color(0,1,1))

func _process(delta):
	pass


func _on_button_pressed():
	get_tree().reload_current_scene()


func _on_button_2_pressed():
	pass
