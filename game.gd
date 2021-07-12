extends Node2D

onready var labels = {
	name = $VBoxContainer/name,
	hp = $VBoxContainer/hp
}

func _ready():
#	var data = $PokedexData.pokemons[150]
#	$PokemonNode.set_pokemon_resource(data)
	show_pokemons()


func show_pokemons():
	labels.name.text = ""
	var pokemons = $PokedexData.pokemons
	var y = 0
	var x = 0
	for poke in pokemons:
		var p = Pokemon.new()
		p.set_pokemon_resource(poke)
		p.position.x = 30 + x
		p.position.y = 20 + y
		if x > 350:
			x = 0
			y += 40
		else:
			x+= 50
		p.scale *= 0.7
		add_child(p)

func on_twn_started(twn, some, p: PokemonResource):
	yield(get_tree().create_timer(2), "timeout")
	labels.name.text = str(p.pokedex_id) + " - " +p.pokemon_name
	labels.hp.text = "HP: " + str(p.hp)

