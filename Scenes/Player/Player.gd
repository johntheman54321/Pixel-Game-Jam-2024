extends CharacterBody2D
class_name Player

@onready var player = $"."
@onready var camera_2d = $Camera2D
var player_entered = false
var oxygen = 100
@export var speed = 400
@export var player_spawn = false
@export var initial_pos : Vector2
@export var playerTimer : Timer
@export var camera_zoom : Vector2
var moving = true
var dir : Vector2
@export var secondPlayer = false

func _ready():
	if player_spawn:
		self.position = initial_pos
	if secondPlayer:
		$Camera2D.enabled = false
		
	$Camera2D.zoom = camera_zoom

func _physics_process(delta):
	if moving:
		dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
		position += dir * speed * delta
	var look_at_cord = (global_position + dir)
	if dir != Vector2.ZERO:
		player.look_at(look_at_cord)
	else:
		player.look_at(global_position + Vector2(0, -1))
		
	move_and_slide()
	if oxygen <= 0:
		get_tree().change_scene_to_file("res://Scenes/DeathScene/deathscreen.tscn")

func _on_timer_timeout():
	if player_entered:
		oxygen += 2
	else:
		oxygen -= 0.5
	if oxygen > 100:
		oxygen = 100
