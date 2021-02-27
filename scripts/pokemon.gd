extends Sprite

var hp: int = 50
var attack: int = 40


func receive_damage(amount: int):
	hp -= amount
