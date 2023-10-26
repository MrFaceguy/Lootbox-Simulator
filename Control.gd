extends Control

#built-in Variables
@export var coins = 0
@export var lootboxes = 0



#Other Gameobjects
@onready var coinCounter = $"HBoxContainer/VBoxContainer/Coins Label"
@onready var lootboxCounter = $"HBoxContainer/VBoxContainer2/Lootbox Label"
@onready var itemList = $HBoxContainer/Panel/ScrollContainer/GridContainer

#External Scenes
@onready var rewardObject = preload("res://reward.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	coins = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	coinCounter.text = "Coins: " + str(coins)
	lootboxCounter.text = "Lootboxes: " + str(lootboxes)


func _on_coin_accumulator_timeout():
	coins += 1


func _on_buy_button_button_up():
	if coins >= 10:
		lootboxes += 1
		coins -= 10


func _on_open_button_button_up():
	if lootboxes >= 1:
		lootboxes -= 1
		var reward = rewardObject.instantiate()
		itemList.add_child(reward)
