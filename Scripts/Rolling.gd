extends State

var camera
var playerHead
var ThrownSpeed
var timer : float = 8
func _ready():
	playerHead = get_node("/root/Level/Player/HeadRigPoint/Head")
	camera = get_node("/root/Level/CameraPivot")
	pass

func Enter():
	camera.Target = get_node("/root/Level/Player/HeadRigPoint/RemoteHead")
	camera.setCameraOffset(Vector3(0,2,0))
	camera.setCameraLenght(3)
	
	camera.movSmoothing = 10
	camera.movSpeed = 4
	camera.rotSmoothing = 20
	camera.rotSpeed = 1
	#camera.movSmoothing = 50
	#camera.movSpeed = 1
	#camera.rotSmoothing = 50
	#camera.rotSpeed = 1
	camera.fovSmoothing = 20
	ThrownSpeed = camera.Target.forwardSpeed
	print_debug("started")
	pass
	
func Exit():
	get_node("/root/Level/ThrowingControls").show()
	pass
	
func Update(delta: float):
	camera.cameraStep(delta)
	camera.FOVchange(90 - playerHead.linear_velocity.length() / 15)
	camera.setCameraLenght(3 - playerHead.linear_velocity.length() / 200)
	
	timer -=delta
	if timer <= 0:
		print_debug(timer)
		timer = 8
		get_parent().on_child_transition(self, "Throwing")
		
	pass
	
func Physics_Update(delta: float):
	pass
