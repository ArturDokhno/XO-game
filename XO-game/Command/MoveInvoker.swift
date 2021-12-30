//
//  MoveInvoker.swift
//  XO-game
//
//  Created by Артур Дохно on 29.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class MoveInvoker {
    
    static let shared: MoveInvoker = MoveInvoker()
    
    private var commands: [MoveCommand] = []
    private let batchSize = 10
    private var timer: Timer?
    
    private var completion: (() -> Void)?
    
    func addCommand(_ moveComand: MoveCommand) {
        self.commands.append(moveComand)
    }
    
    func clear() {
        self.commands.removeAll()
    }
    
    func needExecute() -> Bool {
        let needExecute =  self.commands.count == self.batchSize
        return needExecute
    }
    
    func execute(completion: @escaping () -> Void) {
        self.completion = completion
        
        commands = updateComandsOrder()
        configureTimer()
    }
    
    private func configureTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.5,
                                         target: self,
                                         selector: #selector(updateTimer),
                                         userInfo: nil,
                                         repeats: true)
        }
    }
    
    private func updateComandsOrder() -> [MoveCommand] {
        let firstPlayerCommands = [commands[0], commands[1], commands[2], commands[3], commands[4]]
        let secondPlayerCommands = [commands[5], commands[6], commands[7], commands[8], commands[9]]
        
        var newCommandsOrder: [MoveCommand] = []
        for i in 0..<firstPlayerCommands.count {
            newCommandsOrder.append(firstPlayerCommands[i])
            newCommandsOrder.append(secondPlayerCommands[i])
        }
        return newCommandsOrder
    }
    
    @objc private func updateTimer() {
        if commands.count > 0 {
            commands[0].execute()
            commands.remove(at: 0)
        } else {
            completion?()
            timer?.invalidate()
            timer = nil
        }
    }
}
