class_name Burger
extends CharacterBody2D

signal yum_time

@export var yum:AudioStreamPlayer2D

const SPEED = 300.0
const LIFE_TIME = 5.0

var _death_timer:Timer

@onready var sprite:Sprite2D = $BurgerSprite

func _ready():
	connect("mouse_entered", _on_mouse_enter)
	_death_timer = Timer.new()
	add_child(_death_timer)
	_death_timer.one_shot = true
	_death_timer.start(LIFE_TIME)
	velocity = Vector2(randf_range(-1.0, 1.0)*SPEED, randf_range(-1.0, 1.0)*SPEED)
	position = Vector2(randf_range(-100.0, 100.0), randf_range(-100.0, 100.0))
	input_pickable = true


func _physics_process(_delta):
	if _death_timer != null && _death_timer.is_stopped():
		queue_free()
	move_and_slide()


func _on_mouse_enter() -> void:
	yum_time.emit()
	queue_free()
