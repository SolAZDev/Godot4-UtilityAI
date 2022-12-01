extends GraphNode
class_name Selector
enum SelectorType {Highest, First}
@export var WhichWins: SelectorType
@export var Qualifiers: Array[Qualifier]
@export var DefaultAction: Array[Callable]
func StartDefaultAction(): for act in DefaultAction: act

func _calculate():
	if(WhichWins==SelectorType.Highest): highest()
	else: first()
	
func highest():
	var highestValue=0;
	var winningQualifier:int=-1;
	for i in Qualifiers.size():
		# Calculate Score here.
		var active_score = Qualifiers[i].get_Score()
		if active_score>highestValue:
			highestValue=active_score
			winningQualifier=i
	if(winningQualifier>-1): Qualifiers[winningQualifier].Act()
	else: StartDefaultAction()
	
func first():
	pass
