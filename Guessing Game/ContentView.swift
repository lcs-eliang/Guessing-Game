//
//  ContentView.swift
//  Guessing Game
//
//  Created by Emily Liang on 2020-11-17.
//

import SwiftUI

struct ContentView: View {
    
    // The guess made by the user
    @State private var theUserGuess = ""
    
    //The number that the user should guess
    @State private var target = Int.random(in: 1...100)
    
    // Feedback to the user
    @State private var feedback = ""
    
    //Keep track of whether the game is over
    @State private var gameOver = false
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                Form {
                    Section {
                    Text("I'm thinking of a number between 1 and 100. Guess what it is!")
                        .font(.title3)
    
                    TextField("Enter your guess here", text: $theUserGuess)
                        .keyboardType(.decimalPad)
                    }
                    
                    Section {
                        Button("                        Submit Guess"){
                            // Check the guess
                            checkGuess()
                        }
                    }
                    
                    Section {
                        Text("History:\(theUserGuess)")
                    }
                    
                    
                    // Only show output once input has been provided
                    if theUserGuess.count > 0 {
                        
                        Text("\(feedback)")
                            .font(.title)
                        
                    }
                    
                    if gameOver == true {
                        Button("Reset Game") {
                            resetGame()
                        }
                    }
                }
                Spacer()
                
            }
            .navigationTitle("Guessing Game")
        }
    
    }
    
    //Check what the user guessed against the target
    func checkGuess() {
        
        // See if the user gave us an integer in the expected range
        guard let givenInteger = Int(theUserGuess) else {
            feedback = "Please provide an integer between 1 and 100."
            return
        }
        guard givenInteger > 0, givenInteger < 101 else{
            feedback = "Please provide an integer between 1 and 100."
            return
        }
        if givenInteger == target{
            feedback = "You guessed it!"
            gameOver = true
        }
        
        if givenInteger > target{
            feedback = "Guess lower."
        }
        
        if givenInteger < target{
            feedback = "Guess higher."
        }
    }
    
    // Reset the game
    func resetGame(){
        
        // Pick a new random number
        target = Int.random(in: 1...100)
        
        // Clear out the old feedback from the prior round
        theUserGuess = ""
        feedback = ""
        
        // The new game... is not over
        gameOver = false
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
