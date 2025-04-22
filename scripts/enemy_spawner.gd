extends Node2D

signal enemy_spawned(enemy_instance)
signal path_enemy_spawned(path_enemy_instance)

@onready var timer = $Timer
@onready var spawn_positions = $SpawnPositions

var enemy_scene = preload("res://scenes/enemy.tscn")
var path_enemy_scene = preload("res://scenes/path_enemy.tscn")

func _ready():
	timer.connect("timeout", _timeout)
	
func _timeout():
	spawn_enemy()

func spawn_enemy():
	var positions = spawn_positions.get_children()
	var enemy_instance = enemy_scene.instantiate()
	enemy_instance.global_position = positions.pick_random().global_position
	emit_signal("enemy_spawned", enemy_instance)


func _on_timer_path_timeout() -> void:
	var path_enemy_instance = path_enemy_scene.instantiate()
	emit_signal("path_enemy_spawned", path_enemy_instance)
