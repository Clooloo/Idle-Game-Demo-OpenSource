extends TextureButton

var Kings = 0
var productionmultiplier = 10000
var costmultiplier = 1.0
var basecost = 1000000
var cost = basecost*costmultiplier
var respect
signal respect_from_kings


func _process(delta):
	$Kinglabel.text = 'King Level:' + str(Kings)
	$Kingcost.text = 'cost:' + str(cost)
	pass



func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Kings
	emit_signal("respect_from_kings", respect)


func _on_King_button_down():
	Kings += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Kings:", Kings)
	$Kinglabel.text = 'King Level:' + str(Kings)
	$Kingcost.text = 'cost:' + str(cost)
	if(Kings >= 1):
		$Kinani.visible = true
	else:
		$Kinani.visible = false

func _on_F_enable_button(me, boolval):
	if(me == 5):
		set_disabled(!boolval)
func save():
	var save_dict = {
		Kings = Kings
	}
	return save_dict

func _on_Enemy1_damageking():
	if(Kings >= 1):
		Kings -= 0.1
		print("Kings:", Kings)
