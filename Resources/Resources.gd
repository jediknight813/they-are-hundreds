extends Node2D

export var amount_of_resource = 100
export var resource_start_value = 100

export var resource_name = "tree"
export var resource_discription = "a tall tree"

export var resource_type = "wood"

var unit_selected = false


func _input(event):
	if event.is_action_pressed('click'):
		$UnitDataMenuDisplay.hide_unit_data()
		unit_selected = false

func _process(delta):
	$UnitDataMenuDisplay.set_health(resource_start_value, amount_of_resource)


func gather_resource(amount):
	amount_of_resource -= amount
	if amount_of_resource < 0:
		self.queue_free()


func _on_CollectionArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				$UnitDataMenuDisplay.show_unit_data()
				$UnitDataMenuDisplay.set_health(resource_start_value, amount_of_resource)
				$UnitDataMenuDisplay.set_unit_discription(resource_discription)
				$UnitDataMenuDisplay.set_unit_name(resource_name)	
				unit_selected = true


