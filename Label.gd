extends Label

export var poke_resource: Resource

func _ready():
	text = poke_resource.pokemon_name
