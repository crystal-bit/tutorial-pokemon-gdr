extends Area2D

func _enter_tree() -> void:
	setup()

func setup():
	var poke = get_parent()
	var rect = RectangleShape2D.new()
	if poke.texture:
		rect.extents = poke.texture.get_size() * poke.scale / 2
		rect.extents *= 0.9
		$CollisionShape2D.shape = rect
