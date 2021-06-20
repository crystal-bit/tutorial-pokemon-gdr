extends Node

var pokemons = []

func _ready() -> void:
	load_pokemons()

func load_pokemons():
	var file = File.new()
	file.open("res://data/pokemons.csv", File.READ)
	while !file.eof_reached():
		var p = file.get_csv_line(",")
		var poke_res = PokemonResource.new()
		poke_res.pokedex_id = int(p[0])
		poke_res.pokemon_name = p[1]
		poke_res.hp = p[5]
		poke_res.attack = p[6]
		poke_res.defense = p[7]
		poke_res.special = p[8]
		poke_res.speed = p[10]
		poke_res.front_texture = load("res://assets/pokemons/" + p[0] + ".png")
		poke_res.back_texture = load("res://assets/pokemons/back/" + p[0] + ".png")
		pokemons.append(poke_res)
	file.close()
