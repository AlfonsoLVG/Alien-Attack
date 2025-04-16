extends Node2D

@onready var timer = $Timer

func _ready():
	timer.connect("timeout", _timeout)
	
func _timeout():
	pass
