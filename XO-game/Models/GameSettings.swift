//
//  GameSettings.swift
//  XO-game
//
//  Created by Артур Дохно on 30.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class GameSettings {
    
    let gameMode: GameMode
    let gameType: GameType
    
    init() {
        self.gameType = GameType.pvp
        self.gameMode = GameMode.oneMove
    }
    
    init(gameMode: GameMode, gameType: GameType ) {
        self.gameMode = gameMode
        self.gameType = gameType
    }
}
