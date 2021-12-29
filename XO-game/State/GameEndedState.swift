//
//  GameEndedState.swift
//  XO-game
//
//  Created by Артур Дохно on 28.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class GameFinishedState: GameState {
    
    var isCompleted: Bool = false
    
    let winner: Player?
    
    var inputState: GameViewInput
    
    init(winner: Player?, inputState: GameViewInput) {
        self.winner = winner
        
        self.inputState = inputState
    }
    
    func begin() {
        self.inputState.firstPlayerTurnLabel(hide: true)
        self.inputState.secondPlayerTurnLabel(hide: true)
        
        self.inputState.winnerLabel(hide: false)
        
        
        var text = "No winner"
        if let winner = self.winner {
            text = winner.winnerText()
        }
        self.inputState.winnerLabel(text: text)
    }
    
    func addMark(at position: GameboardPosition) {}
}


