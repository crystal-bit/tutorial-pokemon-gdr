extends Node2D

onready var labels = {
	name = $VBoxContainer/name,
	hp = $VBoxContainer/hp
}

func _ready():
	show_pokemons()


func show_pokemons():
	labels.name.text = ""	
	var pokemons = $PokedexData.pokemons
	for poke in pokemons:
		var p = Pokemon.new()
		p.set_pokemon_resource(poke)
		p.position.x = 130 + abs(250 * sin(poke.pokedex_id / 10.0))
		p.position.y = 350 + poke.pokedex_id * 50
		add_child(p)
		var t = Tween.new()
		p.add_child(t)
		t.interpolate_property(p, 'position:y', p.position.y, poke.pokedex_id * 0.15, 3, Tween.TRANS_LINEAR, Tween.EASE_IN, .1 * poke.pokedex_id)
		t.start()
		t.connect("tween_started", self, "on_twn_started", [poke])
		
		
func on_twn_started(twn, some, p: PokemonResource):
	yield(get_tree().create_timer(2), "timeout")
	labels.name.text = str(p.pokedex_id) + " - " +p.pokemon_name
	labels.hp.text = "HP: " + str(p.hp)
	
