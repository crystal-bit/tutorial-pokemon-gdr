extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_right"):
		var p = $Pokedex.pokemons[randi() % 12 + 1]
		$PokemonNode.set_pokemon_resource(p)
