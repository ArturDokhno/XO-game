//
//  MenuViewController.swift
//  XO-game
//
//  Created by Артур Дохно on 29.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    private var gameType = GameType.pvi
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonAiGameTapped(_ sender: Any) {
        self.gameType = GameType.pvi
        openGame()
    }
    
    
    @IBAction func buttonHumansGameTapped(_ sender: Any) {
        self.gameType = GameType.pvp
        openGame()
    }
    
    
    private func openGame() {
        performSegue(withIdentifier: "showGame", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGame" {
            guard let upcoming = segue.destination as? GameViewController else { return }
            upcoming.set(gameType: self.gameType)
        }
    }
    
    
}

