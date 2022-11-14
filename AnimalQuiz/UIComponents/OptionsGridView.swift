//
//  OptionsGridView.swift
//  AnimalQuiz
//
//  Created by Tenzin wangyal on 11/4/22.
//
//options in a grid structure

import Foundation
import SwiftUI

struct OptionsGridView: View{
    var gameManagerVM: GameManagerVM
    //MARKS: columns: a property of lazyVGrid
        //count: number of column
        //fixed griditem : 170 width and 170 height on each option
    var columns: [GridItem] = Array(repeating: GridItem(.fixed(170),spacing: 0), count: 2)
    @State private var quizRecord = GameManagerVM.quizData[0]
    var body: some View{
        //MARKS: lazyVGrid - a container that grows vertically, as more item is added.
            //spacing: space between each item (both horizontally and vertically
        LazyVGrid(columns: columns, spacing: 20){
            //MARKS: forloop that iterates each item in optionList
            ForEach(gameManagerVM.model.quizModel.optionList){ quizOption in
                OptionCardView(quizOption: quizOption)
                    .onTapGesture {
                        gameManagerVM.verifyAnswer(selectedOption: quizOption)
                    }
            }
        }
    }
}

struct OptionCardView: View{
    var quizOption: QuizOption
    var body: some View{
        VStack{
            if(quizOption.isMatched) && (quizOption.isSelected){
                OptionsStatusImageView(imageName: "checkmark") //if answer is right checmark
            }else if (!(quizOption.isMatched) && (quizOption.isSelected)){
                OptionsStatusImageView(imageName: "xmark") //if wrong x mark
            }else{
                OptionsView(quizOption: quizOption) //if not is selceted stay in that view
            }
            
        }.frame(width:150, height: 150)
            .background(setBackgroundColor())
            .cornerRadius(40)
    }
    func setBackgroundColor() -> Color{
        if (quizOption.isSelected) && (quizOption.isMatched){
            return Color.green
        }else if (!(quizOption.isMatched) && (quizOption.isSelected)){
            return Color.red
        }else{
            return Color.white
        }
    }
}

struct OptionsView: View{
    var quizOption: QuizOption
    var body: some View{
        VStack{
            Text(quizOption.optionId)
                .font(.system(size: 30,weight: .bold,design: .rounded))
                .frame(width: 50,height: 50)
                .background(quizOption.color.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(25)
            Text(quizOption.option)
                .frame(width: 150,height: 30)
                .font(.system(size: 20,weight: .bold,design: .rounded))
        }
    }
}


struct OptionsStatusImageView: View{
    var imageName: String
    var body: some View{
        Image(systemName: imageName)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding(EdgeInsets(top: 40, leading: 40, bottom: 40, trailing: 40))
    }
}











struct OptionsViewGridView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Image("bg")
            OptionsGridView(gameManagerVM: GameManagerVM())
        }
       
        
    }
}
