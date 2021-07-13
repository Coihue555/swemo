extends KinematicBody2D


const UP = Vector2(0,-1)
const FLAP = 200
const MAXFALLSPEED = 200
const GRAVITY = 10

var motion = Vector2()
var Ast1 = preload("res://Ast1scn.tscn")
var Ast2 = preload("res://Ast2scn.tscn")

var score = 0

func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED

	if Input.is_action_just_pressed("FLAP"):
		motion.y = -FLAP
	
	motion = move_and_slide(motion, UP)
	
	get_parent().get_parent().get_node("CanvasLayer/RichTextLabel").text = "Puntaje "+ str(score)
	
func Wall_reset():
	var Wall_instance = Ast1.instance()
	Wall_instance.position = Vector2(950,rand_range(-250,250))
	get_parent().call_deferred("add_child",Wall_instance)

func Ast2_reset():
	var Wall_instance = Ast2.instance()
	Wall_instance.position = Vector2(950,rand_range(-250,250))
	get_parent().call_deferred("add_child",Wall_instance)	



func _on_Resetter_body_entered(body):
	if body.name == "Ast1":
		body.queue_free()
		Wall_reset()
	if body.name == "Ast2":
		body.queue_free()
		Ast2_reset()



func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		score = score + 1

func _on_Detect_body_entered(body):
	if body.name == "Ast1":
		get_tree().reload_current_scene()
	if body.name == "Ast2":
		get_tree().reload_current_scene()
