//
//  ReusableText.swift
//  AnimalQuiz
//
//  Created by Tenzin wangyal on 11/4/22.
//

import Foundation
import SwiftUI

//MARKS: our text in vstacks has couple of similar properites, we can extract them in a differnt struct
//to make them resuable to avoid writing the same code over and over again
struct ReusableText: View {
    var text: String
    var size: CGFloat
    var body: some View {
        Text(text)
            .font(.system(size: size,weight: .bold, design: .rounded))
            .foregroundColor(.white)
            .shadow(color:Color.purple ,radius: 2,x: 0 , y: 3)
            .padding()
    }
}
