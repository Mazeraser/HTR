extends KinematicBody2D

var velocity = Vector2()
var death = false
const SPEED = 80
const JUMP = 250
const GRAV = 10

func go():
	
	if Input.is_action_pressed("LEFT"):
		velocity.x = -SPEED
		$AnimatedSprite.flip_h = true
		if  is_on_floor():
			$AnimatedSprite.play("go")
		
	elif Input.is_action_pressed("RIGHT"):
		velocity.x = SPEED
		$AnimatedSprite.flip_h = false
		if  is_on_floor():
			$AnimatedSprite.play("go")
		
	else:
		velocity.x = 0
		$AnimatedSprite.flip_h = false
		if  is_on_floor():
			$AnimatedSprite.play("idle")
		
	if Input.is_action_just_pressed("JUMP") and is_on_floor():
		velocity.y = -JUMP
		$AnimatedSprite.play("jump")

	
func _physics_process(delta):
	if death == false:
		go()
	
	velocity = move_and_slide(velocity, Vector2.UP)
	velocity.y += GRAV
	
	$CanvasLayer/Label.visible = death
	$CanvasLayer/Button.visible = death


func _on_Button_pressed():
	get_tree().reload_current_scene()
