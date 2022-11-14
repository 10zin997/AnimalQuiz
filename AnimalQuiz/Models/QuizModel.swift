//
//  QuizModel.swift
//  AnimalQuiz
//
//  Created by Tenzin wangyal on 11/4/22.
//

import Foundation
import SwiftUI

//MARKS: model to make the application
//currentQuestionIndex: tracking the current question
//quizModel:
//quizCompleted: tracking if quiz is finished
//quizWinningStatus: tracking the status
struct Quiz{
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool = false
    var quizWinningStatus: Bool = false
}
//MARKS: QuizMode
//question
//answer
//optionList
struct QuizModel{
    var question: String
    var answer: String
    var optionList: [QuizOption]
}
//MARKS: QuizOption: Identifiable to use it dynamic forloop
//id
// optionId: option A,B,C, or D
// option: option picked
// color: color of optionId
// isSelected: when an option is selected
// isMatched: when an option is correct
struct QuizOption: Identifiable{
    var id: Int
    var optionId: String
    var option: String
    var color: Color
    var isSelected: Bool = false
    var isMatched: Bool = false
    
}

