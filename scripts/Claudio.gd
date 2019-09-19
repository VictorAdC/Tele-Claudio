extends KinematicBody2D

const SPEED = 400
const JUMP_FORCE = 1000
const GRAVITY = 50
const MAX_FALL_SPEED = 1000

var motion = Vector2(0,0)

func _physics_process(delta):

	var animation = get_node("AnimatedSprite")

	motion.x = 0
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

	var grounded = is_on_floor()

	motion.y += GRAVITY
	if grounded and Input.is_action_pressed("ui_up"):
		motion.y = -JUMP_FORCE
	if grounded and motion.y >= 0:
		motion.y = 5
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED
	if !grounded:
		animation.play("jump")

	move_and_slide(motion, Vector2(0,-1))
