extends Node2D


func _on_death_zone_area_entered(area: Area2D) -> void:
	if area.has_method("die"):
		print(area.name, " has died")
		area.die()
