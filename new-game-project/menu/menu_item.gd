class_name MenuItem
extends Node2D

@export var tekst: String = ""
@export var wybrany: bool = false

var tekstObj: Label = null
var wybranyObj: Label = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	tekstObj = get_node("Tekst")
	wybranyObj = get_node("Wybrany")
	
	tekstObj.text = tekst
	wybranyObj.visible = wybrany

func _process(_delta):
	wybranyObj.visible = wybrany
