//
//  PlayerFiveMovesInputState.swift
//  XO-game
//
//  Created by Артур Дохно on 30.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class PlayerFiveMovesInputState: GameState {
    
    var isCompleted: Bool = false
    
    let player: Player
    private let maximumMoveCounts = 5
    
    var inputState: GameViewInput
    
    weak var gameboard: Gameboard?
    weak var gameboardView: GameboardView?
    private var playerInputMoves: [GameboardPosition] = []
    private let moveInvoker = MoveInvoker.shared
    
    
    
    init(player: Player, inputState: GameViewInput, gameboard: Gameboard, gameboardView: GameboardView) {
        self.player = player
        
        self.inputState = inputState
        
        self.gameboard = gameboard
        self.gameboardView = gameboardView
    }
    
    internal func begin() {
        switch self.player {
        case .first:
            self.inputState.firstPlayerTurnLabel(hide: false)
            self.inputState.secondPlayerTurnLabel(hide: true)
        case .second:
            self.inputState.firstPlayerTurnLabel(hide: true)
            self.inputState.secondPlayerTurnLabel(hide: false)
        }
        self.inputState.winnerLabel(hide: true)
    }
    
    func addMark(at position: GameboardPosition) {
        if self.isCompleted { return }
        if self.playerInputMoves.contains(position) {
            self.inputState.incorrectMoveLabel(hide: false)
            return
        }
        self.inputState.incorrectMoveLabel(hide: true)
        
        addMove(at: position)
        if playerInputMoves.count == maximumMoveCounts {
            self.isCompleted = true
        }
    }
    
    private func addMove(at position: GameboardPosition)  {
        playerInputMoves.append(position)
        
        guard let gameboard = gameboard,
            let gameboardView = gameboardView else { return }
        let command = MoveCommand(position: position, player: player, gameboard: gameboard, gameboardView: gameboardView)
        moveInvoker.addCommand(command)
    }
    
}
