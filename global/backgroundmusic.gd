extends Node

func _update_music() -> void:
	#match Context.get_context():
	#	Context.Location.UI_MENU:
	#		$AudioStreamPlayer.stop()
	#	Context.Location.GAME:
	#		$AudioStreamPlayer.play()
	var context = Context.get_context()
	if context == Context.Location.UI_MENU:
		$AudioStreamPlayer.stop()
	elif context == Context.Location.GAME:
		$AudioStreamPlayer.play()
	else:
		$AudioStreamPlayer.stop()

func _ready() -> void:
	Signals.context_changed.connect(_update_music)
