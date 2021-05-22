class_name Pokemon, "res://assets/pokeball.png"
extends Sprite

export(Resource) var pokemon_resource

func _ready() -> void:
	texture = pokemon_resource.front_texture
	yield(get_tree().create_timer(2), "timeout")

	# evolve
	pokemon_resource = create_blastoise()
	texture = pokemon_resource.front_texture
	print(pokemon_resource.pokemon_name)

func create_blastoise():
	var blastoise = PokemonResource.new()
	blastoise.pokemon_name = "Blastoise"
	blastoise.pokedex_id = 9
	blastoise.front_texture = load("res://assets/pokemons/9.png")
	blastoise.back_texture = load("res://assets/pokemons/back/9.png")
	blastoise.attack = 83
	blastoise.defense = 100
	blastoise.special = 85
	blastoise.hp = 79
	blastoise.speed = 78
	return blastoise
