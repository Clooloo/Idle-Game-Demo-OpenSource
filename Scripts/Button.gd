extends TextureButton

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

signal enable_button
signal heal_player

export var wallet  = 0

onready var Warrior = get_child(0)
onready var Ninja = get_child(1)
onready var Knight = get_child(2)
onready var Mage = get_child(3)
onready var Dragon = get_child(4)
onready var King = get_child(5)
onready var Enemy1 = get_child(6)
onready var Heal = get_child(7)

func _ready():
	pass


#every frame checks to if a button any button can be enabled
#enables if walet >= button.cost, disables if not
func _process(delta):
	
	if(wallet >= Warrior.cost):
		enable_warrior(true)
	elif(wallet < Warrior.cost):
		enable_warrior(false)
	
	if(wallet >= Ninja.cost):
		enable_ninja(true)
	elif(wallet < Ninja.cost):
		enable_ninja(false)
	
	if(wallet >= Knight.cost):
		enable_knight(true)
	elif(wallet < Knight.cost):
		enable_knight(false)
		
	if(wallet >=Mage.cost ):
		enable_mage(true)
	elif(wallet < Mage.cost):
		enable_mage(false)
		
	if(wallet >= Dragon.cost):
		enable_dragon(true)
	elif(wallet < Dragon.cost):
		enable_dragon(false)
	
	if(wallet >= King.cost):
		enable_king(true)
	elif(wallet < King.cost):
		enable_king(false)
	
	if(wallet >= Heal.cost):
		enable_heal(true)
	elif(wallet < Heal.cost):
		enable_heal(false)
	
	$Walletlabel.text = 'Coins:' + str(wallet)

#increases respect count everytime you click the F button
func _on_F_button_down():
	wallet += 1
	print(wallet)
	enable_enemy1(false)

func _on_F_button_up():
	enable_enemy1(true)
	pass

#can also increase wallet with the space bar 
func _input(event):
	if(event.is_action_pressed("ui_select")):
		wallet += 1
		
		print(wallet)

#signals that enable their respective buttons
func enable_warrior(boolval):
	emit_signal("enable_button", 0, boolval)

func enable_ninja(boolval):
	emit_signal("enable_button", 1, boolval)
	
func enable_knight(boolval):
	emit_signal("enable_button", 2, boolval)

func enable_mage(boolval):
	emit_signal("enable_button", 3, boolval)
	
func enable_dragon(boolval):
	emit_signal("enable_button", 4, boolval)

func enable_king(boolval):
	emit_signal("enable_button", 5, boolval)

func enable_enemy1(boolval):
	emit_signal("enable_button",6, boolval)

func enable_heal(boolval):
	emit_signal("enable_button",7, boolval)

#signal recievers for updating wallet based on the production of the buttons
#of the buttons and if anymore buttons are bought
func _on_Warrior_respect_from_warriors(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)

func _on_Warrior_button_down():
	wallet -= Warrior.cost
	print(wallet)
	
	
func _on_Ninja_respect_from_ninjas(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Ninja_button_down():
	wallet -= Ninja.cost
	print(wallet)


func _on_Knight_respect_from_knights(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Knight_button_down():
	wallet -= Knight.cost
	print(wallet)


func _on_Mage_respect_from_mages(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Mage_button_down():
	wallet -= Mage.cost
	print(wallet)


func _on_Dragon_respect_from_dragons(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_Dragon_button_down():
	wallet -= Dragon.cost
	print(wallet)


func _on_King_respect_from_kings(respect):
	wallet += respect
	if(respect > 0):
		print(wallet)


func _on_King_button_down():
	wallet -= King.cost
	print(wallet)

func _on_Healbtn_button_down():
	emit_signal("heal_player")
	pass


func save():
	var save_dict = {
		
		wallet = wallet
		
	}
	return save_dict



