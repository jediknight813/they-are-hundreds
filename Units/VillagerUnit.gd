extends KinematicBody2D

export var current_action = "idle"
export var unit_selected = false
export (int) var speed = 200
export var health = 100
export var gather_amount = 5
export var current_health = 50

export var unit_name = "villager"
export var discription = "gathers resources"


var target = Vector2()
var velocity = Vector2()


func _ready():
	target = self.position


func _process(delta):
	if unit_selected == false:
		$UnitSelection/CollisionShape2D2.disabled = false 
	else:
		$UnitSelection/CollisionShape2D2.disabled = false 

func _input(event):
	if event.is_action_pressed('move_to') && unit_selected == true:
		target = get_global_mouse_position()
	else:
		if event.is_action_pressed('click'):
			$UnitDataMenuDisplay.hide_unit_data()
			$BuildingMenu.hide_building_menu()
			unit_selected = false


func _physics_process(delta):
	$UnitDataMenuDisplay.set_health(health, current_health)
	velocity = (target - position).normalized() * speed
	if (target - position).length() > 5:
		velocity = move_and_slide(velocity)
	

func _on_UnitSelection_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				$BuildingMenu.show_building_menu()
				$UnitDataMenuDisplay.show_unit_data()
				$UnitDataMenuDisplay.set_health(health, current_health)
				$UnitDataMenuDisplay.set_unit_discription(discription)
				$UnitDataMenuDisplay.set_unit_name(unit_name)
				unit_selected = true


func resource_tick(area):
	yield(get_tree().create_timer(5), "timeout")
	if current_action != "idle":
		gather_resource(current_action, area)
	resource_tick(area)


func _on_DetectionArea_area_entered(area):
	if area.name == "CollectionArea":
		gather_resource(area.get_parent().resource_type, area)
		resource_tick(area)
			
			
func _on_DetectionArea_area_exited(area):
	if area.name == "CollectionArea":
		current_action = "idle"


func gather_resource(type, area):
	if is_instance_valid(area):
		if type == "wood":
			current_action = "wood"
			area.get_parent().gather_resource(gather_amount)
			get_parent().get_parent().add_wood(gather_amount)
			
		if type == "food":
			current_action = "food"
			area.get_parent().gather_resource(gather_amount)
			get_parent().get_parent().add_food(gather_amount)
			
		if type == "gold":
			current_action = "gold"
			area.get_parent().gather_resource(gather_amount)
			get_parent().get_parent().add_gold(gather_amount)

