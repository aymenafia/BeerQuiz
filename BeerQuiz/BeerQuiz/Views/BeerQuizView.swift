//
//  TriviaView.swift
//  BeerQuiz
//
//  Created by Aymen Aifa on 16.06.22.
//

import SwiftUI

struct BeerQuizView: View {
    @EnvironmentObject var beerQuizManager: BeerQuizManager

    var body: some View {
        if beerQuizManager.reachedEnd {
            VStack(spacing: 20) {
                Text("BeerQuiz Game")
                    .lilacTitle()

                Text("Congratulations, you completed the game! 🥳")
                
                Text("You scored \(beerQuizManager.score) out of \(beerQuizManager.length)")
                
                Button {
                    Task.init {
                        await beerQuizManager.fetchBeerQuiz()
                    }
                } label: {
                    PrimaryButton(text: "Play again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        } else {
            QuestionView()
                .environmentObject(beerQuizManager)
        }
    }
}

struct BeerQuizView_Previews: PreviewProvider {
    static var previews: some View {
        BeerQuizView()
            .environmentObject(BeerQuizManager())
    }
}
