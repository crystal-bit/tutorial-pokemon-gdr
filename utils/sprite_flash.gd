class_name sprite_flash
extends Node

var sprite: Sprite
var t: Tween


func _ready() -> void:
	sprite = get_parent()
	t = Tween.new()
	add_child(t)


func flash(duration = 0.2):
	t.repeat = true
	t.interpolate_property(
		sprite,
		'modulate:a',
		0,
		1,
		duration,
		Tween.TRANS_CUBIC,
		Tween.EASE_IN_OUT
	)
	t.start()
	yield(get_tree().create_timer(2), "timeout")
	t.stop(sprite, 'modulate:a')
	sprite.modulate.a = 1
