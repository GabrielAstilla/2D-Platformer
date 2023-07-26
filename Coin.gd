extends Area2D

export var value = 1

func ready():
	pass

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print (value)
		body.collect_coin(value)
		queue_free()
