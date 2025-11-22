extends Node

var glosnosc: int = 255
var glosnosc_cel: int = glosnosc
var glosnosc_delta: int = 1

var ostatnia: String = "res://menu/ScenaMenu.tscn"

func ustawGlosnosc(g: float):
	AudioServer.set_bus_volume_linear(
		AudioServer.get_bus_index("Master"),
		g
	)

func _process(_delta: float) -> void:
	if glosnosc > glosnosc_cel:
		glosnosc -= glosnosc_delta
		ustawGlosnosc(glosnosc / 255.0)
		if glosnosc < glosnosc_cel: glosnosc = glosnosc_cel
	elif glosnosc < glosnosc_cel:
		glosnosc += glosnosc_delta
		ustawGlosnosc(glosnosc / 255.0)
		if glosnosc > glosnosc_cel: glosnosc = glosnosc_cel

func przejscie(scena: String):
	var s = get_tree().current_scene
	var p = preload("res://inne/Przejscie.tscn").instantiate()
	s.add_child(p)
	
	var callback = func(_anim): animacja_koniec(scena)
	glosnosc_cel = 0
	glosnosc_delta = 4
	
	var animator = p.get_node("Animator")
	animator.play("przejscie_start")
	animator.connect("animation_finished", callback.call)

func animacja_koniec(scena: String):
	get_tree().current_scene.queue_free()
	var s = load(scena).instantiate()
	get_tree().root.add_child(s)
	get_tree().current_scene = s
	
	var p = preload("res://inne/Przejscie.tscn").instantiate()
	s.add_child(p)
	
	var callback = func(_anim): przejscie_koniec(p)
	glosnosc_cel = 255
	
	var animator = p.get_node("Animator")
	animator.play("przejscie_koniec")
	animator.connect("animation_finished", callback.call)

func przejscie_koniec(p: Node):
	p.queue_free()

func wyjdz():
	var s = get_tree().current_scene
	var p = preload("res://inne/Przejscie.tscn").instantiate()
	s.add_child(p)
	
	var callback = func(_anim): get_tree().quit()
	
	var animator = p.get_node("Animator")
	animator.play("przejscie_start")
	animator.connect("animation_finished", callback.call)
