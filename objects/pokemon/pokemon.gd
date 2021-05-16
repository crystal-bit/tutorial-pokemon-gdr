class_name Pokemon, "res://assets/pokeball.png"
extends Sprite

export(Resource) var pokemon_resource

func _ready() -> void:
	print(pokemon_resource.pokemon_name)
	print(pokemon_resource.pokedex_id)
	print(pokemon_resource.attack)
