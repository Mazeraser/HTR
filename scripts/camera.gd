extends Area2D

export (int) var speed = 1

func _process(delta):
	position.y -= speed*0.1


func _on_camera_body_exited(body):
	var player = get_parent().get_node("player1")
	player.death = true
