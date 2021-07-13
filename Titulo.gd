extends Node2D


func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("fade")
	yield(get_tree().create_timer(5), "timeout")
	$AnimationPlayer.play_backwards("fade")
	yield(get_tree().create_timer(3), "timeout")
	get_tree().change_scene("res://Main.tscn")
