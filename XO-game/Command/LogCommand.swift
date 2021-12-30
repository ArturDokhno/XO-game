//
//  LogCommand.swift
//  XO-game
//
//  Created by Артур Дохно on 28.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class LoggerCommand {
    
    let message: String
    
    init(message: String) {
        self.message = message
    }
    
    func execute() {
        LoggerReceiver.shared.log(mesage: self.message)
    }
    
}
