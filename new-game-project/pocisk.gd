extends RigidBody2D
var atak


func _ready() -> void:
	atak = get_parent().atak


func _on_body_entered(body: Node) -> void:
	if body is Gracz:
		Gracz.hp -= atak
	queue_free()
