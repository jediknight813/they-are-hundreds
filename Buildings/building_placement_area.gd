extends Area2D

var is_placing_building = false
var vaild_placement = false

var building_cost
var building_name

var house = preload("res://Buildings/HouseBuilding.tscn")


func _ready():
	self.hide()
	
	
func place_building(build_cost, build_name):	
	is_placing_building = true
	building_cost = build_cost
	building_name = build_name


func _process(delta):
	if (is_placing_building == true):
		self.position = get_global_mouse_position()
		self.show()
		
		#places building
		if Input.is_action_just_released("click") and vaild_placement == true:
			get_parent().add_food(-building_cost["food"])
			get_parent().add_gold(-building_cost["gold"])
			get_parent().add_wood(-building_cost["wood"])
			if (building_name == "house"):
				var new_house = house.instance()
				new_house.position = get_global_mouse_position()
				get_parent().get_node("BuildingsParent").add_child(new_house)
				
			is_placing_building = false
			
		#cancels building
		if Input.is_action_pressed("move_to"):
			is_placing_building = false
	else:
		self.hide()

func _on_building_placement_area_body_entered(body):
	$BadBuildingPlacement.show()
	vaild_placement = false
	$GoodBuildingPlacement.hide()


func _on_building_placement_area_body_exited(body): 
	if self.get_overlapping_areas().size() == 0 and self.get_overlapping_bodies().size() == 0:
		$BadBuildingPlacement.hide()
		vaild_placement = true
		$GoodBuildingPlacement.show()


func _on_building_placement_area_area_entered(area):
	$BadBuildingPlacement.show()
	vaild_placement = false
	$GoodBuildingPlacement.hide()


func _on_building_placement_area_area_exited(area): 
	if self.get_overlapping_areas().size() == 0 and self.get_overlapping_bodies().size() == 0:
		$BadBuildingPlacement.hide()
		vaild_placement = true
		$GoodBuildingPlacement.show()

