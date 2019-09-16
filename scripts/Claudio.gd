extends KinematicBody2D

const SPEED = 750

func _physics_process(delta):
	
	var motion = Vector2(0,0)
	var animation = get_node("AnimatedSprite")
	
	if Input.is_action_pressed("ui_right") && !Input.is_action_pressed("ui_left"):
		motion.x += SPEED
		animation.play("run")
		animation.flip_h = false
	elif Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		motion.x -= SPEED
		animation.play("run")
		animation.flip_h = true
	else:
		animation.play("idle")

	move_and_slide(motion)
