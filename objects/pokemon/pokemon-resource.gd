class_name PokemonResource extends Resource

export var pokemon_name: String = ''

# base stats
export var hp: int = 0
export var attack: int = 0
export var defense: int = 0
export var special_attack: int = 0
export var special_defense: int = 0

# moves
export var move_set = []

# dynamic stats
export var current_hp: int = 0
export var experience: int = 0

func get_level_by_experience(expe: int) -> int:
	return expe / 100

func get_level():
	return get_level_by_experience(experience)
