extends Resource
class_name Scorer
@export var Name: String
@export var Score=0
@export var InvertIfFalse=false;
@export var ConsideationFunction: Callable

func get_score(): 
	# TODO: Figure out how to pass 
	if(ConsideationFunction.call()==true): return Score
	else:
		if(InvertIfFalse):-Score
		else: 0

