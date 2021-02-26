extends RigidBody2D

var bullet = preload("res://Char/Bullet.tscn")

func _on_Box_body_shape_entered():
	queue_free()
