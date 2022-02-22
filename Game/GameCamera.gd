extends KinematicBody2D


var speed = 300  # speed in pixels/sec
var velocity = Vector2.ZERO


func get_input():
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	# Make sure diagonal movement isn't faster
	velocity = velocity.normalized() * speed


func return_current_direction():
	return $CurrentDirection.rotation_degrees


func _physics_process(delta):
	$CurrentDirection.rotation_degrees = 0
	get_input()
	velocity = move_and_slide(velocity)
	$CurrentDirection.look_at(get_global_mouse_position())
