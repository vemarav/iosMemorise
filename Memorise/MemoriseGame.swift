//
//  MemoriseGame.swift
//  Memorise
//
//  Created by Aravind on 13/03/25.
//

import Foundation

struct MemoriseGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numOfCardPairs x 2 cards
        for pairIndex in 0..<max(2, numOfCardPairs) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
