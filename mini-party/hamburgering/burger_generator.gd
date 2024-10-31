class_name BurgerGenerator
extends Node2D



@export var burger:PackedScene = preload("res://hamburgering/burger.tscn")
var _cooldown:float = 1.0
var _timer:Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	#connect("YumTime", _play_yum)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if _timer == null || _timer.is_stopped():
		var new_burger = burger.instantiate()
		add_child(new_burger)
		_timer = Timer.new()
		add_child(_timer)
		_timer.one_shot = true
		_timer.start(_cooldown)
		_cooldown = clampf(_cooldown / 1.1, 0.25, 3.0)
		
func _play_yum():
	$"../Yum".play()
