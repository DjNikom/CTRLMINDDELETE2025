class_name OppDyst
extends Node2D

var ifGraczIn
var hp
const HP = 1000
var melatak
const MELATAK = 15
var atak
const ATAK = 15
var atakDelay
const ATAKDELAY = 10
var predkosc
const PREDKOSC = 20
const NMBROFBULLETS = 5
const CZASMIEDZYBULLETS = 0.75
var gracz
var pocisk = preload("res://Oponenci/BossPocisk.tscn")
var x

func _ready() -> void:
	ifGraczIn = false
	atakDelay = 0
	atak = ATAK
	melatak = MELATAK
	hp = HP
	x = 0

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
		else: 
			atak_masowy()	
		atakDelay = ATAKDELAY
	#KUBBBBBBBBBBBBBBBAAAAAAAAAAAAAAAAAAA!!!,albo Michał
	#Wstwić tu co sięstanie po śmierci bosa
	
	if hp <= 0:
		queue_free()
	
	
func _physics_process(delta: float) -> void:
	if atakDelay > 0:
		atakDelay -= delta
	

func instantiate_bullet():
	var instance = pocisk.instantiate()
	add_child(instance)
	
func atak_masowy():
	while x < NMBROFBULLETS:
		instantiate_bullet()
		x+=1
		await get_tree().create_timer(CZASMIEDZYBULLETS).timeout
	x = 0
