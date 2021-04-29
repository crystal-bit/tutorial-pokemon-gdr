class_name Pokemon, "res://assets/pokeball.png"
extends Sprite

export var pokemon_resource: Resource

func _ready() -> void:
	print_pokemon_name(pokemon_resource)
	print(pokemon_resource.get_level())

func print_pokemon_name(p1: PokemonResource):
	print(p1.pokemon_name)
