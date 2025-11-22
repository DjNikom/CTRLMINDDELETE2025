extends Node2D
class_name OppDyst

var ifGraczIn
var hp
const HP = 100
var melatak
const MELATAK = 1
var atak
const ATAK = 5
var atakDelay
const ATAKDELAY = 15
var dystansDelay
const DYSTANSDELAY = 10
var predkosc
const PREDKOSC = 5
var graczhp = 0
var pocisk = preload("res://Oponenci/pocisk.tscn")

func _ready() -> void:
	ifGraczIn = false
	atakDelay = 0
	atak = ATAK
	melatak = MELATAK
	hp = HP
	dystansDelay = 0
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz: 
		ifGraczIn = true
	
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Gracz:
		ifGraczIn = false
		
func _process(_delta: float) -> void:
	if atakDelay <= 0:
		if ifGraczIn:
			graczhp -= atak
			atakDelay = ATAKDELAY
	if dystansDelay <= 0:
		instantiate_bullet()
		dystansDelay = DYSTANSDELAY
	
	
func _physics_process(delta: float) -> void:
	if atakDelay > 0:
		atakDelay -= delta
	
	if dystansDelay > 0:
		dystansDelay -= delta
		
		
func instantiate_bullet():
	var instance = pocisk.instantiate()
	add_child(instance)
