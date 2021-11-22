extends Node

enum {TURTLE,WOLF}

var leg_dict = {}
var body_dict = {}
var head_dict = {}
var heart_dict = {} #Base Stats, and progression?


# Called when the node enters the scene tree for the first time.
func _ready():
	#Body
	#Examples body_dict[] = {"attack":0, "defence": 0, "speed" : 0, "health" : 0}
	body_dict[TURTLE] = {"attack":1, "defence": 10, "speed" : 0, "health" : 60}
	body_dict[WOLF] = {"attack":8, "defence": 3, "speed" : 4, "health" : 40}
	#Legs 
	#Examples leg_dict[] = {"attack":0, "defence": 0, "speed" : 0, "health" : 0}
	leg_dict[TURTLE] = {"attack":3, "defence": 4, "speed" : 1, "health" : 30 }
	leg_dict[WOLF] = {"attack":5, "defence": 2, "speed" : 6, "health" : 15 }
	#Head
	#Examples head_dict[] = {"attack":0, "defence": 0, "speed" : 0, "health" : 0}
	head_dict[TURTLE] = {"attack":4, "defence": 5, "speed" : 0, "health" : 25}
	head_dict[WOLF] = {"attack":10, "defence": 0, "speed" : 2, "health" : 5}


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
