extends Node2D


var tileParser = preload("res://Game/TileParser.tscn")
var tiles


var obstacle_tiles = []


func clean_tile_obstacles():
	obstacle_tiles = []
	yield(get_tree().create_timer(0.4),"timeout")
	get_parent().get_node("GameMap").update_obstacle_list(obstacle_tiles)


func add_obstacle_tile(tile):
	if obstacle_tiles.has(tile) == false:
		obstacle_tiles.append(tile)
		get_parent().get_node("GameMap").update_obstacle_list(obstacle_tiles)
		

func _ready():
	tiles = get_parent().get_node("GameMap").get_used_cells()
	ParseTiles()


func ParseTiles():
	var index = 0
	var tiles_to_send = []
	for i in tiles:
		if tiles_to_send.size() < 20:
			tiles_to_send.append(i)
		else:
			var new_tileParser = tileParser.instance()
			new_tileParser.set_tiles_to_check(tiles_to_send)
			self.add_child(new_tileParser)
			tiles_to_send = []



