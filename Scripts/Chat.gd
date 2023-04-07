extends Control

func _ready():
	$ChatMessage/Label.bbcode_text = '[center][color=#'+Global.font_color+']' + Global.username + '[/color]'

func _add_message(message : String, color := 'ffffff'):
	$ChatBox.bbcode_text += '\n[color=#'+color+']' + message + '[/color]'

remote func receive_message(message : String, color := 'ffffff'):
	_add_message(message, color)

func _on_Send_pressed():
	var message = Global.username + ': ' + $ChatMessage/Message.text
	rpc('receive_message', message, Global.font_color)
	_add_message(message, Global.font_color)
	$ChatMessage/Message.text = ''
