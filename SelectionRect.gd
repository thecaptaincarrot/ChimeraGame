extends ColorRect

var fade_in = true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fade_in:
		modulate.a8 += delta * 32.0
		if modulate.a8 > 64.0:
			fade_in = false
	else:
		modulate.a8 -= delta * 32.0
		if modulate.a8 <= 16.0:
			fade_in = true
