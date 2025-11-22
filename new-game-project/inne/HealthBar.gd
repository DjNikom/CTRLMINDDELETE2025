extends ProgressBar # Zmień klasę bazową na ProgressBar
@onready var player = get_tree().get_nodes_in_group("Gracz")[0]
func _ready():
	# Znajdź węzeł gracza i połącz sygnał
	
	if player:
		# Pamiętaj, aby nazwać funkcję docelową tak samo jak w sygnale
		player.connect("health_changed", Callable(self, "_on_player_health_changed"))
		# Ustaw początkową wartość paska
		print(player.current_health)
		self.value = player.current_health # Użyj self.value, aby odnieść się do właściwości paska

func _on_player_health_changed(new_health):
	self.value = new_health # Użyj self.value
