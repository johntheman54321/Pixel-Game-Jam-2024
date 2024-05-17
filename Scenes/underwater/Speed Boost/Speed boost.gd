extends Node2D
@onready var world = get_owner()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 

func _on_area_2d_body_entered(body):
	if body is Player:
		body.speed = 700
		world.speedtimer.start()
		queue_free()
