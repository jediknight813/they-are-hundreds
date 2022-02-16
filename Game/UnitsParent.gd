extends Node2D


var villager = preload("res://Units/VillagerUnit.tscn")

func _ready():
	var new_villager = villager.instance()
	self.add_child(new_villager)
	
