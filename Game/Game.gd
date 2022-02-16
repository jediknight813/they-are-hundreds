extends Node2D

var wood = 3
var gold = 3
var food = 3
var current_age = 0

var max_population = 10
var current_population = 0 

func _ready():
	pass # Replace with function body.


func _process(delta):
	current_population = $UnitsParent.get_children().size()

func add_or_remove_population(amount):
	max_population += amount

func return_current_and_max_population():
	return (str(current_population)+"/"+str(max_population))

func add_wood(amount):
	wood += amount
	
	
func add_food(amount):
	food += amount


func add_gold(amount):
	gold += amount


func return_food():
	return food


func return_wood():
	return wood


func return_gold():
	return gold

func return_current_age():
	return current_age



func place_building(building_cost, building_name):
	$building_placement_area.place_building(building_cost, building_name)
						
						
						
func return_villagers_on_resource():
	var data = {"wood": 0, "gold": 0, "food": 0}
	for i in $UnitsParent.get_children():
		if i.current_action == "wood":
			data["wood"] += 1
		if i.current_action == "food":
			data["food"] += 1
		if i.current_action == "gold":
			data["gold"] += 1
	return data

