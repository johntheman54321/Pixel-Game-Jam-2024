extends ParallaxBackground

func _input(event):
	if event is InputEventMouseMotion:
		var viewport_size = get_viewport().size
		var multiplier = 2
		
		var mouse_x = event.position.x
		var mouse_y = event.position.y

		var relative_x = (mouse_x - (viewport_size.x/2)) / (viewport_size.x/2)
		var relative_y = (mouse_y - (viewport_size.y/2)) / (viewport_size.y/2)
		
		$ParallaxLayer.motion_offset.x = $ParallaxLayer.motion_scale.x * relative_x
		$ParallaxLayer.motion_offset.y = $ParallaxLayer.motion_scale.y * relative_y
		
		$ParallaxLayer2.motion_offset.x = $ParallaxLayer2.motion_scale.x * relative_x
		$ParallaxLayer2.motion_offset.y = $ParallaxLayer2.motion_scale.y * relative_y
		
		$ParallaxLayer3.motion_offset.x = $ParallaxLayer3.motion_scale.x * relative_x
		$ParallaxLayer3.motion_offset.y = $ParallaxLayer3.motion_scale.y * relative_y
