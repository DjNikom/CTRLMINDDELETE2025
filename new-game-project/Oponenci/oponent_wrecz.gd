extends Node2D

var ifGraczIn = false
var atak
var graczhp

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz: 
		ifGraczIn = true
	
	
func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Gracz:
		ifGraczIn = false
		
func _physics_process(delta: float) -> void:
	if ifGraczIn == true:
		graczhp -= atak
		
