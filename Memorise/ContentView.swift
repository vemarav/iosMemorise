//
//  ContentView.swift
//  Memorise
//
//  Created by Aravind on 12/03/25.
//

import SwiftUI

struct ContentView: View {
    let emojis = [
        "🌸", "🌹", "🌺", "🌷", "💐", "🌻", "🌼", "🍀", "🌿", "🌾",
        "🌱", "🌲", "🌳", "🌵", "🌴", "🌾", "🍃", "🍂", "🍁", "🪻",
        "🪴", "🪷", "💮", "🏵️", "🎋", "🎍", "🌐", "☘️", "🌚", "🌞"
    ]
    @State var numberOfCards = 17
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                cards.padding()
            }
            Divider()
            actions
                .padding(.bottom, -10)
                .padding(.top, 10)
                .padding(.leading, 20)
                .padding(.trailing, 10)
                
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
            ForEach(0..<numberOfCards, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.orange)
        .animation(.bouncy, value: numberOfCards)
    }
    
    func cardsAdjuster(by offset: Int, name: String) -> some View {
        Button(action: {
            numberOfCards = min(emojis.count, max(1, numberOfCards + offset))
        }, label: {
            Image(systemName: name)
        }).disabled(numberOfCards + offset < 1 || numberOfCards + offset > emojis.count)
    }
    
    var removeCard: some View {
        cardsAdjuster(by: -1, name: "rectangle.stack.badge.minus.fill")
    }
    
    var addCard: some View {
        cardsAdjuster(by: 1, name: "rectangle.stack.badge.plus.fill")
    }
    
    var actions: some View {
        HStack {
            removeCard
            Spacer()
            addCard
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        let box = RoundedRectangle(cornerRadius: 12)
        ZStack {
            Group {
                box.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            }
            box.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
