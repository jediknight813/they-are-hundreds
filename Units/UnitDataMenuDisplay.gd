extends CanvasLayer


func set_unit_name(name):
	$Node2D/unitNameContainer/Label.text = name


func set_unit_discription(discription):
	$Node2D/RichTextLabel.bbcode_text = "[center]" + discription + "[/center]"


func set_health(max_health, current_health):
	$Node2D/HealthBar.max_value = max_health
	$Node2D/HealthBar.value = current_health


func show_unit_data():
	for i in self.get_children():
		i.show()

func hide_unit_data():
	for i in self.get_children():
		i.hide()

func _ready():
	hide_unit_data()
	
	
	
