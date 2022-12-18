class_name LevelManager
extends Node

@export var level: int

func change_to_next_scene() -> void:
	var next_level_num := level + 1
	var next_level_string := "res://levels/level" + str(next_level_num) + ".tscn"
	if ResourceLoader.exists(next_level_string):
		get_tree().change_scene_to_file(next_level_string)
	else:
		get_tree().change_scene_to_file("res://ui/mainmenu/mainmenu.tscn")

func reset_level() -> void:
	get_tree().change_scene_to_file("res://levels/level" + str(level) + ".tscn")

func _ready() -> void:
	Context.set_context(Context.Location.GAME)

func _process(_delta) -> void:
	if Input.is_action_just_pressed("restart_level"):
		reset_level()
