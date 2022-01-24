extends TextureButton

var Ninjas = 0
var productionmultiplier = 1000
var costmultiplier = 1.0
var basecost = 100000
var cost = basecost*costmultiplier
var respect
signal respect_from_ninjas


func _process(delta):
	$Ninjalabel.text = 'Ninja Level:' + str(Ninjas)
	$Ninjacost.text = 'cost:' + str(cost)
	pass


func _on_GlobalTimer_timeout():
	respect = productionmultiplier*Ninjas
	emit_signal("respect_from_ninjas", respect)


func _on_Ninja_button_down():
	Ninjas += 1
	costmultiplier += 0.1
	cost = basecost*costmultiplier
	print("Ninjas:", Ninjas)
	$Ninjalabel.text = 'Ninja Level:' + str(Ninjas)
	$Ninjacost.text = 'cost:' + str(cost)
	if(Ninjas >= 1):
		$Ninani.visible = true
	else:
		$Ninani.visible = false

func _on_F_enable_button(me, boolval):
	if(me == 1):
		set_disabled(!boolval)
		
func save():
	var save_dict = {
		
		Ninjas = Ninjas
	}
	return save_dict

func _on_Enemy1_damageninja():
	if(Ninjas >= 1):
		Ninjas -= 0.1
		print("Ninjas:", Ninjas)
