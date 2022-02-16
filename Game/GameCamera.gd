extends KinematicBody2D

var speed = 300  
var velocity = Vector2.ZERO

func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed('move_right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
		
	#camera zoom
	if Input.is_action_pressed("scroll_up"):
		print("here")
		$Camera2D.Zoom.x += 0.1
		$Camera2D.zoom.y += 0.1
	if Input.is_action_pressed("scroll_down"):
		print("here")
		$Camera2D.zoom.x -= 0.1
		$Camera2D.zoom.y -= 0.1


	velocity = velocity.normalized() * speed

func _physics_process(delta):
	update_resource_count()
	$CanvasLayer/PopulationCount/PopulationAmount.text = get_parent().return_current_and_max_population()
	get_input()
	velocity = move_and_slide(velocity)


func update_resource_count():
	var villager_on_resources = get_parent().return_villagers_on_resource()
	$CanvasLayer/ResourseBackground2/ResourceAmount.text = str(get_parent().return_food())
	$CanvasLayer/ResourseBackground/ResourceAmount.text = str(get_parent().return_gold())
	$CanvasLayer/ResourseBackground3/ResourceAmount.text = str(get_parent().return_wood())
	
	$CanvasLayer/ResourseBackground/VilagersOnResource.text = str(villager_on_resources["gold"])
	$CanvasLayer/ResourseBackground2/VilagersOnResource.text = str(villager_on_resources["food"])
	$CanvasLayer/ResourseBackground3/VilagersOnResource.text = str(villager_on_resources["wood"])
	



