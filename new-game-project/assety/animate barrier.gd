class_name Bariera
extends Area2D

func wszedl(kto: Node2D):
	if !kto is Gracz:
		return
	var gracz: Gracz = kto
	gracz.bariera_knockback()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.connect("body_entered", wszedl)
	
	$AnimatedSprite2D.play("default") # Replace with function body.
	$AnimatedSprite2D2.play("default")
	$AnimatedSprite2D3.play("default")
	$AnimatedSprite2D4.play("default")
	$AnimatedSprite2D5.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
