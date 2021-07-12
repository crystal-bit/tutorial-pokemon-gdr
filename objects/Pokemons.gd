extends Node2D

var hovered_pokemon


func show_pokemons(pokemons):
	var y = 0
	var x = 0
	for poke in pokemons:
		var p = Pokemon.new()
		p.set_pokemon_resource(poke)
		p.modulate.a = 0.3
		p.position.x = 40 + x
		p.position.y = 40 + y
		if x > 350:
			x = 0
			y += 40
		else:
			x+= 50
		p.scale *= 0.7
		add_child(p)
		var mouse_hover: Area2D = load("res://objects/pokemon/MouseHover.tscn").instance()
		mouse_hover.connect("mouse_entered", self, "on_mouse_hover", [p])
		mouse_hover.connect("mouse_exited", self, "on_mouse_exited", [p])
		p.add_child(mouse_hover)


func on_mouse_hover(p):
	if hovered_pokemon == p:
		return
	hovered_pokemon = p
	print(hovered_pokemon.pokemon_resource.pokemon_name)


func on_mouse_exited(p):
	hovered_pokemon = null


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.pressed:
			if hovered_pokemon:
				select_pokemon_anim(hovered_pokemon)


func select_pokemon_anim(poke):
	if poke.has_meta('tweening') and poke.get_meta('tweening') == true:
		return
	if poke.modulate.a == 1:
		poke.modulate.a = 0.3
		return
	poke.modulate.a = 1
	var t = Tween.new()
	t.interpolate_property(poke, "position:y", poke.position.y, poke.position.y - 20, 0.15, Tween.TRANS_QUAD, Tween.EASE_OUT)
	t.interpolate_property(poke, "position:y", poke.position.y - 20, poke.position.y, 0.3, Tween.TRANS_BOUNCE, Tween.EASE_OUT, 0.15)
	poke.add_child(t)
	poke.set_meta('tweening', true)
	t.start()
	yield(t, "tween_completed")
	poke.set_meta('tweening', false)


func select_pokemon(poke_resource):
	for p in get_children():
		if p.pokemon_resource.pokemon_name == poke_resource.pokemon_name:
			p.modulate.a = 1


func get_selected_pokemons():
	var pkmns = []
	for c in get_children():
		if c.modulate.a == 1:
			pkmns.append(c)
	return pkmns
