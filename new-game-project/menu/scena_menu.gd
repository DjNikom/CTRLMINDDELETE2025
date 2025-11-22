extends Node2D

@export var gotowy: bool = false

var menuItems: Array[MenuItem] = []
var animator: AnimationPlayer = null
var dzwiek1: AudioStreamPlayer = null
var dzwiek2: AudioStreamPlayer = null
var muzykaIntro: AudioStreamPlayer = null
var muzykaPetla: AudioStreamPlayer = null

var pozycja = 0
var funkcje: Array[Callable] = [
	graj, wyjdz
]

func graj():
	MenedzerScen.przejscie("res://sceny/mapa_start.tscn")

func wyjdz():
	MenedzerScen.wyjdz()

func muzyka_zapetlij():
	muzykaPetla.play()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menuItems.append(get_node("Menu/ItemGraj"))
	menuItems.append(get_node("Menu/ItemWyjdz"))
	
	animator = get_node("Animator")
	
	dzwiek1 = get_node("Dzwiek1")
	dzwiek2 = get_node("Dzwiek2")
	muzykaIntro = get_node("MuzykaIntro")
	muzykaPetla = get_node("MuzykaPetla")
	
	menuItems[pozycja].wybrany = true
	animator.play("Intro")
	muzykaIntro.connect("finished", muzyka_zapetlij)

func _input(event: InputEvent) -> void:
	if !gotowy:
		return
	
	if event.is_action_pressed("ui_left") || event.is_action_pressed("ui_right"):
		pozycja += 1
		pozycja %= 2
		dzwiek1.play()
	
	if event.is_action_pressed("ui_accept"):
		funkcje[pozycja].call()
		dzwiek2.play()
		
	for item in menuItems:
		item.wybrany = false
		
	menuItems[pozycja].wybrany = true
