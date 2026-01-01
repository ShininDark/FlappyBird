extends Node2D

@onready var pipe_scene = preload("res://Scenes/pipes.tscn")

func _ready() -> void:
	$Timer.start()

func _on_timer_timeout() -> void:
	var pipe = pipe_scene.instantiate()
	pipe.position = Vector2(600, 0)  # start just off the right side of the screen
	add_child(pipe)
