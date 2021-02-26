extends RigidBody2D
var expl = preload("res://Char/Expl.tscn")

func _on_Bullet_body_entered(body):
	if !body.is_in_group("player"):
		var expl_instance = expl.instance()
		expl_instance.position = get_global_position()
		get_tree().get_root().add_child(expl_instance)
		queue_free()
