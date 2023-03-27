extends Resource
class_name Qualifier
enum QualifierTypes {SumOfChildren, AllOrNothing, MinimumOfNothing, FixedScore , SumAllAboveThreshold, SumWhileAboveThreshold }

@export var Name:String
@export var QualifierType= QualifierTypes.SumOfChildren
@export var ScoreThreshold:float=0
@export var Qualifiers: Array[Scorer]
@export var Actions: Array[Callable]
@export var priorityLevel: float

func _init(name, qualifiers, actions, priorityLevel=0):
	self.Name=name
	self.Qualifiers=qualifiers
	self.Actions=actions
	self.priorityLevel=priorityLevel
	
func Act()->void:
	for act in Actions: act

func getScore() -> float:
	match QualifierType:
		QualifierTypes.SumOfChildren: return SumOfChildren()
		QualifierTypes.AllOrNothing: return AllOrNothing()
		QualifierTypes.MinimumOfNothing: return MinimumOrNothing()
		QualifierTypes.FixedScore: return FixedScore()
		QualifierTypes.SumAllAboveThreshold: return SumAllAboveThreshold()
		QualifierTypes.SumWhileAboveThreshold: return SumWhileAboveThreshold()
	return 0; #If All Else?
	
func SumOfChildren():
	var total=0;
	for qual in Qualifiers:
		total+=qual.getScore();
	return total;

func AllOrNothing():
	var succeeded=true
	var total=0;
	for qual in Qualifiers:
		var score = qual.getScore();
		total+=score
		if score<=0 : succeeded=true;
	return total if succeeded else 0
	
func MinimumOrNothing():
	var total=0;
	for qual in Qualifiers:
		total+=qual.getScore();
	return total if total>=ScoreThreshold else 0	
	
func FixedScore():
	return ScoreThreshold
	
func SumAllAboveThreshold():
	var total=0;
	for qual in Qualifiers:
		var score = qual.getScore();
		total+=score if score>=ScoreThreshold else 0
	return total
	
func SumWhileAboveThreshold():
	var total=0;
	for qual in Qualifiers:
		var score = qual.getScore();
		if score<ScoreThreshold: return total
		total+=score if score>=ScoreThreshold else 0
	return total
