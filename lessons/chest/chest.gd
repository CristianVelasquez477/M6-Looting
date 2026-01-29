extends Area2D
@onready var canvas_group: CanvasGroup = $CanvasGroup

func _ready() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 4.0)
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 10.0)

func _on_mouse_exited() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 4.0)
