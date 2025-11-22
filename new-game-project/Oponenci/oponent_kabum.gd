extends Node2D

var ifGraczIn
var hp
const HP = 50
var atak
const ATAK = 20
var predkosc
const PREDKOSC = 5

@onready var gracz: Gracz = get_tree().get_nodes_in_group("Gracz")[0]

func _ready() -> void:
	ifGraczIn = false
	
	predkosc = PREDKOSC
	atak = ATAK
	hp = HP

func damage():
	queue_free()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Gracz: 
		body.take_damage(atak)
		queue_free()
	

@onready var gracz = get_tree().get_nodes_in_group("Gracz")[0]
const SPEED = 0.2
const JUMP_VELOCITY = -300.0
var direction

var velocity = Vector2(0, 0)
var active = false

func _physics_process(_delta: float) -> void:
	if !active:
		if gracz.position.distance_to(position) < 512: active = true
		return
	
	self.rotation += 0.5
	
	velocity = Vector2(0, 0)

	var dist = sqrt(gracz.position.distance_to(self.position)) * SPEED

	if gracz.position.x > self.position.x:
		velocity.x = dist
	if gracz.position.x < self.position.x:
		velocity.x = -dist
		
	if gracz.position.y > self.position.y:
		velocity.y = dist
	if gracz.position.y < self.position.y:
		velocity.y = -dist

	position += velocity
