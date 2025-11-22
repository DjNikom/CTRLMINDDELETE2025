extends ProgressBar # Zmień klasę bazową na ProgressBar

func _ready():
	# Znajdź węzeł gracza i połącz sygnał
	var player = get_tree().get_first_node_in_group("Player")
	if player:
		# Pamiętaj, aby nazwać funkcję docelową tak samo jak w sygnale
		player.connect("health_changed", Callable(self, "_on_player_health_changed"))
		# Ustaw początkową wartość paska
		self.value = player.current_health # Użyj self.value, aby odnieść się do właściwości paska

func _on_player_health_changed(new_health):
	self.value = new_health # Użyj self.value
