extends Node2D

var ifGraczIn
var atak
var graczhp
var atakDelay
const PREDKOSC = 5
var predkosc
func _ready() -> void:
	ifGraczIn = false

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
			atakDelay = 5
	
func _physics_process(delta: float) -> void:
	if atakDelay > 0:
		atakDelay -= delta
	
		
		
	
	
		
		
