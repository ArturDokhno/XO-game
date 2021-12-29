//
//  Copy.swift
//  XO-game
//
//  Created by Артур Дохно on 28.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import UIKit

protocol Copying {
    init(_ prototype: Self)
}

extension Copying {
    func makeCopy() -> Self {
        return type(of: self).init(self)
    }
}
