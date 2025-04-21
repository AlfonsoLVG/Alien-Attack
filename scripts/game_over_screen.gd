extends Control

func set_score(score):
	$Panel/Score.text = "SCORE: " + str(score)

func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()
