extends CharacterBody3D

@export var speed: float = 3.0
@export var gravity: float = 9.8

var player: CharacterBody3D

func _ready():
	player = get_tree().get_first_node_in_group("player")


func _physics_process(delta):

	if player == null:
		return

	# Direction to player
	var direction = player.global_transform.origin - global_transform.origin
	direction.y = 0
	direction = direction.normalized()

	# Face player
	look_at(player.global_transform.origin, Vector3.UP)

	# Movement
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	# Gravity
	if !is_on_floor():
		velocity.y -= gravity * delta

	move_and_slide()
