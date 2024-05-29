extends Node2D

var button_pressed = false

func _ready():
	$CanvasLayer/AnimationContainer/Name/LineEdit.text = Global.player_name
	#RenderingServer.set_default_clear_color(Color(0.39,0.75,1))
	

func _process(delta):
	pass


func _on_play_pressed():
	print($CanvasLayer/AnimationContainer/Name/LineEdit.text)
	if $CanvasLayer/AnimationContainer/Name/LineEdit.text != "" :
		Global.player_name = $CanvasLayer/AnimationContainer/Name/LineEdit.text
		if button_pressed == false:
			$AnimationPlayer.play("Fade Out")
		button_pressed = true
		await get_tree().create_timer($AnimationPlayer.current_animation_length).timeout
		$CanvasLayer/AnimationContainer/Name/LineEdit.editable = false
		get_tree().change_scene_to_file("res://Scenes/map_selection/map_selection.tscn")
	else:
		$AnimationPlayer.play("NoName")


func _on_quit_pressed():
	$AnimationPlayer.play("Fade Out")
	await get_tree().create_timer($AnimationPlayer.current_animation_length).timeout
	button_pressed = true
	get_tree().quit()
