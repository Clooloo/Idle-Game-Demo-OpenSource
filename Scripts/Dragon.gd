extends TextureButton

var Dragons = 0
var productionmultiplier = 1
var costmultiplier = 1.0
var basecost = 100
var cost = basecost*costmultiplier
var respect
signal respect_from_dragons


func _process(delta):
	$Dragonlabel.text = 'Dragon Level:' + str(Dragons)
	$Dragoncost.text = 'cost:' + str(cost)
	pass



func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Dragons
	emit_signal("respect_from_dragons", respect)


func _on_Dragon_button_down():
	Dragons += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Dragons:", Dragons)
	$Dragonlabel.text = 'Dragon Level:' + str(Dragons)
	$Dragoncost.text = 'cost:' + str(cost)
	if(Dragons >= 1):
		$Draani.visible = true
	else:
		$Draani.visible = false

func _on_F_enable_button(me, boolval):
	if(me == 4):
		set_disabled(!boolval)
func save():
	var save_dict = {
		Dragons= Dragons
	}
	return save_dict

func _on_Enemy1_damagedragon():
	if(Dragons >= 1):
		Dragons -= 0.1
		print("Dragons:", Dragons)
