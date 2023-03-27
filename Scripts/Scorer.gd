extends Resource
class_name Scorer
@export var Name: String
@export var Score=0
@export var InvertIfFalse=false;
@export var ConsideationFunction: Callable

func getScore() -> float: 
	# TODO: Figure out how to pass 
	if ConsideationFunction.call(): return Score
	else:
		return -Score if InvertIfFalse else 0
		
