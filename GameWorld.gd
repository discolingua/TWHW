class_name Gameworld
extends Node2D

# call Blackjack.func()
const Blackjack = preload("Blackjack.gd")

onready var blackjack : Blackjack = Blackjack.new()
var blackjackDeck : Array = []
var playerHand : Array = []
var bossHand : Array = []

onready var cardHolder : Label = get_node("/root/GameWorld/HUD/CardHolder")

func _ready():
	blackjackDeck = blackjack.create_deck()
	playerHand = blackjack.deal_card(playerHand, blackjackDeck, 2)
#	cardHolder.text = playerHand[0] + " " + playerHand[1]


	
