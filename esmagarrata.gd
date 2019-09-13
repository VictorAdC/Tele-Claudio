# Declare member variables here. Examples:
# var a = 2
# var b = "text"
extends Panel

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Button").connect("pressed", self, "_esmagar_rata")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _esmagar_rata():
	get_node("texto").text = "Rata Esmagada"