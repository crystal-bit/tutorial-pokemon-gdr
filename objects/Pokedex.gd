extends Node

var pokemons = []


func _ready() -> void:
	var f = File.new()
	f.open("res://data/pokemons.csv", File.READ)
	while !f.eof_reached():
		var line = f.get_csv_line(",")
		var poke_res = PokemonResource.new()
		poke_res.pokedex_id = int(line[0])
		poke_res.pokemon_name = line[1]
		poke_res.hp = line[5]
		poke_res.attack = line[6]
		poke_res.defense = line[7]
		poke_res.special = line[8]
		poke_res.speed = line[10]
		poke_res.front_texture = load("res://assets/pokemons/" + line[0] + ".png")
		poke_res.back_texture = load("res://assets/pokemons/back/" + line[0] + ".png")
		pokemons.append(poke_res)
	f.close()


func load_pokemons():
	var file = File.new()
	file.open("res://data/pokemons.csv", File.READ)
	while !file.eof_reached():
		var line = file.get_csv_line(",")
		var poke_res = PokemonResource.new()
		poke_res.pokedex_id = int(line[0])
		poke_res.pokemon_name = line[1]
		poke_res.hp = line[5]
		poke_res.attack = line[6]
		poke_res.defense = line[7]
		poke_res.special = line[8]
		poke_res.speed = line[10]
		poke_res.front_texture = load("res://assets/pokemons/" + line[0] + ".png")
		poke_res.back_texture = load("res://assets/pokemons/back/" + line[0] + ".png")
		pokemons.append(poke_res)
	file.close()
