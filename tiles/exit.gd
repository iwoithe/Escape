extends Area2D

@onready var level_manager: LevelManager = get_node("../../LevelManager")

func _on_body_entered(body):
	if body.is_in_group("player"):
		var tween = get_tree().create_tween()
		tween.tween_property(get_tree().root.get_node("Level" + str(level_manager.level)), "modulate", Color(1, 1, 1, 0), 1)
		await tween.finished
		level_manager.change_to_next_scene()
