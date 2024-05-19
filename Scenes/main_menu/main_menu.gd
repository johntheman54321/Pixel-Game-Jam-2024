extends Node2D

var button_pressed = false

func _process(delta):
	pass


func _on_play_pressed():
	if button_pressed == false:
		$AnimationPlayer.play("Fade Out")
	button_pressed = true
	await get_tree().create_timer(1).timeout
	RenderingServer.set_default_clear_color(Color(0,0,0))
	get_tree().change_scene_to_file("res://Scenes/map_selection/map_selection.tscn")


func _on_quit_pressed():
	button_pressed = true
	get_tree().quit()
