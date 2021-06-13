class_name Pokemon, "res://assets/pokeball.png"
extends Sprite

export(Resource) var pokemon_resource setget set_pokemon_resource

func _ready() -> void:
	pass

func set_pokemon_resource(res):
	pokemon_resource = res
	texture = res.front_texture
	print(res.pokedex_id, " ",  res.pokemon_name, " ", res.hp)
