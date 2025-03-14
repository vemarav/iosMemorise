//
//  EmojiMemoriseGameView.swift
//  Memorise
//
//  Created by Aravind on 12/03/25.
//

import SwiftUI

struct EmojiMemoriseGameView: View {
    @ObservedObject var viewModel: EmojiMemoriseGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
                    .padding()
                    .animation(.bouncy.speed(0.8), value: viewModel.cards)
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.cards) { card in
                CardView(card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(1)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    let card: MemoriseModel.Card
    
    init(_ card: MemoriseModel.Card) {
        self.card = card
    }
    
    var body: some View {
        let box = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                box.fill(Color.white)
                box.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.1)
                    .aspectRatio(1, contentMode: .fit)
            }
            box.opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}

#Preview {
    let viewModel = EmojiMemoriseGame()
    EmojiMemoriseGameView(viewModel: viewModel)
}
