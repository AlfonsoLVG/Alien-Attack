extends Node2D

signal enemy_spawned(enemy_instance)

@onready var timer = $Timer
@onready var spawn_positions = $SpawnPositions

var enemy_scene = preload("res://scenes/enemy.tscn")

func _ready():
	timer.connect("timeout", _timeout)
	
func _timeout():
	spawn_enemy()

func spawn_enemy():
	var positions = spawn_positions.get_children()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = positions.pick_random().global_position
	emit_signal("enemy_spawned", enemy_instance)
