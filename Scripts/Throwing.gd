extends State

@export var MouseSensitivity : float
@export var ThrowForce : float

var player
var camera
var heldCamera : bool
var heldThrow : bool
var mousePosition

func _ready():
	player = get_node("/root/Level/Player")
	camera = get_node("/root/Level/CameraPivot")
	pass

func Enter():
	camera.Enter()
	camera.Target = player
	camera.setCameraOffset(Vector3(1.25,1.5,0))
	camera.setCameraLenght(3)
	
	camera.movSmoothing = 10
	camera.movSpeed = 4
	camera.rotSmoothing = 5
	camera.rotSpeed = 1
	var playerHead = player.get_node("HeadRigPoint/Head")
	var playerHeadPoint = player.get_node("HeadRigPoint")
	playerHead.position = playerHeadPoint.position
	playerHead.rotation = playerHeadPoint.rotation
	playerHead.linear_velocity = Vector3.ZERO
	playerHead.angular_velocity = Vector3.ZERO

	playerHead.gravity_scale = 0
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
		
		var playerhead = player.get_node("HeadRigPoint/Head")
		playerhead.apply_impulse(-playerhead.global_transform.basis.z * ThrowForce * (newMousePosition.y - mousePosition.y))
		playerhead.gravity_scale = 1
		var playerRemote = player.get_node("HeadRigPoint/RemoteHead")
		#playerRemote.setState()
		get_parent().on_child_transition(self,"Rolling")
	pass
	
	
func Physics_Update(delta: float):
	pass
