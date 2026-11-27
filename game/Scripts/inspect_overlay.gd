extends CanvasLayer

signal exit(item_data: ItemData, collect: bool)

@export var drag_sens := 0.01
@export var rot_speed := 2.0
@export var test_item: ItemData

@onready var pivot: Node3D = %itemPivot

var _item_data: ItemData
var _dragging := false

func _ready() -> void:
    process_mode = Node.PROCESS_MODE_ALWAYS
    hide()
    if test_item:
        open.call_deferred(test_item)

func open(item_data: ItemData, view_basis := Basis.IDENTITY) -> void:
    _item_data = item_data
    for child in pivot.get_children():
        child.queue_free()
    pivot.basis = view_basis
    pivot.add_child(item_data.model.instantiate())
    show()
    get_tree().paused = true
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

func close(collect: bool) -> void:
    hide()
    get_tree().paused = false
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
    exit.emit(_item_data, collect)

func _unhandled_input(event: InputEvent) -> void:
    if not visible:
        return
    if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
        _dragging = event.pressed
    elif event is InputEventMouseMotion and _dragging:
        _rotate_item(event.relative * drag_sens)

func _process(delta: float) -> void:
    if not visible:
        return
    var dir := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
    if dir != Vector2.ZERO:
        _rotate_item(dir*rot_speed*delta)

func _rotate_item(amt: Vector2) -> void:
    pivot.rotate(Vector3.UP, amt.x)
    pivot.rotate(Vector3.RIGHT, amt.y)