extends Area2D

var tiles_to_check = []
var current_tile

func _ready():
	check_tiles()


func set_tiles_to_check(tiles):
	tiles_to_check = tiles


func check_tiles(): 
	if tiles_to_check.size() > 1:
		for i in tiles_to_check:
			current_tile = i
			self.position = get_parent().get_parent().get_node("GameMap").get_cell_position(i)
			yield(get_tree().create_timer(0.02),"timeout")
	check_tiles()


func _on_TileParser_body_entered(body):
	if not body.get("obstacle") == null:
		get_parent().add_obstacle_tile(current_tile)
	
	
	
	
