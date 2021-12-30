//
//  MenuViewController.swift
//  XO-game
//
//  Created by Артур Дохно on 29.12.2021.
//  Copyright © 2021 plasmon. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    private var gameMode = GameMode.oneMove
    private var gameType = GameType.pvi
    
    private let modeAlertTitle = "Game Mode"
    private let modeAlertMessage = "Select game mode"
    
    private let buttonModeOneMove = "Classic"
    private let buttonModeFiveMove = "Five move game"
    
    @IBAction func buttonAiGameTapped(_ sender: Any) {
        self.gameType = GameType.pvi
        self.gameMode = GameMode.oneMove
        openGame()
    }
    
    @IBAction func buttonHumansGameTapped(_ sender: Any) {
        self.gameType = GameType.pvp
        selectModeGameAlert()
    }
    
    private func openGame() {
        performSegue(withIdentifier: "showGame", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGame" {
            guard let upcoming = segue.destination as? GameViewController else { return }
            let gameSettings = GameSettings(gameMode: self.gameMode, gameType: self.gameType)
            upcoming.set(gameSettings: gameSettings)
        }
    }
    
    private func selectModeGameAlert() {
        let alertController = UIAlertController(title: modeAlertTitle,
                                                message: modeAlertMessage,
                                                preferredStyle: .alert)
        let actionOneMode = UIAlertAction(title: buttonModeOneMove,
                                          style: .default) { [weak self] (action:UIAlertAction) in
            self?.gameMode = GameMode.oneMove
            self?.openGame()
        }
        let actionFiveMode = UIAlertAction(title: buttonModeFiveMove,
                                           style: .default) { [weak self] (action:UIAlertAction) in
            self?.gameMode = GameMode.fiveMove
            self?.openGame()
        }
        alertController.addAction(actionOneMode)
        alertController.addAction(actionFiveMode)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

