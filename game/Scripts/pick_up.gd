extends RigidBody3D

@export var slot_data: SlotData

@onready var model_holder: Node3D = $ModelHolder

func _ready() -> void:
	if slot_data and slot_data.item_data and slot_data.item_data.model:
		var mesh_instance = slot_data.item_data.model.instantiate()
		model_holder.add_child(mesh_instance)
		
func _physics_process(delta: float) -> void:
	model_holder.rotate_y(delta)
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.inventory_data.pick_up_slot_data(slot_data):
		print("item grabbed")
		queue_free()
