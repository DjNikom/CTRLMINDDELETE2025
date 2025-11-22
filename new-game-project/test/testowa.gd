extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(5).timeout # Replace with function body.
	Scenesnap.scenesnap("res://sceny/misja1.tscn")
