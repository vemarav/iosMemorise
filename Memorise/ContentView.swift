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
            CardView(isFaceUp: true)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
            CardView(isFaceUp: false)
        }
        .foregroundColor(.orange)
        .padding()
    }
}


struct CardView: View {
    @State var isFaceUp = false
    let box = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        ZStack {
            if isFaceUp {
                box.foregroundColor(.white)
                box.strokeBorder(lineWidth: 2)
                Text("🌸").font(.largeTitle)
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
