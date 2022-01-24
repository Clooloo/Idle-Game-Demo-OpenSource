extends TextureButton

var Mages = 0
var productionmultiplier = 100
var costmultiplier = 1.0
var basecost = 10000
var cost = basecost*costmultiplier
var respect
signal respect_from_mages


func _process(delta):
	$Magelabel.text = 'Mage Level:' + str(Mages)
	$Magecost.text = 'cost:' + str(cost)
	pass



func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Mages
	emit_signal("respect_from_mages", respect)


func _on_Mage_button_down():
	Mages += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Mages:", Mages)
	$Magelabel.text = 'Mages:' + str(Mages)
	$Magecost.text = 'cost:' + str(cost)
	if(Mages >= 1):
		$Magani.visible = true
	else:
		$Magani.visible = false

func _on_F_enable_button(me, boolval):
	if(me == 3):
		set_disabled(!boolval)

func save():
	var save_dict = {
		Mages = Mages
	}
	return save_dict

func _on_Enemy1_damagemage():
	if(Mages >= 1):
		Mages -= 0.1
		print("Mages:", Mages)
