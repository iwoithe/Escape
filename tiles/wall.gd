extends StaticBody2D

# TODO: Is it okay that the visibility property is not being set itself

var tween

func fade_and_hide() -> void:
	_check_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 0.5)

func fade_and_show() -> void:
	_check_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)

func _ready() -> void:
	set_modulate(Color(1, 1, 1, 0))
	Signals.hide_all_walls.connect(fade_and_hide)

func _check_tween() -> void:
	if tween:
		tween.kill()
	
	tween = create_tween()
