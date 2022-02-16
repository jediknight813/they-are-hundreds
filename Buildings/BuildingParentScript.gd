extends StaticBody2D

export var name_of_building = ""
export var discription = ""
export var building_type = ""

export var max_health = 100
export var current_health = 100

var building_selected = false

export var building_effects = {"population": 10}

#building types
	#economic
	#military
	#defence
	#upgrades

func _ready():
	get_parent().get_parent().add_or_remove_population(building_effects["population"])
	

func _process(delta):
	if building_selected == false:
		$CollisionShape2D.disabled = true 
		$CollisionShape2D2.disabled = true 
	else:
		$CollisionShape2D.disabled = false 
		$CollisionShape2D2.disabled = false 

func _input(event):
	if event.is_action_pressed('click'):
		$UnitDataMenuDisplay.hide_unit_data()
		building_selected = false



func _on_MouseArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				$UnitDataMenuDisplay.show_unit_data()
				$UnitDataMenuDisplay.set_health(max_health, current_health)
				$UnitDataMenuDisplay.set_unit_discription(discription)
				$UnitDataMenuDisplay.set_unit_name(name_of_building)
