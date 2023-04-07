extends Control

const SERVER_PORT = 3000
var MAX_PLAYERS = Global.colors.size()

func _on_Host_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
	Global.username = $Username.text
	Global.set_server_font_color()
	get_tree().change_scene("res://Scenes/Chat.tscn")


func _on_Client_pressed():
	var address = 'localhost' if $Client/Address.text == '' else $Client/Address.text
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client(address, SERVER_PORT)
	get_tree().network_peer = peer
	Global.username = $Username.text
	get_tree().change_scene("res://Scenes/Chat.tscn")


func _on_Server_pressed():
	var peer = NetworkedMultiplayerENet.new()
	peer.create_server(SERVER_PORT, MAX_PLAYERS)
	get_tree().network_peer = peer
