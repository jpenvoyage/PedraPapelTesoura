//
//  ContentView.swift
//  PedraPapelTesoura
//
//  Created by Joao Leal on 2/14/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pcScore = 0
    @State private var userScore = 0
    @State private var showingResults = false
    @State private var gameCount = 1
    
    @State private var pcChoice = Int.random(in: 0...2)
    
    @State private var shouldWin = Bool.random()
    @State private var gameOverAlert: Bool = false
    
    let weapons = ["👊🏼", "✋🏼", "✌🏼"]
    
    var body: some View {
        
        VStack{
            Spacer()
            Text("I have just played")
                .font(.title3)
                .fontWeight(.bold)
            Text("\(weapons[pcChoice])")
                .font(.system(size: 95))
            
            if shouldWin {
                Text("and you should WIN")
                    .foregroundStyle(.green)
                    .font(.title)
            } else {
                Text("and you should LOOSE")
                    .foregroundStyle(.red)
                    .font(.title)
            }
            HStack{
                ForEach(0..<3) { number in
                    Button(weapons[number]) {
                        joue(choice: number)
                    }
                }.font(.system(size: 80))
            }.alert("GaMe OvEr 💀", isPresented: $gameOverAlert) {
               Button("Reset", action: reset)
            }
            
            
            Spacer()
            HStack{
                Text("PC: \(pcScore)")
                Text("User \(userScore)")
            }
        }
    }
    func joue (choice: Int) {
        let winningWeapons = [1, 2, 0]
        let didWin: Bool
        
        if shouldWin {
            didWin = choice == winningWeapons[pcChoice]
        } else {
            didWin = winningWeapons[choice] == pcChoice
        }
        
        if didWin {
            userScore += 1
        } else {
            pcScore += 1
        }
        
        if gameCount == 10 {
            showingResults = true
            gameOverAlert = true
        } else {
            pcChoice = Int.random(in: 0..<3)
            shouldWin.toggle()
            gameCount += 1
            
        }
        
    }
    func reset() {
        pcChoice = Int.random(in: 0..<3)
        shouldWin.toggle()
        gameCount = 0
        pcScore = 0
        userScore = 0
    }
    
}
#Preview {
    ContentView()
}
