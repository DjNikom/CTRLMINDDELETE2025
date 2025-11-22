extends RigidBody2D
var atak
var pozycjaGracza = Vector2()
const SPEED = 150
var pozycja = Vector2()
var predkosc = Vector2()
var zwrot = Vector2()
var czas
@onready var gracz = get_tree().get_nodes_in_group("Gracz")[0]

func _ready() -> void:
	czas = 7.5
	atak = get_parent().atak
	
	

func _physics_process(delta: float) -> void:
	pozycja = self.global_position
	pozycjaGracza = gracz.get_pozycja()
	zwrot = (pozycjaGracza - pozycja).normalized()
	self.rotation = zwrot.angle() + PI
	predkosc = zwrot * SPEED * delta
	predkosc = move_and_collide(predkosc)
	destroy_after_time(delta)
	
func destroy_after_time(delta: float):
	if czas <= 0:
		queue_free()
	else:
		czas -= delta
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz:
		body.dealDamage(atak)
	queue_free()
