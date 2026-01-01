extends Area2D

@export var speed: float = 200.0
@export var gap_size: float = 150.0  # distance between top and bottom pipe
@export var min_y: float = 100.0     # lowest possible gap center
@export var max_y: float = 400.0     # highest possible gap center

func _ready() -> void:
	# Pick a random vertical position for the gap
	var gap_center_y = randf_range(min_y, max_y)

	# Position top and bottom pipes
	$TopPipe.position.y = gap_center_y - gap_size / 2.0
	$BottomPipe.position.y = gap_center_y + gap_size / 2.0

func _process(delta: float) -> void:
	# Move pipes left
	position.x -= speed * delta

	# Free memory once off screen
	if position.x < -300:
		queue_free()



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		ScoreManager.score = 0
		get_tree().reload_current_scene()



func _on_score_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		ScoreManager.score += 1
		
