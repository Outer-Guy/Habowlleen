extends State

var camera
var playerHead
var ThrownSpeed

func _ready():
	playerHead = get_node("/root/Level/Player/HeadRigPoint/Head")
	camera = get_node("/root/Level/CameraPivot")
	pass

func Enter():
	camera.Target = get_node("/root/Level/Player/HeadRigPoint/RemoteHead")
	camera.setCameraOffset(Vector3(0,1.5,0))
	camera.setCameraLenght(3)
	
	camera.movSmoothing = 10
	camera.movSpeed = 4
	camera.rotSmoothing = 20
	camera.rotSpeed = 1
	camera.fovSmoothing = 20
	ThrownSpeed = playerHead.linear_velocity
	print_debug("started")
	pass
	
func Exit():
	pass
	
func Update(delta: float):
	camera.cameraStep(delta)
	camera.FOVchange(90 + playerHead.linear_velocity.z / 15)
	camera.setCameraLenght(1 + playerHead.linear_velocity / 100)
	print_debug(camera.cameraLenght)
	pass
	
func Physics_Update(delta: float):
	pass
