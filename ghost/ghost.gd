extends CharacterBody2D

# TODO: Is it okay that the visibility property is not being set itself

@export var speed = 50
@export var player_escape_distance = 300

@onready var player = get_node("../../Player")
@onready var nav_agent = $NavigationAgent2D

var tween

func fade_and_hide() -> void:
	_check_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 0), 0.5)
	
func fade_and_show() -> void:
	_check_tween()
	tween.tween_property(self, "modulate", Color(1, 1, 1, 1), 0.5)

func _ready() -> void:
	visible = true
	Signals.hide_ghosts.connect(fade_and_hide)
	Signals.show_ghosts.connect(fade_and_show)

	nav_agent.set_target_location(player.global_position)

func _physics_process(delta):
	if global_position.distance_to(player.global_position) <= player_escape_distance:
		# Follow the player
		nav_agent.set_target_location(player.global_position)
		if nav_agent.is_target_reachable() and not nav_agent.is_target_reached():
			var next_location = nav_agent.get_next_location()
			var direction = global_position.direction_to(next_location)
			global_position += direction * speed * delta
	else:
		# Don't follow the player
		pass

func _check_tween() -> void:
	if tween:
		tween.kill()
	
	tween = create_tween()

func _on_body_entered(body):
	if body.is_in_group("player"):
		Signals.emit_ghost_hit_player()
