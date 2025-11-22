extends Area2D


func hitt(gracz: Node2D):
	if !gracz is Gracz: 
		return
	gracz.take_damage(25)
		
func _ready() -> void:
	connect("body_entered", hitt)
