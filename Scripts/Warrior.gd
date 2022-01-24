extends TextureButton


var Warriors = 0
var productionmultiplier = 0.1
var costmultiplier = 1.0
var basecost = 10
var cost = basecost*costmultiplier
var respect
signal respect_from_warriors

func _process(delta):
	$Warriorlabel.text = 'Warrior Level:' + str(Warriors)
	$Warriorcost.text = 'cost:' + str(cost)
#signal that triggers everytime the timer elapses, 1 second
#sends respect to the main button
func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Warriors
	emit_signal("respect_from_warriors", respect)

#signal to indicate the buying of a new button
#updates the amount of buttons, the cost multiplier
#and the total cost
func _on_Warrior_button_down():
	Warriors += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Warriors:", Warriors) 
	$Warriorlabel.text = 'Warrior Level:' + str(Warriors)
	$Warriorcost.text = 'cost:' + str(cost)
	if(Warriors >= 1):
		$Warani.visible = true
	else:
		$Warrani.visible = false


#gets the enable signal from the main button based on wallet amount
func _on_F_enable_button(me, boolval):
	if(me == 0):
		set_disabled(!boolval)
		
func _on_Enemy1_damagewarrior():
	if(Warriors >= 1):
		Warriors -= 0.1
		print("Warriors:", Warriors)


func save():
	var save_dict = {
		
		Warriors = Warriors
	}
	return save_dict



