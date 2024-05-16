extends Timer

@onready var time_mil = 00
@onready var time_sec = 00
@onready var time_min = 00
@onready var player = $"../Player"


func _ready():
	start_3()

func _process(delta):
	$"../CanvasLayer/Label".text = str(time_min) + ":" + str(time_sec) + ":" + str(time_mil)

func start_3():
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
		print(n)
		await get_tree().create_timer(1).timeout
		if n == 4:
			$".".start()
			player.moving = true
			$"../CanvasLayer/AnimatedSprite2D".hide()
			break


func _on_timeout():
	time_mil += 1
	if time_mil == 10:
		time_mil = 0
		time_sec += 1
	if time_sec == 60:
		time_sec = 0
		time_min += 1
