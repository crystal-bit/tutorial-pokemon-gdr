extends Node

var pokemons = []

func _ready() -> void:
	load_pokemons()
	print(pokemons.size())

func load_pokemons():
	var f = File.new()
	var line_idx = 0
	f.open("res://data/pokemons.csv", File.READ)
	while !f.eof_reached():
		var p = f.get_csv_line(",")
		# skip header
		if line_idx == 0:
			line_idx += 1
			continue
		var pres = PokemonResource.new()
		pres.pokedex_id = p[0]
		pres.pokemon_name = p[1]
		pres.hp = p[5]
		pres.attack = p[6]
		pres.defense = p[7]
		pres.special = p[8]
		pres.speed = p[10]
		pres.front_texture = load("res://assets/pokemons/" + p[0] + ".png")
		pres.back_texture = load("res://assets/pokemons/back/" + p[0] + ".png")
		line_idx += 1
		pokemons.append(pres)
	f.close()
