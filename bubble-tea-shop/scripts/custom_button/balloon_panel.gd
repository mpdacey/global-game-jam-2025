extends Panel

func set_dialogue(content : String):
	var dialogue_label = $Dialogue/VBoxContainer/DialogueLabel
	dialogue_label.text = content
	custom_minimum_size.y *= (content.length() / 34 + 1)
