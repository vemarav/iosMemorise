//
//  EmojiMemoryGame.swift
//  Memorise
//
//  Created by Aravind on 13/03/25.
//

import SwiftUI

typealias MemoriseModel = MemoriseGame<String>
typealias Card = MemoriseModel.Card

// ViewModel
class EmojiMemoriseGame: ObservableObject {
    private static let emojis = [
        "🌸", "🌹", "🌺", "🌷", "💐", "🌻", "🌼", "🍀", "🌿", "🌾",
        "🌱", "🌲", "🌳", "🌵", "🌴", "🌾", "🍃", "🍂", "🍁", "🪻",
        "🪴", "🪷", "💮", "🏵️", "🎋", "🎍", "🌐", "☘️", "🌚", "🌞"
    ]
    
    private static func createMemoriseGame() -> MemoriseModel {
        return MemoriseModel(numOfCardPairs: 10) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoriseGame()
    
    var cards: Array<Card> {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
}
