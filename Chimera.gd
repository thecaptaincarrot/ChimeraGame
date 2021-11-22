extends Node2D

enum {TURTLE, WOLF,}

var level = 10

var health = 100
var max_health = 100

var attack = 10
var speed = 10
var defence = 5

export var body_type = TURTLE
export var leg_type = WOLF
export var head_type = WOLF


# Called when the node enters the scene tree for the first time.
func _ready():
	$HealthBar.max_value = max_health
	$HealthBar.value = health
	
	update_sprites()
	update_stats()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func take_damage(damage):
	health -= damage
	update_health_bar()


func update_health_bar():
	$HealthBar.value = health


func update_sprites():
	match body_type:
		TURTLE:
			$Sprites/Body.frame = TURTLE
			$Sprites/Head.position = Vector2(-78,12)
			$Sprites/Forelimb.position = Vector2(-42,32)
			$Sprites/Backlegs.position = Vector2(18,30)
		WOLF:
			$Sprites/Body.frame = WOLF
			$Sprites/Head.position = Vector2(-68,-28)
			$Sprites/Forelimb.position = Vector2(-38,24)
			$Sprites/Backlegs.position = Vector2(30,16)

	$Sprites/Backlegs.frame = leg_type
	$Sprites/Forelimb.frame = leg_type
	$Sprites/Head.frame = head_type


func update_stats():
	attack = PartsLookup.head_dict[head_type]["attack"] + PartsLookup.leg_dict[leg_type]["attack"] + PartsLookup.body_dict[body_type]["attack"]
	defence = PartsLookup.head_dict[head_type]["defence"] + PartsLookup.leg_dict[leg_type]["defence"] + PartsLookup.body_dict[body_type]["defence"]
	speed = PartsLookup.head_dict[head_type]["speed"] + PartsLookup.leg_dict[leg_type]["speed"] + PartsLookup.body_dict[body_type]["speed"]
	max_health = PartsLookup.head_dict[head_type]["health"] + PartsLookup.leg_dict[leg_type]["health"] + PartsLookup.body_dict[body_type]["health"]
	health = max_health
	print(name, " attack: ", attack, ", defence: ", defence, ", speed: ",speed,", health: ",health)
