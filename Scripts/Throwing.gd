extends State

@export var MouseSensitivity : float

var player
var camera
var heldCamera : bool
var heldThrow : bool
var mousePosition
var ThrownSpeed

func _ready():
	player = get_node("/root/Level/Player")
	camera = get_node("/root/Level/CameraPivot")
	pass

func Enter():
	camera.Target = player
	camera.setCameraOffset(Vector3(1.5,1.5,0))
	camera.setCameraLenght(3)
	
	camera.movSmoothing = 10
	camera.movSpeed = 4
	camera.rotSmoothing = 20
	camera.rotSpeed = 1
	pass
	
func Exit():
	print_debug("Exited")
	
	pass
	
func Update(delta: float):
	
	camera.cameraStep(delta)
	if heldCamera == true:
		var newMousePosition = get_viewport().get_mouse_position()
		player.rotate_y((mousePosition.x - newMousePosition.x) * MouseSensitivity * delta)
		mousePosition = newMousePosition
	
	if heldThrow == true:
		var newMousePosition = get_viewport().get_mouse_position()
		if newMousePosition.y < mousePosition.y:
			mousePosition = newMousePosition
		pass
		
	
func onMoveCameraStart():
	heldCamera = true
	mousePosition = get_viewport().get_mouse_position()
		
	pass
	
func onMoveCameraStop():
	heldCamera = false
	mousePosition = null
	pass
	
	
func onThrowStart():
	heldThrow = true
	mousePosition = get_viewport().get_mouse_position()
	pass
	
func onThrowStop():
	var newMousePosition = get_viewport().get_mouse_position()
	heldThrow = false
	print_debug(newMousePosition.y - mousePosition.y)
	if (newMousePosition.y - mousePosition.y) < 20:
		mousePosition = null
	else: 
		ThrownSpeed = newMousePosition.y - mousePosition.y
		get_parent().on_child_transition(self,"Rolling")
	pass
	
	
func Physics_Update(delta: float):
	pass
