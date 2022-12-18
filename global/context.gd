extends Node

enum Location {
	UI_MENU,
	GAME
}

var __context := Location.UI_MENU :
	get = get_context,
	set = set_context

func get_context() -> int:
	return __context

func set_context(c: Location) -> void:
	if c == __context:
		return

	__context = c
	Signals.emit_context_changed()
