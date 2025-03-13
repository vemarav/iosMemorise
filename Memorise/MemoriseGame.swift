//
//  MemoriseGame.swift
//  Memorise
//
//  Created by Aravind on 13/03/25.
//

import Foundation

struct MemoriseGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    var indexOfFaceUpCard: Int? {
        get { cards.indices.filter { cards[$0].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    init(numOfCardPairs: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        for pairIndex in 0..<max(2, numOfCardPairs) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex)a"))
            cards.append(Card(content: content, id: "\(pairIndex)b"))
        }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                if let mayBeMatchIndex = indexOfFaceUpCard {
                    if(cards[chosenIndex].content == cards[mayBeMatchIndex].content) {
                        cards[chosenIndex].isMatched = true
                        cards[mayBeMatchIndex].isMatched = true
                    }
                } else {
                    indexOfFaceUpCard = chosenIndex
                }
            }
            cards[chosenIndex].isFaceUp = true
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print(cards)
    }
    
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        
        var id: String
        var debugDescription: String {
            return "\(id): \(isFaceUp ? "Visible" : "Hidden") \(isMatched ? "Matched" : "Unmatched") \(content)"
        }
    }
}

extension Array {
    var only: Element? { count == 1 ? first : nil }
}
