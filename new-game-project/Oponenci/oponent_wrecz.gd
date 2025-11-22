extends Node2D

var ifGraczIn
var hp
const HP = 100
var atak
const ATAK = 20
var atakDelay
const ATAKDELAY = 5
var predkosc
const PREDKOSC = 5

@onready var gracz: Gracz = get_tree().get_nodes_in_group("Gracz")[0]

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
			gracz.take_damage(ATAK)
			atakDelay = ATAKDELAY
	
func _physics_process(delta: float) -> void:
	
	if atakDelay > 0:
		atakDelay -= delta
	
		
		
	
	
		
		
