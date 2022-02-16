extends CanvasLayer


func hide_building_menu():
	$BuildingMenuParent.hide()

func show_building_menu():
	$BuildingMenuParent.show()

func _ready():
	$BuildingMenuParent.hide()
