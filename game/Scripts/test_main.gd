extends Node3D

@onready var player = $CharacterBody3D
@onready var inspect_overlay = $inspectOverlay

func _ready() -> void:
	player.inspect_req.connect(inspect_overlay.open)
