extends Panel

func set_dialogue(content : String):
	var dialogue_label = $Dialogue/VBoxContainer/DialogueLabel
	dialogue_label.text = content
