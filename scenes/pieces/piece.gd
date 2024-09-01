@tool
extends Node

enum Models {
	PAWN,
	KNIGHT,
	BISHOP,
	ROOK,
	QUEEN,
	KING,
}
var model_res := {
	Models.PAWN : "res://scenes/pieces/models/pawn/pawn.res",
	Models.KNIGHT : "res://scenes/pieces/models/knight/knight.res",
	Models.BISHOP : "res://scenes/pieces/models/bishop/bishop.res",
	Models.ROOK : "res://scenes/pieces/models/rook/rook.res",
	Models.QUEEN : "res://scenes/pieces/models/queen/queen.res",
	Models.KING : "res://scenes/pieces/models/king/king.res",
}

var colors_res := {
	"white" : ResourceLoader.load("res://materials/white_plastic.tres"),
	"black" : ResourceLoader.load("res://materials/black_plastic.tres"),
}

@export var white = true:
	set(value):
		white = value
		if not is_node_ready():
			await ready
		$MeshInstance3D.set_surface_override_material(1, colors_res["white"] if white else colors_res["black"])
@export var model: Models:
	set(value):
		model = value
		if not is_node_ready():
			await ready
		$MeshInstance3D.mesh = ResourceLoader.load(model_res[model])


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
