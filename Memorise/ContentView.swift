//
//  ContentView.swift
//  Memorise
//
//  Created by Aravind on 12/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis = ["🌸", "🌹", "🌺", "🌷"]
            ForEach(emojis, id: \.self) { emoji in
                CardView(content: emoji)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        let box = RoundedRectangle(cornerRadius: 12)
        ZStack {
            if isFaceUp {
                box.foregroundColor(.white)
                box.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                box
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
