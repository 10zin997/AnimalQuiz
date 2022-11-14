//
//  AnimalQuizApp.swift
//  AnimalQuiz
//
//  Created by Tenzin wangyal on 11/4/22.
//

import SwiftUI

@main
struct AnimalQuizApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(gameManagerVM: GameManagerVM())
        }
    }
}
