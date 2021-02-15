extends Sprite

var hp: int = 100
var attack := 50


func _ready():
	var current_attack := get_current_attack()
	if current_attack:
		reduce_hp(current_attack)


func reduce_hp(amount: int) -> void:
	hp = hp - amount


func get_current_attack() -> int:
	# ...
	var multiplier = 1.8
	# ...
	return attack * multiplier
