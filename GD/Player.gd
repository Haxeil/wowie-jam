extends KinematicBody2D

var speed = 400 * 2
var velocity = Vector2()
var bullet = preload("res://Char/Bullet.tscn")
var bullet_speed = 2000

var fire_rate = 0.2
var can_fire = true
var has_gun = false

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	if Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	if Input.is_action_pressed('ui_down'):
		velocity.y += 1
	if Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	velocity = velocity.normalized() * speed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
	look_at(get_global_mouse_position())
	$State.play("Idle")
	
	if Input.is_action_pressed("fire") and can_fire:
		$BulletPoint/Particles2D.emitting = true
		var bullet_instance = bullet.instance()
		bullet_instance.position = $BulletPoint.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2(),Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		$BulletPoint/Particles2D.emitting = false
		can_fire = true
