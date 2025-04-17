extends Node2D

var lives = 3

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
