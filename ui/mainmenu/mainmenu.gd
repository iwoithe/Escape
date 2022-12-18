extends Control

func _ready() -> void:
	Context.set_context(Context.Location.UI_MENU)

func _play_game() -> void:
	get_tree().change_scene_to_file("res://levels/level1.tscn")

func _how_to_play() -> void:
	get_tree().change_scene_to_file("res://ui/howtoplay/howtoplay.tscn")

func _on_credits() -> void:
	get_tree().change_scene_to_file("res://ui/credits/credits.tscn")

func _quit() -> void:
	get_tree().quit()
