extends Area2D


func _process(delta: float):
	position.x += 10 * delta


func _on_Bullet_body_entered(body):
	if body is Player:
		if body.has_shield():
			body.remove_shield()
		else:
			body.flash()
			print("GAMEOVER")
		queue_free()

	if body is Enemy:
		body.flash()
		print("VICTORY")
		queue_free()
