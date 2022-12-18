extends CharacterBody2D

@export var speed := 5.0

@onready var animation_player = $AnimationPlayer
@onready var level_manager = get_node("../LevelManager")

var _using_light := false
var _health := 3

var _num_keys := 0 :
	get = get_num_keys,
	set = set_num_keys

func get_num_keys() -> int:
	return _num_keys

func set_num_keys(n: int) -> void:
	_num_keys = n

enum States {
	IDLE,
	WALK
}

var _state := States.IDLE

func has_keys() -> bool:
	return _num_keys > 0

func _loose_life() -> void:
	if _health > 1:
		get_node("%Heart" + str(_health)).hide()
		_health -= 1
	else:
		level_manager.reset_level()

func _ready() -> void:
	Signals.ghost_hit_player.connect(_loose_life)
	$"Light Area/LightCollision".set_disabled(true)
	$"%TorchIcon".hide()

func _physics_process(delta):
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed * (delta * 3000)
	if velocity.is_zero_approx():
		_state = States.IDLE
	else:
		_state = States.WALK
	
	match _state:
		States.IDLE:
			animation_player.play("RESET")
		States.WALK:
			animation_player.play("Walk")
	
	if Input.is_action_just_pressed("toggle_light"):
		_using_light = !_using_light
		
		if _using_light:
			Signals.emit_hide_ghosts()
			$"Light Area/LightCollision".set_disabled(false)
			$"%TorchIcon".show()
		else:
			Signals.emit_hide_all_walls()
			Signals.emit_show_ghosts()
			$"Light Area/LightCollision".set_disabled(true)
			$"%TorchIcon".hide()
	
	move_and_slide()

func _on_body_entered_into_light(body):
	if body.is_in_group("walls"):
		body.fade_and_show()

func _on_body_exited_from_light(body):
	if body.is_in_group("walls"):
		body.fade_and_hide()
