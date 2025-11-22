class_name Gracz
extends CharacterBody2D

const SPEED = 300.0
const DASHSPEED = SPEED * 15
var dashCooldown
const DASHCOOLDOWN = 1
const JUMP_VELOCITY = -400.0
var djumped = false
var bezwladny: int = 0
var pauza = false
var dir = 1

var current_health = 100
var max_health = 100

var puncc = 0

func _ready() -> void:
	$AnimatedSprite2D.frame = 1
	current_health = 100
	dashCooldown = 0

func bariera_knockback():
	bezwladny = 60
	velocity = Vector2(200, -400)
	$AnimatedSprite2D.play("fall")

func gameover():
	pauza = true
	MenedzerScen.przejscie("res://menu/GameOver.tscn")

func _physics_process(delta: float) -> void:
	if pauza: return
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		djumped = false

	if bezwladny:
		bezwladny -= 1
	else:
		if $AnimatedSprite2D.animation == "fall":
			$AnimatedSprite2D.animation = "default"
			$AnimatedSprite2D.stop()
			$AnimatedSprite2D.frame = 1
		# Handle jump.
		if Input.is_action_just_pressed("player_jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			$AudioStreamPlayer2D2.play()
		elif Input.is_action_just_pressed("player_jump") and !djumped:
			djumped = true
			if $CPUParticles2D.emitting:
				$CPUParticles2D.emmiting = false
			$CPUParticles2D.emitting = true
			$AudioStreamPlayer2D.play()
			velocity.y = JUMP_VELOCITY

		if Input.is_action_just_pressed("player_atk1") && !puncc:
			var oponenci: Array[Node] = get_tree().get_nodes_in_group("oponenci")
			puncc = 15
			for o in oponenci:
				if !o is Node2D: continue
				var oponent: Node2D = o
				if oponent.position.distance_to(self.position) > 128: continue
				oponent.queue_free()

		if Input.is_action_just_pressed("ui_dash")&&dashCooldown<=0:
			velocity.x = dir * DASHSPEED
			$AnimatedSprite2D.play("dash")
			dashCooldown = DASHCOOLDOWN

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.

		var direction := Input.get_axis("player_left", "player_right")
		if direction:
			if not $AnimatedSprite2D.is_playing():
				$AnimatedSprite2D.play("default")
			$AnimatedSprite2D.scale.x = direction
			if direction>0:
				dir = 1
			elif direction<0:
				dir =-1
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

	if puncc > 0:
		$AnimatedSprite2D.play("puncc")
		puncc -= 1
	elif $AnimatedSprite2D.animation == "puncc":
		$AnimatedSprite2D.animation = "default"
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 1
	
	#miejsce na rzeczy wymagające czasu autorstwa Huberta Grzybka
	dashCooldown-=delta
	
	move_and_slide()
	
signal health_changed(new_health)
signal died

func take_damage(amount: int):
	current_health -= amount
	bezwladny = 30
	velocity = Vector2(100, -200)
	$AnimatedSprite2D.play("fall")
	
	emit_signal("health_changed", current_health)
	print(current_health)
	if current_health <= 0:
		gameover()
		emit_signal("died")

func heal(amount: int):
	current_health += amount
	
	if current_health > max_health:
		current_health = max_health
	emit_signal("health_changed", current_health)
	
func dealDamage(amaunt: int):
	current_health -= amaunt 
	
func get_pozycja():
	return self.global_position
