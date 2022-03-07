class_name Blackjack

const DECKS = 4

enum D_VAL {
	C2 = 2,
	C3 = 3,
	C4 = 4,
	C5 = 5,
	C6 = 6,
	C7 = 7,
	C8 = 8,
	C9 = 9,
	C10 = 10,
	J = 10,
	Q = 10,
	K = 10,
	A = 11,
	AP = 1
}

func test_func( testString:String ):
	print( "hello ")
	return( testString + "***")

# Checks if there's an ace in the hand in case total went over 21
func check_ace(hand): 
	if 'A' in hand:
		hand[hand.index('A')] = 'A.'
		return true
	else:
		return false


# Calculates sum total values from a list of strings using a dictionary
func hand_total(hand): 
	var _j = 0
	for _i in hand:
		_j += D_VAL._i
	return _j


# Deals a card, defaulted to one card
func deal_card(hand, deck, num_of_cards=1): 
	for _i in range(num_of_cards):
		hand.append(deck[0])
		deck.pop_front()
	return hand


# Creates a standard playing card deck, defaulted to one deck
func create_deck():
	var deck : Array = [] 
	for _i in range (DECKS * 4):
		deck.append_array( ['2','3','4','5','6','7','8','9','10','J','Q','K','A'])
	deck.shuffle()
	return deck

# prints player's current hand and total
func player_print(hand, total): 
	print("\nYour hand: ", hand, "\nYour total: ", total)


# Prints dealer's current hand and total
func dealer_print(hand, total): 
	print("\nDealer hand: ", hand, "\nDealer total: ", total)

