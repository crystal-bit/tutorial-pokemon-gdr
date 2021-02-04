class_name Player
extends KinematicBody2D


func flash():
	$Player/sprite_flash.flash()


func remove_shield():
	$Shield.visible = false


func has_shield():
	return $Shield.visible
