extends Area2D
@export var possible_items: Array[PackedScene] = []
@onready var canvas_group: CanvasGroup = $CanvasGroup
@onready var animation_player: AnimationPlayer = $AnimationPlayer
func _ready() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 4.0)
	
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)

func _on_mouse_entered() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 10.0)

func _on_mouse_exited() -> void:
	canvas_group.material.set_shader_parameter("line_thickness", 4.0)

func _input_event(viewport: Viewport, event: InputEvent, shape_index: int):
	var event_is_mouse_click:bool = (
		event is InputEventMouseButton and 
		event.button_index == MOUSE_BUTTON_LEFT and
		event.is_pressed()
		

	)
	
	if event_is_mouse_click:
		open()
		
func open() -> void:
	animation_player.play("open")

	input_pickable = false





	for current_index in range(randi_range(1, 3)):
		_spawn_random_item()

func _spawn_random_item() -> void:
	var loot_item: Area2D = possible_items.pick_random().instantiate()
	add_child(loot_item)

	var random_angle := randf_range(0.0, 2.0 * PI)
	var random_direction := Vector2(1.0, 0.0).rotated(random_angle)
	var random_distance := randf_range(60.0, 120.0)
	loot_item.position = random_direction * random_distance
