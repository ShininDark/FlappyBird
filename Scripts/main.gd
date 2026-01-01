extends Node2D

@onready var pipe_scene = preload("res://Scenes/pipes.tscn")

func _ready() -> void:
	$PipeTimer.start()

func _on_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(600, 0)  # start just off the right side of the screen
	add_child(pipe)

func _process(delta: float) -> void:
	$ScoreDisplay/ScoreLabel.text = str(ScoreManager.score)
