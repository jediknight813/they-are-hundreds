extends KinematicBody2D


var selected = false
#var obstacle = false
var selectable = true
var path = []
var threshold = 16
var unit_speed = 100
var velocity: Vector2 = Vector2.ZERO

var current_direction = 0


func _input(event):
	if selected == true && event.is_action_pressed('move_to'):
		current_direction = get_parent().get_parent().get_node("GameCamera").return_current_direction()
		get_parent().get_parent().get_node("UnitFormation").set_current_direction(current_direction)
		

func set_path(target):
	var new_path = get_parent().get_parent().get_node("GameMap").find_path(global_position, target)
	path = new_path


func _physics_process(delta):
	if path.size() > 0:
		move_to_target()
		
func move_to_target():
	if global_position.distance_to(path[0]) < threshold:
		path.remove(0)
	else:
		var direction = global_position.direction_to(path[0])
		velocity = direction * unit_speed
		velocity = move_and_slide(velocity)
		

		
func _on_VillagerSelectionArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
			if event.button_index == BUTTON_LEFT and event.pressed:
				selected = true

