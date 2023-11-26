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
	camera.setCameraOffset(Vector3(0,2,0))
	camera.setCameraLenght(3)
	
	camera.movSmoothing = 10
	camera.movSpeed = 1
	camera.rotSmoothing = 20
	camera.rotSpeed = 1
	camera.fovSmoothing = 20
	ThrownSpeed = camera.Target.forwardSpeed
	print_debug("started")
	pass
	
func Exit():
	pass
	
func Update(delta: float):
	camera.cameraStep(delta)
	camera.FOVchange(90 - camera.Target.forwardSpeed.z / 15)
	camera.setCameraLenght(3 - camera.Target.forwardSpeed.z / 200)
	
	pass
	
func Physics_Update(delta: float):
	pass
