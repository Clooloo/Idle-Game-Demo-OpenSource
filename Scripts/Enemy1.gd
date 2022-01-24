extends TextureButton

var health = 100000 
var damage 
var _timerdamageunits = null

signal damagewarrior
signal damageninja
signal damageknight
signal damagemage
signal damagedragon
signal damageking
signal damageplayer


func _ready():
	_timerdamageunits = Timer.new()
	add_child(_timerdamageunits)
	_timerdamageunits.connect("timeout", self, "_attack_units")
	_timerdamageunits.set_wait_time(5.0)
	_timerdamageunits.start()

func attack(damage):
	health = health - damage 
	update_healthbar(health) 
	print(health)
	if(health < 0.1): 
		died()

func died():
	self.queue_free()

func update_healthbar(health):
	# That is the relevant part now, which updates it:
	get_node("/root/main/F/Enemy1/ene1healthbar").set_value(health) 

func _on_F_enable_button(me, boolval):
	if(me == 6):
		set_disabled(!boolval)
	pass # Replace with function body.

func _attack_units():
	emit_signal("damagewarrior")
	emit_signal("damageninja")
	emit_signal("damageknight")
	emit_signal("damagemage")
	emit_signal("damagedragon")
	emit_signal("damageking")
	emit_signal("damageplayer")

func _on_F_pressed():
		attack(10)

func _on_Warrior_respect_from_warriors(respect):
	attack(2 * respect)
	


func _on_Ninja_respect_from_ninjas(respect):
	attack(20 * respect)


func _on_Knight_respect_from_knights(respect):
	attack(10 * respect)


func _on_Dragon_respect_from_dragons(respect):
	attack(5 * respect)


func _on_King_respect_from_kings(respect):
	attack(30 * respect)


func _on_Mage_respect_from_mages(respect):
	attack(15 * respect)
