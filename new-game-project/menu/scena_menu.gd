extends Node2D

var buttonGraj: Button = null
var buttonWyjdz: Button = null

func graj():
	pass

func wyjdz():
	get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	buttonGraj = get_node("ButtonGraj")
	buttonWyjdz = get_node("ButtonWyjdz")
	
	buttonGraj.connect("pressed", graj)
	buttonWyjdz.connect("pressed", wyjdz)
