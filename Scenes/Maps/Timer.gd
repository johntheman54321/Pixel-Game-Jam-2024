extends Timer

@onready var time_mil = 00
@onready var time_sec = 00
@onready var time_min = 00
@onready var player = $"../Player"
var current_map : int


func _ready():
	start_3()
	current_map = $"..".current_map

func _process(delta):
	$"../CanvasLayer/Label".text = str(time_min) + ":" + str(time_sec) + ":" + str(time_mil)

func start_3():
	player.playerTimer.stop()
	var pitch_init = 0.33
	for n in range(0, 10):
		$"../CanvasLayer/AnimatedSprite2D".show()
		$"../CanvasLayer/AnimatedSprite2D".play(str(n))
		if n > 0 and n < 4:
			$"../SFX/start".pitch_scale = pitch_init
			pitch_init += 0.04
			$"../SFX/start".play()
		elif n >= 4:
			$"../SFX/start".pitch_scale = 0.15
			$"../SFX/start".play()
		player.moving = false
		await get_tree().create_timer(1).timeout
		if n == 4:
			$".".start()
			player.moving = true
			$"../CanvasLayer/AnimatedSprite2D".hide()
			player.playerTimer.start()
			break


func _on_timeout():
	time_mil += 1
	if time_mil == 10:
		time_mil = 0
		time_sec += 1
	if time_sec == 60:
		time_sec = 0
		time_min += 1

func check_score():
	var total_time = (time_min*60)+(time_sec)+(time_mil*0.1)
	var text = str(time_min) + ":" + str(time_sec) + ":" + str(time_mil)
	return [text, total_time]
