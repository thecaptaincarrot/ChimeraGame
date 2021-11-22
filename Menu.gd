extends Control

var menu_vector = Vector2(0,0)

var players_turn = true

signal attack_selected


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Panel/SelectionRect.rect_position = Vector2(menu_vector.x * 120, menu_vector.y * 60)


func _unhandled_input(event):
	if !players_turn:
		return
	
	#keyboard things
	if event.is_action_pressed("ui_up"):
		if menu_vector.y > 0:
			menu_vector.y -= 1
	elif event.is_action_pressed("ui_down"):
		if menu_vector.y < 1: #1 is the greatest possible value, will this change?
			menu_vector.y += 1
	elif event.is_action_pressed("ui_right"):
		if menu_vector.x < 1: #1 is the greatest possible value, will this change?
			menu_vector.x += 1
	elif event.is_action_pressed("ui_left"):
		if menu_vector.x > 0:
			menu_vector.x -= 1
	elif event.is_action_pressed("ui_accept"):
		match menu_vector:
			Vector2(0,0):
				emit_signal("attack_selected")
	
	

func _on_Game_player_turn_start():
	print("My turn")
	players_turn = true
	$Panel/SelectionRect.show()


func _on_Game_enemy_turn_start():
	print("Not my turn")
	players_turn = false
	$Panel/SelectionRect.hide()
