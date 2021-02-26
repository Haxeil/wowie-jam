extends AnimatedSprite

func _on_Expl_animation_finished():
	queue_free()
