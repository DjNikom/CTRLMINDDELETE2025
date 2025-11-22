class_name OppDyst
extends Node2D

var ifGraczIn
var hp
const HP = 100
var melatak
const MELATAK = 25
var atak
const ATAK = 15
var atakDelay
const ATAKDELAY = 15
var dystansDelay
const DYSTANSDELAY = 3
var predkosc
const PREDKOSC = 5
var pocisk = preload("res://Oponenci/pocisk.tscn")

@onready var gracz: Gracz = get_tree().get_nodes_in_group("Gracz")[0]

func _ready() -> void:
	ifGraczIn = false
	atakDelay = 0
	atak = ATAK
	melatak = MELATAK
	hp = HP
	dystansDelay = 0
	
func damage():
	queue_free()
	

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
	if dystansDelay <= 0:
		if gracz.position.distance_to(position) > 512: return
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
