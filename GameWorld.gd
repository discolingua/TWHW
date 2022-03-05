class_name Gameworld
extends Node2D

# call Blackjack.func()
const Blackjack = preload("Blackjack.gd")

onready var blackjack : Blackjack = Blackjack.new()
var blackjackDeck : Array = []
var playerHand : Array = []
var bossHand : Array = []

func _ready():
	blackjackDeck = blackjack.create_deck()
	playerHand = blackjack.deal_card(playerHand, blackjackDeck, 2)
	print(playerHand[1])
	print(playerHand[0])

	
