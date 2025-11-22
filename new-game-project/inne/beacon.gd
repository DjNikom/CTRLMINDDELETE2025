class_name Beacon
extends Area2D

@export var cel: String = "res://menu/ScenaMenu.tscn"

func gracz_wszedl(gracz: Node2D):
	if !gracz is Gracz:
		return
	
	gracz.bezwladny = 1000
	gracz.velocity = Vector2(0, 0)
	
	MenedzerScen.przejscie(cel)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("body_entered", gracz_wszedl)
