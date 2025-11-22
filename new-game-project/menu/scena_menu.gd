extends Node2D

@export var gotowy: bool = false

var menuItems: Array[MenuItem] = []
var animator: AnimationPlayer = null
var muzykaIntro: AudioStreamPlayer = null
var muzykaPetla: AudioStreamPlayer = null

var pozycja = 0
var funkcje: Array[Callable] = [
	graj, wyjdz
]

func graj():
	MenedzerScen.przejscie("res://sceny/mapa_start.tscn")

func wyjdz():
	get_tree().quit()

func muzyka_zapetlij():
	muzykaPetla.play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menuItems.append(get_node("Menu/ItemGraj"))
	menuItems.append(get_node("Menu/ItemWyjdz"))
	
	animator = get_node("Animator")
	
	muzykaIntro = get_node("MuzykaIntro")
	muzykaPetla = get_node("MuzykaPetla")
	
	menuItems[pozycja].wybrany = true
	animator.play("Intro")
	muzykaIntro.connect("finished", muzyka_zapetlij)

func _input(event: InputEvent) -> void:
	#if !gotowy:
	#	return
	
	if event.is_action_pressed("ui_left") || event.is_action_pressed("ui_right"):
		pozycja += 1
		pozycja %= 2
	
	if event.is_action_pressed("ui_accept"):
		funkcje[pozycja].call()
		
	for item in menuItems:
		item.wybrany = false
		
	menuItems[pozycja].wybrany = true
