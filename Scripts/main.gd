extends Node2D

@onready var pipe_scene = preload("res://Scenes/pipes.tscn")

func _ready() -> void:
	$PipeTimer.start()

func _process(delta: float) -> void:
	$ScoreDisplay/ScoreLabel.text = str(ScoreManager.score)


func _on_pipe_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(1200, randf_range(150, 450))  # start just off the right side of the screen
	add_child(pipe)
