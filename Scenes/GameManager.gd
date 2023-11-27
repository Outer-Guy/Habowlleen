extends Node

var points : int
var stateMachine
var pointsText
var Throws = 4
# Called when the node enters the scene tree for the first time.
func _ready():
	stateMachine = get_child(0)
	pointsText = get_node("/root/Level/ThrowingControls2/RichTextLabel")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_tombstone_broke():
	points += 1
	pointsText.text = str("Points: ", points)
	print_debug(points)
	pass # Replace with function body.

func _on_area_3d_body_entered(body):
	print_debug("Retry")
	stateMachine.on_child_transition(stateMachine.get_child(1), "Throwing")
	pass # Replace with function body.


func _on_button_button_down():
	get_tree().quit()
	pass # Replace with function body.


func _on_rolling_transitioned():
	Throws -= 1
	if Throws == 0:
		get_node("/root/Level/ThrowingControls").hide()
		get_node("/root/Level/ThrowingControls2").hide()
		get_node("/root/Level/ThrowingControls3").show()
		get_node("/root/Level/ThrowingControls3/RichTextLabel").text = str("Final Points:", points)
	pass # Replace with function body.


func _on_Back_To_Menu():
	get_tree().change_scene_to_file("res://Scenes/MainMenu/MainMenu.tscn")
	pass # Replace with function body.
