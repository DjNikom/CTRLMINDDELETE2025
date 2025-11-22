extends Area2D

func enter(body: Node2D):
	if !body is Gracz: return
	body.heal(50)
	queue_free()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", enter)
