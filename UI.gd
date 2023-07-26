extends Control

onready var scoreText = get_node("Label")

func set_score_text(score):
		scoreText.text = str(score)

func _ready():
	scoreText.text = "0"
