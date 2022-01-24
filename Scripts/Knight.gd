extends TextureButton

var Knights = 0
var productionmultiplier = 10
var costmultiplier = 1.0
var basecost = 1000
var cost = basecost*costmultiplier
var respect
signal respect_from_knights


func _process(delta):
	$Knightlabel.text = 'Knight Level:' + str(Knights)
	$Knightcost.text = 'cost:' + str(cost)
	pass



func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Knights
	emit_signal("respect_from_knights", respect)


func _on_Knight_button_down():
	Knights += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Knights:", Knights)
	$Knightlabel.text = 'Knight Level:' + str(Knights)
	$Knightcost.text = 'cost:' + str(cost)
	if(Knights >= 1):
		$Kniani.visible = true
	else:
		$Kniani.visible = false

func _on_F_enable_button(me, boolval):
	if(me == 2):
		set_disabled(!boolval)
		
func save():
	var save_dict = {
		
		Knights = Knights
	}
	
	return save_dict

func _on_Enemy1_damageknight():
	if(Knights >= 1):
		Knights -= 0.1
		print("Knights:", Knights)
