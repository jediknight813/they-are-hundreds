extends Node2D

var unit_positions = []

var row_size = 3

var unitPosition = preload("res://Game/UnitPosition.tscn")

var positive_x_position = 0
var negative_x_position = 0

var y_position = 0

var negative_position = false

var current_direction = 0


var updated_units = []


func _input(event):
	unit_positions = []
	for c in self.get_children():
		unit_positions.append(c.global_position)
				
	var index = 0
	self.position = get_global_mouse_position()
	if event.is_action_pressed('move_to'):
		updated_units = []
		for i in get_parent().get_node("Units").get_children():
			if i.selected == true:
				updated_units.append(i)
		
		create_unit_positions(updated_units)
		
		for i in get_parent().get_node("Units").get_children():
			if i.selected == true:
				current_direction = i.rotation_degrees
				i.set_path(unit_positions[index])
				index += 1
		
		#var target = get_global_mouse_position()
		#var new_path = get_parent().get_parent().get_node("GameMap").find_path(global_position, target)
		#get_parent().get_parent().get_node("UnitFormation").set_current_direction(current_direction)
		#path = new_path



func _process(delta):
	updated_units = []
	for i in get_parent().get_node("Units").get_children():
		if i.selected == true:
			updated_units.append(i)
		
	create_unit_positions(updated_units)



func set_current_direction(direction):
	current_direction = direction


func create_unit_positions(unit_list):
	self.position = get_global_mouse_position()
	positive_x_position = 0
	negative_x_position = 0
	y_position = 0
	
	var units_in_row = 0
	var loop_started = false
	for b in self.get_children():
		b.queue_free()
	
	for i in unit_list:
		var new_unit_position = unitPosition.instance()
		
		
		if negative_position == false:
			new_unit_position.position = Vector2(positive_x_position, y_position)
			positive_x_position += 50
			self.add_child(new_unit_position)
			units_in_row += 1
			
		if negative_position == true:
			new_unit_position.position = Vector2(negative_x_position, y_position)
			negative_x_position -= 50
			self.add_child(new_unit_position)
			units_in_row += 1
			
			
		if 	negative_position == true:
			negative_position = false
			pass
		else:
			negative_position = true
			pass
		

		self.rotation_degrees = current_direction - 90


