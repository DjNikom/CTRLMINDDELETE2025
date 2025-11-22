extends CanvasLayer
@onready var player = get_tree().get_nodes_in_group("Gracz")[0]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if player:
		# Pamiętaj, aby nazwać funkcję docelową tak samo jak w sygnale
		player.connect("health_changed", Callable(self, "_on_player_health_changed"))
		# Ustaw początkową wartość paska
		print(player.current_health)
		$ColorRect/HP.text = "HP: "+str(player.current_health)+"%" # Replace with function body.


func _on_player_health_changed(new_health):
	$ColorRect/HP.text = "HP: "+str(new_health)+"%"

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("invtoggle"):
		self.visible = !self.visible
