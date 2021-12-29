//
//  GameState.swift
//  XO-game
//
//  Created by Артур Дохно on 28.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

protocol GameState {
    
    var isCompleted: Bool { get }
    
    var inputState: GameViewInput { set get }
    
    func begin()
    
    func addMark(at position: GameboardPosition)
}
