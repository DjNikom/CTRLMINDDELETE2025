extends Node2D

var ifGraczIn
var hp
const HP = 50
var atak
const ATAK = 25
var predkosc
const PREDKOSC = 5

func _ready() -> void:
	ifGraczIn = false
	
	predkosc = PREDKOSC
	atak = ATAK
	hp = HP

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz: 
		body.dealDamage(atak)
		queue_free()
	

		
	
	
		
		
