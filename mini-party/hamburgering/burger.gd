class_name Burger
extends CharacterBody2D

#signal YumTime

@export var yum:AudioStreamPlayer2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

func _ready():
	velocity = Vector2(randf()*SPEED, randf()*SPEED)
	input_pickable = true


func _physics_process(_delta):
	move_and_slide()


func _on_mouse_entered():
	$yum.play()
	visible = false
	#print("here")
	#get_scene_root
	
	#.call("_play_yum")
	#queue_free()
