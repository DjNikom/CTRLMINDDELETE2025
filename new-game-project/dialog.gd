extends Node
@onready var dialog = self.find_child("Control")

# Called when the node enters the scene tree for the first time.
func dialogue(text: String, wait: bool):
	if dialog.visible:
		return
	dialog.visible = true
	var txtObj = dialog.find_child("ColorRect").find_child("Label")
	var lenght = text.length()
	for i in range(1, lenght+1):
		txtObj.text = text.erase(i, 843765894)
		await get_tree().create_timer(0.05).timeout
	if wait:
		await get_tree().create_timer(3).timeout
	dialog.visible = false
	
