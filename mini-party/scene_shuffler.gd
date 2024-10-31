class_name SceneManager
extends Node

@export var scenes:Array[PackedScene]
@export var switch_time:float = 30.0

var current_scene:Node = null

#TODO: timer that swaps to new scene every 30 seconds
#TODO: randomize picking order of scenes (https://docs.godotengine.org/en/3.1/classes/class_array.html#class-array-method-shuffle)

func _ready() -> void:
	#var root = get_tree().root
	#switch_scene(scenes[0])
	current_scene = scenes[randi_range(0, scenes.size()-1)].instantiate()
	#pass
	 
func _process(_delta) -> void:
	if Input.is_key_pressed(KEY_R):
		switch_scene(scenes[0])

func switch_scene(scene:PackedScene):
	call_deferred("_deferred_switch_scene", scene)
	
func _deferred_switch_scene(scene:PackedScene):
	current_scene.queue_free()
	
	#var s = load(PackedScene)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
