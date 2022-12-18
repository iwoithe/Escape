extends Area2D

func disable_and_hide() -> void:
	$CollisionShape2D.call_deferred("set_disabled", true)
	hide()

func _on_body_entered(body):
	if body.is_in_group("player"):
		$AudioStreamPlayer.play()
		disable_and_hide()
		body.set_num_keys(body.get_num_keys() + 1)
		await $AudioStreamPlayer.finished
		queue_free()
