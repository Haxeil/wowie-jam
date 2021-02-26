extends Node2D

onready var player = get_parent();

var player_velocity = Vector2()





func movement() -> void:

	if Input.is_action_pressed("Up") and not Input.is_action_pressed("Down"):
		player_velocity.y = -1
	elif Input.is_action_pressed("Down") and not Input.is_action_pressed("Up"):
		player_velocity.y = 1
	else:
		player_velocity.y = 0
	
	if Input.is_action_pressed("Right") and not Input.is_action_pressed("Left"):
		player_velocity.x = 1
	elif Input.is_action_pressed("Left") and not Input.is_action_pressed("Right"):
		player_velocity.x = -1
	else:
		player_velocity.x = 0

	player.move_and_slide(player_velocity.normalized() * player.SPEED);

func _physics_process(delta):
	player.look_at(get_global_mouse_position());
	movement()
	






