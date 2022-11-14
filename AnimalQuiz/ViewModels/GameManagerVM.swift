//
//  GameManagerVM.swift
//  AnimalQuiz
//
//  Created by Tenzin wangyal on 11/4/22.
//
//Description: data for question,answer and the options and their properties

//main game logic

import Foundation
import SwiftUI

//extended from observableObject, this is how we will publishing its data changes to any
//view thats listeining.
class GameManagerVM: ObservableObject{
    //increases the index with every correct answer, moving question to next one.
    static var currentIndex = 0
    
    static func createGameModel(i: Int) -> Quiz{
        return Quiz(currentQuestionIndex: i, quizModel: quizData[i])
    }
    
    @Published var model = GameManagerVM.createGameModel(i:GameManagerVM.currentIndex)
    
    var timer = Timer()
    var maxProgress = 15
    @Published var progress = 0
    init() {
        self.start()
    }
    
    func verifyAnswer(selectedOption: QuizOption) {
        //unselecting all the cards
        for index in model.quizModel.optionList.indices{
            model.quizModel.optionList[index].isMatched = false
            model.quizModel.optionList[index].isSelected = false
        }
        //check if answer is true
        if let index = model.quizModel.optionList.firstIndex(where:{ $0.optionId == selectedOption.optionId}){
            if selectedOption.optionId == model.quizModel.answer {
                model.quizModel.optionList[index].isMatched = true
                model.quizModel.optionList[index].isSelected = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                    if(GameManagerVM.currentIndex < 2){
                        GameManagerVM.currentIndex = GameManagerVM.currentIndex + 1
                        self.model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
                    }else{
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = true
                        self.reset()
                    }
                }
            }else{
                model.quizModel.optionList[index].isMatched = false
                model.quizModel.optionList[index].isSelected = true
                
            }
        }
    }
    func restartGame(){
        GameManagerVM.currentIndex = 0
        model = GameManagerVM.createGameModel(i: GameManagerVM.currentIndex)
        self.start()
    }
    func start(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats:true, block: { time in
                    if self.progress == self.maxProgress {
                        self.model.quizCompleted = true
                        self.model.quizWinningStatus = false
                        self.reset()
                    } else {
                        self.progress += 1
            }
        })
    }
    func reset(){
        timer.invalidate()
        self.progress = 0
    }
}

extension GameManagerVM
{
    static var quizData: [QuizModel] {
        [
            QuizModel(question: "Which is the fastest animal in the world?",
                      answer: "B",
                      optionList: [QuizOption(id: 11, optionId: "A", option: "Turtle", color: Color.yellow),
                                    QuizOption(id: 12,optionId: "B", option: "Cheetah", color: Color.red),
                                    QuizOption(id: 13,optionId: "C", option: "Rabbit", color: Color.green),
                                    QuizOption(id: 14,optionId: "D", option: "Leopard", color: Color.purple)]),
            
            QuizModel(question: "Which of these animals swims in upright position?",
                      answer: "C",
                      optionList: [QuizOption(id: 21,optionId: "A", option: "Sea Lion", color: Color.yellow),
                                    QuizOption(id: 22,optionId: "B", option: "Sea Urchin", color: Color.red),
                                    QuizOption(id: 23,optionId: "C", option: "Seahorse", color: Color.green),
                                    QuizOption(id: 24,optionId: "D", option: "Sea slug", color: Color.purple)]),
            
            QuizModel(question: "Which is the world largest living fish?",
                      answer: "B",
                      optionList: [QuizOption(id: 31,optionId: "A", option: "Manta Ray", color: Color.yellow),
                                    QuizOption(id: 32,optionId: "B", option: "Whale Shark", color: Color.red),
                                    QuizOption(id: 33,optionId: "C", option: "Marlin", color: Color.green),
                                    QuizOption(id: 34,optionId: "D", option: "Sailfish", color: Color.purple)])
        ]
    }
}
