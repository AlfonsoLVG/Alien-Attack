extends Node2D

var lives = 3
var score = 0

@onready var player = $Player
@onready var hud = $UI/HUD
@onready var ui = $UI

var game_over_scene = preload("res://scenes/game_over_screen.tscn")

func _ready():
	hud.set_score_label(score)
	hud.set_lives_left(lives)

func _on_death_zone_area_entered(area: Area2D) -> void:
	area.queue_free()
	#if area.has_method("die"):
		#area.die()

func _on_player_took_damage() -> void:
	lives -= 1
	hud.set_lives_left(lives)
	if lives == 0:
		player.die()
		var game_over_instance = game_over_scene.instantiate()
		await get_tree().create_timer(1).timeout
		game_over_instance.set_score(score)
		ui.add_child(game_over_instance)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)

func _on_enemy_died():
	score += 100
	hud.set_score_label(score)

func _on_enemy_spawner_path_enemy_spawned(path_enemy_instance: Variant) -> void:
	add_child(path_enemy_instance)
	path_enemy_instance.enemy.connect("died", _on_enemy_died)
