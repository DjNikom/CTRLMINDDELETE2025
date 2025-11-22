extends Node
var current_scene = null

func _ready():
	var root = get_tree().root
	# Using a negative index counts from the end, so this gets the last child node of `root`.
	current_scene = root.get_child(-1)


# Called when the node enters the scene tree for the first time.
func scenesnap(path):
	_defrd_scenesnap(path)

func _defrd_scenesnap(path):
	var animplayer = preload("res://inne/scenesnap.tscn").instantiate()
	animplayer.reparent(get_tree().get_root().find_child("Gracz"))
	animplayer.find_child("AnimationPlayer").play("fadeout")
	print("simea")
	await get_tree().create_timer(2).timeout
	current_scene.free()

	# Load the new scene.
	var s = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = s.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene
