extends Node2D

var menuItems: Array[MenuItem] = []

var pozycja = 0
var funkcje: Array[Callable] = [
	graj, wyjdz
]

func graj():
	get_tree().change_scene_to_file("res://test/testowa.tscn")

func wyjdz():
	get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menuItems.append(get_node("ItemGraj"))
	menuItems.append(get_node("ItemWyjdz"))
	
	menuItems[pozycja].wybrany = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_left") || event.is_action_pressed("ui_right"):
		pozycja += 1
		pozycja %= 2
	
	if event.is_action_pressed("ui_accept"):
		funkcje[pozycja].call()
		
	for item in menuItems:
		item.wybrany = false
		
	menuItems[pozycja].wybrany = true
