//
//  QuestionView.swift
//  BeerQuiz
//
//  Created by Aymen Aifa on 16.06.22.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var beerQuizManager: BeerQuizManager
    
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("BeerQuiz Game")
                    .lilacTitle()
                Spacer()
                Text("\(beerQuizManager.index + 1) out of \(beerQuizManager.length)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
        
            ProgressBar(progress: beerQuizManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(beerQuizManager.question)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.gray)
                ForEach(beerQuizManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(beerQuizManager)
                }
            }
            
            Button {
                beerQuizManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next", background: beerQuizManager.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
            .disabled(!beerQuizManager.answerSelected)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        .navigationBarHidden(true)
       
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(BeerQuizManager())
    }
}
