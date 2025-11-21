extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$AnimatedSprite2D.play("default") # Replace with function body.
	$AnimatedSprite2D2.play("default")
	$AnimatedSprite2D3.play("default")
	$AnimatedSprite2D4.play("default")
	$AnimatedSprite2D5.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
