extends Camera2D

var zoom_min = Vector2(.2, .2)

var zoom_max = Vector2(2, 2)

var zoom_speed = Vector2(.2, .2)

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			if event.button_index == BUTTON_WHEEL_UP:
				if zoom > zoom_min:
					self.zoom -= zoom_speed
					
			if event.button_index == BUTTON_WHEEL_DOWN:
				if zoom < zoom_max:
					self.zoom += zoom_speed
