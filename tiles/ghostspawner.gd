extends Marker2D

@onready var ghost_scene = preload("res://ghost/ghost.tscn")
@onready var ghosts_node = get_node("../../Ghosts")

func _ready() -> void:
	spawn_ghost()

func spawn_ghost() -> void:
	var new_ghost = ghost_scene.instantiate()
	new_ghost.position = position
	ghosts_node.add_child(new_ghost)
