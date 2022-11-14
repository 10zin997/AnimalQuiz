//
//  ContentView.swift
//  AnimalQuiz
//
//  Created by Tenzin wangyal on 11/4/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameManagerVM: GameManagerVM
    let options = GameManagerVM()
    var body: some View {
        //MARKS:Background
        ZStack {
            Image( "bg")
                .resizable()
                .aspectRatio(contentMode: .fill) //fill the bg to screen
                .ignoresSafeArea()
                .foregroundColor(.accentColor)
            LinearGradient(colors: [.purple.opacity(0.7),.blue.opacity(0.3)], startPoint: .topLeading, endPoint: .bottomTrailing) //puts cover over the bg
                .ignoresSafeArea()
            //MARKS: Text
            if gameManagerVM.model.quizCompleted{
                QuizCompletedView(gameManager: gameManagerVM)
            }else{
                VStack{
                    ReusableText(text: "Animal Knowldege", size: 30)
                        .padding()
                    ReusableText(text: gameManagerVM.model.quizModel.question , size: 25)
                        .lineLimit(nil) //text as much neded space.
                       // .frame(width: UIScreen.main.bounds.size.width - 20 , height: 60,alignment: .center)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    VStack{
                        ZStack{
                            Circle()
                                .stroke(lineWidth: 15 )
                                .foregroundColor(.gray)
                                .opacity(0.7)
                            
                            Circle()
                                .trim(from: 0.0, to:min(CGFloat(gameManagerVM.progress),1.0))
                                .stroke(LinearGradient(colors: [.black,.red,.orange,.brown,.green,.white], startPoint: .topLeading, endPoint: .bottomTrailing), style: StrokeStyle(lineWidth: 20,lineCap: .round,lineJoin: .round))
                                .rotationEffect(Angle(degrees: 270))
                                .animation(Animation.linear(duration: Double(gameManagerVM.maxProgress)), value: gameManagerVM.progress)
                            
                            ReusableText(text: String(gameManagerVM.progress), size: 50)
                        }.frame(width: 150,height: 150)
                        Spacer()
                        OptionsGridView(gameManagerVM: gameManagerVM)
                    }
                    
                }
     
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameManagerVM: GameManagerVM())
    }
}

