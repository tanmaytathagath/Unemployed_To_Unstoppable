extends CharacterBody2D

@export var speed: float = 120.0
@export var direction: int = 1  # 1 = right, -1 = left
@export var art_faces_left: bool = false

@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var gravity: float = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	if is_on_wall():
		direction *= -1

	velocity.x = direction * speed
	move_and_slide()

	if art_faces_left:
		sprite.flip_h = direction > 0
	else:
		sprite.flip_h = direction < 0

func _on_hitbox_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		var start := get_tree().get_first_node_in_group("start") as Node2D
		if start:
			body.global_position = start.global_position
		body.velocity = Vector2.ZERO
