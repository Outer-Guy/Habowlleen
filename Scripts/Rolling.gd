extends State

var camera
var player
var ThrownSpeed
var Speed

func _ready():
	player = get_node("/root/Level/Player/HeadRigPoint/Head")
	camera = get_node("/root/Level/CameraPivot")
	pass

func Enter():
	camera.Target = player
	camera.Target = player
	camera.setCameraOffset(Vector3(0,1,0))
	camera.setCameraLenght(3)
	
	camera.movSmoothing = 10
	camera.movSpeed = 4
	camera.rotSmoothing = 20
	camera.rotSpeed = 1
	camera.fovSmoothing = 20
	
	print_debug("started")
	pass
	
func Exit():
	pass
	
func Update(delta: float):
	camera.cameraStep(delta)
	camera.FOVchange(90+Speed/15)
	pass
	
func Physics_Update(delta: float):
	pass
