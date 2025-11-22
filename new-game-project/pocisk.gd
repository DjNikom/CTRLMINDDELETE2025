extends RigidBody2D
var atak
var pozycjaGracza
const SPEED = 5000
var pozycja = $".".position


func _ready() -> void:
	var gracz = get_node("/root/Template/Gracz")
	atak = get_parent().atak
	pozycjaGracza = gracz.position


func _physics_process(delta: float) -> void:
	#pozycja += (pozycjaGracza - pozycja).normalized() * SPEED * delta
	pozycja = pozycjaGracza
	print(pozycjaGracza)
	

func _on_body_entered(body: Node) -> void:
	if body is Gracz:
		pass#Gracz.hp -= atak
	queue_free()
