class_name BurgerGenerator
extends Node2D



@export var burger:PackedScene = preload("res://hamburgering/burger.tscn")
var _cooldown:float = 1.0
var _timer:Timer
var _hunger = 100

@onready var label:RichTextLabel = $"../RichTextLabel"


func _ready():
	label.text = "[b]HAMBURGERING[/b]"


func _process(_delta):
	if _timer == null || _timer.is_stopped():
		var new_burger:Burger = burger.instantiate()
		#connect(new_burger.yum_time, _play_yum)
		new_burger.yum_time.connect(_play_yum)
		add_child(new_burger)
		_timer = Timer.new()
		add_child(_timer)
		_timer.one_shot = true
		_timer.start(_cooldown)
		_cooldown = clampf(_cooldown / 1.1, 0.25, 3.0)
		
func _play_yum():
	_hunger -= 1
	label.text = "HUNGER %d" % _hunger
	label.scale += Vector2(0.1, 0.1)
	$"../Yum".play()
