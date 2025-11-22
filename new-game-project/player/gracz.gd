class_name Gracz
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var djumped = false

var current_health = 100
var max_health = 100

func _ready() -> void:
	$AnimatedSprite2D.frame = 1

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		djumped = false

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_pressed("ui_accept") and !djumped:
		djumped = true
		if $CPUParticles2D.emitting:
			$CPUParticles2D.emmiting = false
		$CPUParticles2D.emitting = true
		$AudioStreamPlayer2D.play()
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		if not $AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.play("default")
		$AnimatedSprite2D.scale.x = direction
		velocity.x = direction * SPEED
	else:
		if $AnimatedSprite2D.is_playing():
			$AnimatedSprite2D.stop()
			$AnimatedSprite2D.frame = 1
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if velocity.y < 0:
		self.collision_mask &= ~2
	else:
		self.collision_mask |= 2

	move_and_slide()
	
signal health_changed(new_health)
signal died

func take_damage(amount: int):
	current_health -= amount
	if current_health < 0:
		current_health = 0
		emit_signal("health_changed", current_health)
		if current_health == 0:
			emit_signal("died")

func heal(amount: int):
	current_health += amount
	if current_health > max_health:
		current_health = max_health
	emit_signal("health_changed", current_health)
