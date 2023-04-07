extends Node

var username = ''
var font_color = ''

var colors : Array = [
	Color.red, Color.blue, Color.green,
	Color.yellow, Color.orange, Color.purple,
	Color.aqua, Color.deeppink, Color.gray
]

func _ready():
	get_tree().connect("network_peer_connected", self, "_client_connected")
	
func _client_connected(id : int):
	rpc_id(id, 'set_font_color', generate_random_color())
	print('>>', font_color)

func set_server_font_color():
	font_color =  Global.generate_random_color().to_html(false)
	print('>>', font_color)

remote func set_font_color(color : Color):
	font_color = color.to_html(false)

func generate_random_color() -> Color:
	randomize()
	var index = randi() % colors.size()
	return colors[index]
