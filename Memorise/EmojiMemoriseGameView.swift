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
                cards.padding()
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(1)
            }
        }
        .foregroundColor(.orange)
    }
}


struct CardView: View {
    let card: MemoriseModel.Card
    
    var body: some View {
        let box = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                box.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 100))
                    .minimumScaleFactor(0.1)
                    .aspectRatio(1, contentMode: .fit)
            }
            box.fill().opacity(card.isFaceUp ? 0 : 1)
        }
    }
}

#Preview {
    let viewModel = EmojiMemoriseGame()
    EmojiMemoriseGameView(viewModel: viewModel)
}
