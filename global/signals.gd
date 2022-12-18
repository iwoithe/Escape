extends Node

signal context_changed
func emit_context_changed() -> void:
	emit_signal("context_changed")

signal ghost_hit_player
func emit_ghost_hit_player() -> void:
	emit_signal("ghost_hit_player")

signal hide_ghosts
func emit_hide_ghosts() -> void:
	emit_signal("hide_ghosts")

signal show_ghosts
func emit_show_ghosts() -> void:
	emit_signal("show_ghosts")

signal hide_all_walls
func emit_hide_all_walls() -> void:
	emit_signal("hide_all_walls")
