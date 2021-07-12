extends VBoxContainer


func set_labels(pokemons):
	for c in get_children():
		remove_child(c)

	for p in pokemons:
		var label = Label.new()
		label.text = p.pokemon_name
		add_child(label)
		get_node("../Pokemons").select_pokemon(p)
