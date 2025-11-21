extends RigidBody2D
var atak
var pozycjaGracza
const SPEED = 5




func _ready() -> void:
	atak = get_parent().atak
	pozycjaGracza = get_node("res://player/gracz.tscn").tranform.position

func _physics_process(delta: float) -> void:
	position += (pozycjaGracza - position).normalized() * SPEED * delta

func _on_body_entered(body: Node) -> void:
	if body is Gracz:
		pass#Gracz.hp -= atak
	#queue_free()
