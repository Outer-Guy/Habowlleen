extends Control

func _ready():
	get_node("Song").play()

	pass

func _on_play_pressed():
	get_node("ButtonPress").play()
	get_tree().change_scene_to_file("res://Scenes/level.tscn")


func _on_options_pressed():
	get_node("ButtonPress").play()
	get_tree().change_scene_to_file("res://Scenes/OptionsMenu/OptionsMenu.tscn")

func _on_quit_game_pressed():
	get_node("ButtonPress").play()
	get_tree().quit()
