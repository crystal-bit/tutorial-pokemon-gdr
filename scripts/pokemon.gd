class_name Pokemon, "res://assets/pokeball.png"
extends Sprite

export var hp: int = 50
export var attack: int = 40

func receive_damage(amount: int):
	hp -= amount
