extends TextureButton


var Heals = 0
var productionmultiplier = 10
var costmultiplier = 1.0
var basecost = 1000
var cost = basecost*costmultiplier

func _on_F_enable_button(me, boolval):
	if(me == 7):
		set_disabled(!boolval)


func _ready():
	pass
