extends Area2D

func activation_area(kto: Node2D):
	if !kto is Gracz:
		return
	$Omg.visible = true
	
func deactivation_area(kto: Node2D):
	if !kto is Gracz:
		return
	$Omg.visible = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.connect("body_entered", activation_area)
	self.connect("body_exited", deactivation_area) # Replace with function body.
	
func _input(event):
	if event.is_action_pressed("player_atk1"):
		if $Omg.visible:
			get_tree().current_scene.find_child("CanvasLayer").dialogue("Oni nas potrzebują, lecz u nich nic nie zdziałamy.", true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
