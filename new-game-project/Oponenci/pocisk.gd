extends RigidBody2D
var atak
var pozycjaGracza = Vector2()
const SPEED = 500
var pozycja = Vector2()
var kierunek = Vector2()
@onready var gracz = get_tree().get_nodes_in_group("Gracz")[0]

func _ready() -> void:
	pozycja = self.global_position
	atak = get_parent().atak
	pozycjaGracza = gracz.get_pozycja()
	

func _physics_process(delta: float) -> void:
	kierunek = (pozycjaGracza - pozycja).normalized() * SPEED * delta
	kierunek = move_and_collide(kierunek)
	print((pozycjaGracza - pozycja).normalized())
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz:
		body.dealDamage(atak)
		queue_free()
	elif body is OppDyst:
		pass
	else:
		queue_free()
