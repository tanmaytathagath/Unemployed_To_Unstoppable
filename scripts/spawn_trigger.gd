extends Area2D

@export var enemy_scene: PackedScene
@export var enemy_direction: int = 1  # 1 = right, -1 = left

var has_triggered: bool = false

func _on_body_entered(body: Node2D) -> void:
	if has_triggered or not body.is_in_group("player"):
		return
	if enemy_scene == null:
		push_error("SpawnTrigger: Enemy Scene slot is empty")
		return

	has_triggered = true
	var enemy = enemy_scene.instantiate()
	enemy.direction = enemy_direction
	get_parent().call_deferred("add_child", enemy)
	enemy.set_deferred("global_position", $SpawnPoint.global_position)
