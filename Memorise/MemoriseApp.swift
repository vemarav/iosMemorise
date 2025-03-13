//
//  MemoriseApp.swift
//  Memorise
//
//  Created by Aravind on 12/03/25.
//

import SwiftUI

@main
struct MemoriseApp: App {
    let viewModel = EmojiMemoriseGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoriseGameView(viewModel: viewModel)
        }
    }
}
