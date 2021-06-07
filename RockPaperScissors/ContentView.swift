//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Daffashiddiq on 07/06/21.
//

import SwiftUI

struct ContentView: View {
    var moves = ["Rock","Paper","Scissors"]
    @State var moveBot = Int.random(in: 0...2)
    @State var score = false
    @State var sumScore = 0
    
    var body: some View {
        VStack {
            Text("Test Your Luck!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Text("Your Score is \(self.sumScore)")
                .font(.title)
                .padding()
            VStack{
                ForEach(moves, id: \.self){ item in
                    Button(action: {
                        self.itemTapped(item)
                    }){
                        Text(item)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black)
                            .background(Color.green)
                    }.padding()
                }
            }.alert(isPresented: $score){
                Alert(title: Text("Alert"), message: Text("Wanna Play Again ?"), dismissButton: .default(Text("Continue")){
                    self.replay()
                })
            }
        }
    }
    
    func itemTapped(_ item: String) {
        if(item == "Paper" && moveBot == 0) || (item == "Rock" && moveBot == 2) || (item == "Scissors" && moveBot == 1){
            sumScore += 1
        } else if (item == "Rock" && moveBot == 0) || (item == "Paper" && moveBot == 1) || (item == "Scissors" && moveBot == 2){
            sumScore = sumScore
        } else {
            sumScore -= 1
        }
        score = true
    }
    
    func replay() {
        moveBot = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
