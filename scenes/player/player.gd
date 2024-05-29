extends CharacterBody2D

const MAX_SPEED = 200


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	velocity = direction * MAX_SPEED
	move_and_slide()


func get_movement_vector():
	#var movement_vector = Vector2.ZERO #sets movement vector to a vector with a 0 for it's x and y component
	
	#returns a 0 or 1 (binary) since we're using keyboard (pressed or not) 
	#if move right was not pressed (0) and move left was pressed (1) then we return -1. cuz 0-1=-1
	#if move right was pressed (1) and move left was not pressed (0) then we return 1. cuz 1-0=1
	#if both are pressed, we get 0 
	var x_movement = Input.get_action_strength("move_right") - Input.get_action_strength("move_left") 
	
	var y_movement = Input.get_action_strength("move_down") - Input.get_action_strength("move_up") 
	
	return Vector2(x_movement, y_movement)
