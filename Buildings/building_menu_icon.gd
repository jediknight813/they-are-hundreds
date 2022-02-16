extends Node2D

export var building_cost = {"wood": 0, "gold": 0, "food": 0}
export var unlock_age = 0
export var building_name = "house"
export var building_discription = "contains space for 5 people"
export var building_instance_scene = ""
var game_node

#check if player has enough resources and if age is unlocked
	# if true put the building on the mouse curser


func _ready():
	$BuildingIcons.play(building_name)
	$Building_Info_Parent.hide()
	game_node = get_parent().get_parent().get_parent().get_parent().get_parent()

		
# for buying a building
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				if (game_node.return_wood() > building_cost["wood"] and game_node.return_food() >= building_cost["food"] and game_node.return_gold() >= building_cost["gold"] and game_node.return_current_age() >= unlock_age):
					game_node.place_building(building_cost, building_name)


#display building data
func _on_Area2D_mouse_entered():
	$Building_Info_Parent.show()
	$Building_Info_Parent/Building_name.bbcode_text = "[center]" + building_name + "[/center]"
	$Building_Info_Parent/Building_discription.bbcode_text = "[center]" + building_discription + "[/center]"
	$Building_Info_Parent/wood_cost.text = str(building_cost["wood"])
	$Building_Info_Parent/gold_cost.text = str(building_cost["gold"])
	$Building_Info_Parent/food_cost.text = str(building_cost["food"])


#hide building data
func _on_Area2D_mouse_exited():
	$Building_Info_Parent.hide()
