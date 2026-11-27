@tool
extends StaticBody3D
class_name Inspectable

@export var item_data: ItemData:
    set(value):
        item_data = value
        if is_node_ready():
            _rebuild()

var _model: Node3D
var _shapes: Array[CollisionShape3D] = []

func _ready() -> void:
    _rebuild()

func _rebuild() -> void:
    if _model:
        _model.queue_free()
        _model = null
    for s in _shapes:
        s.queue_free()
    _shapes.clear()
    if not item_data or not item_data.model:
        return

    _model = item_data.model.instantiate()
    add_child(_model)

    for mi: MeshInstance3D in _model.find_children("*", "MeshInstance3D", true, false):
        if not mi.mesh:
            continue
        var shape := CollisionShape3D.new()
        shape.shape = mi.mesh.create_convex_shape(true, true)
        shape.transform = global_transform.affine_inverse() * mi.global_transform
        add_child(shape)
        _shapes.append(shape)
