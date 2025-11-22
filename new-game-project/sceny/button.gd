extends Button

func _pressed() -> void:
	get_tree().current_scene.find_child("CanvasLayer").dialogue("* mmgfhh~~~", true)
