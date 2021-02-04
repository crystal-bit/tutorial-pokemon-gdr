extends Area2D


func _process(delta: float) -> void:
	position.x += delta * 40


func _on_Bullet_body_entered(body: Node) -> void:
	if body is Player:
		body.flash()
		print("Gameover")

	if body is Enemy:
		body.flash()
		print("Victory")

	set_process(false)
