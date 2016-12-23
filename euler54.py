import io
from collections import Counter

A_WINS = 0
B_WINS = 1

cvalue = {'2': 2,
          '3': 3,
          '4': 4,
          '5': 5,
          '6': 6,
          '7': 7,
          '8': 8,
          '9': 9,
          'T': 10,
          'J': 11,
          'Q': 12,
          'K': 13,
          'A': 14}

def value(card):
    return cvalue[card[0]]

def suite(card):
    return card[1]

def is_royal_hand(values):
    return 60 == sum(values)

def is_flush_hand(suites):
    return len(set(suites)) == 1

def is_straight_hand(cards, values):
    m = min(values)
    return [m+4, m+3, m+2, m+1, m] == values

def comparable_values(frequency):
    return map(lambda e: e[0], sorted(frequency, key=lambda e: [e[1], e[0]], reverse=True))

def score(hand):
    values = sorted(map(value, hand), reverse=True)
    suites = map(suite, hand)

    is_flush = is_flush_hand(suites)
    if is_flush and is_royal_hand(values):
        return [10, values]

    is_straight = is_straight_hand(hand, values)
    if is_flush and is_straight:
        return [9, values]

    counter = Counter(values)
    if len(counter) == 2:
        mc = counter.most_common(2)
        if mc[0][1] == 4:
            return [8, comparable_values(mc)]
        if mc[0][1] == 3:
            return [7, comparable_values(mc)]

    if is_flush:
        return [6, values]

    if is_straight:
        return [5, values]

    if len(counter) == 3:
        mc = counter.most_common(3)
        if mc[0][1] == 3:
            return [4, comparable_values(mc)]
        if mc[0][1] == 2 and mc[1][1] == 2:
            return [3, comparable_values(mc)]

    if len(counter) == 4:
        mc = counter.most_common(4)
        return [2, comparable_values(mc)]

    return [1, values]

def evaluate(game):
    cards = game.split()

    a_hand = cards[:5]
    b_hand = cards[5:]

    a_score = score(a_hand)
    b_score = score(b_hand)

    result = A_WINS if a_score > b_score else B_WINS

    return result

with io.open('p054_poker.txt') as data:
    print(sum([int(evaluate(game) == A_WINS) for game in data]))
