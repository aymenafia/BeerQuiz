//
//  ContentView.swift
//  BeerQuiz
//
//  Created by Aymen on 25.05.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var BeerQuizManger = BeerQuizManager()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack (spacing: 20) {
                    Text("BeerQuiz Game")
                        .lilacTitle()
                    Text("Are you ready to test out your BeerQuiz skills?")
                     
                        .foregroundColor(Color("AccentColor"))
                }
                
                NavigationLink {
                    BeerQuizView()
                        .environmentObject(BeerQuizManger)
                } label: {
                    PrimaryButton(text: "Let's go")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
