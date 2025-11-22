extends Node2D

var ifGraczIn
var hp
const HP = 100
var atak
const ATAK = 5
var atakDelay
const ATAKDELAY = 5
var predkosc
const PREDKOSC = 5
var gracz

func _ready() -> void:
	ifGraczIn = false
	atakDelay = ATAKDELAY
	predkosc = PREDKOSC
	atak = ATAK
	hp = HP

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz: 
		ifGraczIn = true
		gracz = body
	
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Gracz:
		ifGraczIn = false
		
func _process(_delta: float) -> void:
	if atakDelay <= 0:
		if ifGraczIn:
			gracz.dealDamage(atak)
			atakDelay = ATAKDELAY
	
func _physics_process(delta: float) -> void:
	
	if atakDelay > 0:
		atakDelay -= delta
	
		
		
	
	
		
		
