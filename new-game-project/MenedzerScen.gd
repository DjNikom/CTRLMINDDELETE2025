extends Node

func przejscie(scena: String):
	var s = get_tree().current_scene
	var p = preload("res://inne/Przejscie.tscn").instantiate()
	s.add_child(p)
	
	var callback = func(_anim): animacja_koniec(scena)
	
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
	
	var animator = p.get_node("Animator")
	animator.play("przejscie_koniec")
	animator.connect("animation_finished", callback.call)

func przejscie_koniec(p: Node):
	p.queue_free()
