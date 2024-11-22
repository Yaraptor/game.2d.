extends Node

func _on_area_2d_body_entered(body: Node2D) -> void:
	get_parent().get_child(0).position = Vector2(0, 0)
