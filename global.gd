extends Node

var map1_highscore : float = 0
var map1_highscore_text : String = ""
var map2_highscore : float = 0
var map2_highscore_text : String
var map3_highscore : float = 0
var map3_highscore_text : String
var player_name = ""

func _ready():
  SilentWolf.configure({
	"api_key": "P0jniWo1De7JANse3CwWJ3dN2eHozQO06nFPCk7r",
	"game_id": "Aquarun",
	"log_level": 1
  })

  SilentWolf.configure_scores({
	"open_scene_on_close": "res://Scenes/map_selection/map_selection.tscn"
  })

