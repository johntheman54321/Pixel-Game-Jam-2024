extends Node2D

@onready var player = $Player
var time = 0
@onready var time_mil = 00
@onready var time_sec = 00
@onready var time_min = 00

func _ready():
	RenderingServer.set_default_clear_color(Color(0,1,1))
	start_3()

func _process(delta):
	$CanvasLayer/Label.text = str(time_min) + ":" + str(time_sec) + ":" + str(time_mil)
func start_3():
	for n in range(0, 4):
		print(n)
		await get_tree().create_timer(1).timeout
		if n == 3:
			$Timer.start()
			print("started")

func _on_timer_timeout():
	time_mil += 1
	if time_mil == 10:
		time_mil = 0
		time_sec += 1
	if time_sec == 60:
		time_sec = 0
		time_min += 1
	print(time_min)
	print(time_sec)
	print(time_mil)
