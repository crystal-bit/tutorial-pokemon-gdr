extends Node2D


func _ready():
	var pokemons = $PokedexData.pokemons
	$Pokemons.show_pokemons(pokemons)

	var f = File.new()
	if f.file_exists("user://game_save.tres"):
		load_saved_pokemons()


func load_saved_pokemons():
	var game_save = load("user://game_save.tres") as GameSave
	if game_save:
		$SavedPokemons.set_labels(game_save.pokemons)
	else:
		print("Error while loading game save")



func _on_Button_pressed() -> void:
	var game_save = GameSave.new()
	game_save.pokemons = []
	ResourceSaver.save("user://game_save.tres", game_save)
	var pokemon_nodes = $Pokemons.get_selected_pokemons()
	for node in pokemon_nodes:
		game_save.pokemons.append(node.pokemon_resource)
		print(node.pokemon_resource.pokemon_name)

	var status = ResourceSaver.save("user://game_save.tres", game_save)
	if status == OK:
		print("Game saved")
		load_saved_pokemons()
	else:
		print("Error while saving: ", status)

