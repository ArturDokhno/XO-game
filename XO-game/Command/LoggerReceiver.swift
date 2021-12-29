//
//  LoggerReceiver.swift
//  XO-game
//
//  Created by Артур Дохно on 28.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import Foundation

class LoggerReceiver {
    
    static let shared: LoggerReceiver = LoggerReceiver()
    
    func log(mesage: String) {
        debugPrint(mesage)
    }
    
}

