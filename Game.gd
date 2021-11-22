extends Node2D

signal player_turn_start
signal enemy_turn_start

var players_turn = true



var menu_vector = Vector2(0,0)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func player_attack():
	var player_chimera = $PlayerMaster/Chimera
	var enemy_chimera = $Enemy/Chimera
	
	var placeholder_attack_power = 50
	
	var damage = placeholder_attack_power * (player_chimera.attack/enemy_chimera.defence)/10
	
	print(damage)
	enemy_chimera.take_damage(damage)
	#any end of turn bullshit
	
	player_turn_end()
	


func player_turn_end():
	#Do anythinge else at end of turn
	emit_signal("enemy_turn_start")
	enemy_decision()
	players_turn = false


func enemy_decision():
	#add decisionmaking later, for now just attack
	enemy_attack()


func enemy_attack():
	#include AI decisionmaking
	var player_chimera = $PlayerMaster/Chimera
	var enemy_chimera = $Enemy/Chimera
	
	var placeholder_attack_power = 50
	
	var damage = placeholder_attack_power * (enemy_chimera.attack/player_chimera.defence)/10
	
	print(damage)
	player_chimera.take_damage(damage)
	#any end of turn bullshit
	
	enemy_turn_end()


func enemy_turn_end():
	#Enemy end of turn 
	emit_signal("player_turn_start")
	players_turn = true
