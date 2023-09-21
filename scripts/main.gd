extends Node

@export var mob_scene: PackedScene

func _ready():
	$UI/Retry.hide()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/Retry.visible:
		get_tree().reload_current_scene()

func _on_mob_timer_timeout():
	var mob = mob_scene.instantiate()
	var mob_spawn_location = $SpawnPath/SpawnLocation
	mob_spawn_location.progress_ratio = randf()
	
	var player_position = $Player.position
	mob.initialize(mob_spawn_location.position, player_position)
	
	add_child(mob)
	mob.squashed.connect($UI._on_mob_squashed.bind())

func _on_player_hit():
	$MobTimer.stop()
	$UI/Retry.show()
