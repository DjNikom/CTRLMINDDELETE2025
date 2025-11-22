extends CharacterBody2D
class_name Oppoment

@onready var gracz = get_tree().get_nodes_in_group("Gracz")[0]
const SPEED = 400.0
const JUMP_VELOCITY = -300.0
var direction

func damage():
	queue_free()

func _physics_process(delta: float) -> void:
	if !is_instance_valid(gracz): return
	if gracz.position.distance_to(position) > 512: return

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if gracz.position.x>self.position.x:
		direction = 1
	else:
		direction = -1
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if is_on_floor():
		if gracz.position.x-self.position.x>-750 or gracz.position.x-self.position.x<750:
			if direction:
				velocity.x = direction * SPEED
				$Sprite2D.scale.x = direction
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y += JUMP_VELOCITY

	move_and_slide()
