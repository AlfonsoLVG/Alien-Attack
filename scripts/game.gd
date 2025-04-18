extends Node2D

var lives = 3
var score = 0

@onready var player = $Player

func _on_death_zone_area_entered(area: Area2D) -> void:
	if area.has_method("die"):
		print(area.name, " has died")
		area.die()

func _on_player_took_damage() -> void:
	lives -= 1
	if lives == 0:
		print("Game over")
		player.die()
	print(lives)

func _on_enemy_spawner_enemy_spawned(enemy_instance: Variant) -> void:
	enemy_instance.connect("died", _on_enemy_died)
	add_child(enemy_instance)
	
func _on_enemy_died():
	score += 100
	print(score)
