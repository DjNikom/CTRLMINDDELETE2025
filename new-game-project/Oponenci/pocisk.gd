extends RigidBody2D
var atak
var pozycjaGracza = Vector2()
const SPEED = 500
var pozycja = Vector2()
var predkosc = Vector2()
var zwrot = Vector2()
@onready var gracz = get_tree().get_nodes_in_group("Gracz")[0]

func _ready() -> void:
	pozycja = self.global_position
	atak = get_parent().atak
	pozycjaGracza = gracz.get_pozycja()
	zwrot = (pozycjaGracza - pozycja).normalized()
	self.rotation = zwrot.angle() + PI 

func _physics_process(delta: float) -> void:
	predkosc = zwrot * SPEED * delta
	predkosc = move_and_collide(predkosc)
	
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz:
		body.dealDamage(atak)
		queue_free()
	elif body is OppDyst:
		pass
	else:
		queue_free()
