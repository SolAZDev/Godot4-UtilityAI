extends GraphNode
class_name Selector
enum SelectorType {Highest, First}
@export var WhichWins: SelectorType
@export var Qualifiers: Array[Qualifier]
@export var DefaultAction: Array[Callable]

var SelectedQualifier: Qualifier = null

func StartDefaultAction(): for act in DefaultAction: act

func _calculate():
	if(WhichWins==SelectorType.Highest): highest()
	else: first()
	
func highest():
	var highestValue:float=0;
	var winningQualifier:float=-1;
	for i in Qualifiers.size():
		# Calculate Score here.
		var active_score = Qualifiers[i].getScore()
		if active_score>highestValue:
			highestValue=active_score
			winningQualifier=i

	if(winningQualifier>-1): 
		SelectedQualifier = Qualifiers[winningQualifier]
		SelectedQualifier.Act()
	else: StartDefaultAction()
	
func first():
	pass
