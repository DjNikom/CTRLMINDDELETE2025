extends Area2D

func gracz_poza_swiatem(gracz: Node2D):
	if !gracz is Gracz: 
		if gracz is Oppoment:
			gracz.queue_free()
		return
	gracz.gameover()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", gracz_poza_swiatem)
