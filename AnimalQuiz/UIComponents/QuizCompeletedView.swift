//
//  QuizCompeletedView.swift
//  AnimalQuiz
//
//  Created by Tenzin wangyal on 11/7/22.
//

import Foundation
import SwiftUI

struct QuizCompletedView:View{
    var gameManager: GameManagerVM
    var body: some View{
        VStack{
            Image(systemName: "gamecontroller.fill")
                .foregroundColor(.yellow)
                .font(.system(size: 60))
                .padding()
            ReusableText(text: gameManager.model.quizWinningStatus
                         ? "Thats a wrap": "Game over",
                         size: 30)
            .padding()
            ReusableText(text: gameManager.model.quizWinningStatus
                         ? "Thank you for playing" : "Better luck next time", size: 30)
                .padding()
            Button{
                gameManager.restartGame()
            }label: {
                HStack {
                                    Image(systemName: "play.fill")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24))
                                        .padding()
                                    
                                    Text("Play Again")
                                        .foregroundColor(.white)
                                        .font(.system(size: 24, weight: .bold, design: .rounded))
                                }
                            }.frame(width: 300, height: 60, alignment: .center)
                                .background(.purple.opacity(0.7))
                                .cornerRadius(30)
                                .padding()
        }
    }
}

struct QuizCompletedView_Previews: PreviewProvider {
    static var previews: some View {
        QuizCompletedView(gameManager: GameManagerVM())
    }
}
