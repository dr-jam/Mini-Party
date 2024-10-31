class_name SceneManager
extends Node

@export var scenes:Array[PackedScene]
var current_scene = null


func _ready() -> void:
	#var root = get_tree().root
	#switch_scene(scenes[0])
	pass
	 
func _process(delta) -> void:
	if Input.is_key_pressed(KEY_R):
		switch_scene(scenes[0])

func switch_scene(scene:PackedScene):
	call_deferred("_deferred_switch_scene", scene)
	
func _deferred_switch_scene(scene:PackedScene):
	current_scene.free()
	#var s = load(PackedScene)
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene
