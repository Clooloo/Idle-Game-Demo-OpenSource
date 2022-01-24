extends TextureButton


var Phealth = 1000
var pdamage 
var _timerdamageunits = null


func _ready():
	pass 

func attack(pdamage):
	Phealth = Phealth - pdamage 
	update_phealthbar(Phealth) 
	print(Phealth)
	if(Phealth < 0.1): 
		died()

func died():
	self.queue_free()

func update_phealthbar(Phealth):
	# That is the relevant part now, which updates it:
	get_node("/root/main/F/Player/PlayerHealth").set_value(Phealth) 


func _on_Enemy1_damageplayer():
	Phealth -= 10
	update_phealthbar(Phealth)
	print("Player Health", Phealth)
	pass # Replace with function body.


func _on_F_heal_player():
	Phealth += 50
	update_phealthbar(Phealth)
	print("Player Health", Phealth)
	pass 
