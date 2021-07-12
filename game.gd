extends Node2D


func _ready():
	var pokemons = $PokedexData.pokemons
	$Pokemons.show_pokemons(pokemons)

	var game_save = load("res://game_save.tres") as GameSave
	if game_save:
		for p in game_save.pokemons:
			var label = Label.new()
			label.text = p.pokemon_name
			$SavedPokemons.add_child(label)
			$Pokemons.select_pokemon(p)
	else:
		print("Error while loading game save")


func load_saved_pokemons():
	pass


func _on_Button_pressed() -> void:
	var game_save = GameSave.new()
	game_save.pokemons = []

	var pokemon_nodes = $Pokemons.get_selected_pokemons()
	for node in pokemon_nodes:
		game_save.pokemons.append(node.pokemon_resource)

	var status = ResourceSaver.save("res://game_save.tres", game_save)
	if status == OK:
		print("Game saved")
	else:
		print("Error while saving: ", status)

