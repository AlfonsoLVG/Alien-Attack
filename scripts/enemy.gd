extends Area2D

signal died

@export var speed = 300

@onready var hit_sound = $HitSound

func _physics_process(delta):
	global_position.x -= speed * delta

func die():
	emit_signal("died")
	hit_sound.play()
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage()
