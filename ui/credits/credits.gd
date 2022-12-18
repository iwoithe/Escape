extends Control

func _ready() -> void:
	Context.set_context(Context.Location.UI_MENU)

func _on_back_to_main_menu():
	get_tree().change_scene_to_file("res://ui/mainmenu/mainmenu.tscn")
