//
//  ViewController.swift
//  iOS-XO-CW5-p2
//
//  Created by Huda on 6/27/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    @IBOutlet weak var oScoreLabel: UILabel!
    @IBOutlet weak var xScoreLabel: UILabel!
    var backgroundSound: AVAudioPlayer?
    var XTurnSound: AVAudioPlayer?
    var OTurnSound: AVAudioPlayer?
    var winnerSound: AVAudioPlayer?
    
    @IBOutlet weak var backgroundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    var turn = 0
    var oScore = 0
    var xScore = 0
    //Tap buton
    @IBAction func tap(_ sender: UIButton) {
       print("turn, \(turn)")
        if turn % 2 == 0 {
            sender.setTitle("X", for:  .normal)
            sender.setTitleColor(.green, for:  .normal)
            let path = Bundle.main.path(forResource: "PunchSoundEffect1.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                XTurnSound = try AVAudioPlayer(contentsOf: url)
                XTurnSound?.play()
                
                
            } catch {
                // couldn't load file :(
                
            }
            turnLabel.text = "O Turn"
        } else{
            sender.setTitle("O", for:  .normal)
            sender.setTitleColor(.red, for:  .normal)
            let path = Bundle.main.path(forResource: "PunchSoundEffect2.mp3", ofType:nil)!
            let url = URL(fileURLWithPath: path)

            do {
                OTurnSound = try AVAudioPlayer(contentsOf: url)
                OTurnSound?.play()
                
                
            } catch {
                // couldn't load file :(
                
            }
            turnLabel.text = "X Turn"

        }
        
       
       
        turn += 1
        print("after \(turn)")
        sender.isUserInteractionEnabled = false
        // ok alert conditions
        if checkWinner(p: "X"){
            
            turnLabel.text = "O Turn"
            //score board
            xScore += 1
            xScoreLabel?.text = "\(xScore)"
            if xScore == 3 {
                let path = Bundle.main.path(forResource: "missionPassSoundEffect.mp3", ofType:nil)!
                let url = URL(fileURLWithPath: path)

                do {
                    winnerSound = try AVAudioPlayer(contentsOf: url)
                    winnerSound?.play()
                    
                } catch {
                    // couldn't load file :(
                    
                }
                oScore = 0
                xScore = 0
                xScoreLabel.text = " "
                oScoreLabel.text = " "

            }
            
            let alertController = UIAlertController(title: "X WINS!😍", message: "RESET THE GAME!", preferredStyle: .alert)
            let resetAlert =  UIAlertAction(title: "RESET THE GAME!", style: .cancel) { (alert) in
                       self.resetTheGame()
                   }
            alertController.addAction(resetAlert)
            present(alertController, animated: true, completion: nil)
        }else if checkWinner(p: "O"){
            
            turnLabel.text = "X"
            // score board
            oScore += 1
            oScoreLabel.text = "\(oScore)"
            if oScore == 3 {
                           let path = Bundle.main.path(forResource: "missionPassSoundEffect.mp3", ofType:nil)!
                           let url = URL(fileURLWithPath: path)

                           do {
                               winnerSound = try AVAudioPlayer(contentsOf: url)
                               winnerSound?.play()
                               
                           } catch {
                               // couldn't load file :(
                               
                           }
                            oScore = 0
                            xScore = 0
                           xScoreLabel.text = " "
                           oScoreLabel.text = " "
                       }
            let alertController = UIAlertController(title: "O WINS!😍", message: "RESET THE GAME!", preferredStyle: .alert)
            let resetAlert =  UIAlertAction(title: "RESET THE GAME!", style: .cancel) { (alert) in
                       self.resetTheGame()
                   }
            alertController.addAction(resetAlert)
            present(alertController, animated: true, completion: nil)
            //  okAlert(title: "O Wins!!", message: "Congrats!😍 you can reset the game NOW!" )
            
        } else if turn == 9 {
            
                let alertController = UIAlertController(title: "no one ones☹️", message: "RESET THE GAME!", preferredStyle: .alert)
                let resetAlert =  UIAlertAction(title: "RESET THE GAME!", style: .cancel) { (alert) in
                           self.resetTheGame()
                       }
                alertController.addAction(resetAlert)
                present(alertController, animated: true, completion: nil)
        }

        let haptic = UIImpactFeedbackGenerator(style: .medium)
        haptic.prepare()
        haptic.impactOccurred()

    }
    // restart game from alert
    
    func resetAlert() {
        UIAlertAction(title: "RESET THE GAME!", style: .cancel) { (alert) in
            self.resetTheGame()
        }
    }
    
    // reset the game
    @IBAction func reset(_ sender: Any) {
       // Random color for BG
        backgroundLabel.backgroundColor = colors.randomElement()
        // reset the game
        var buttons: [UIButton] = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
           for button in buttons {
               button.setTitle("", for:  .normal)
               button.titleLabel?.text = ""
               button.isUserInteractionEnabled = true
               
           }
           turn = 0
           turnLabel.text = "X Turn"
          
       }
    func resetTheGame() {
        var buttons: [UIButton] = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
         for button in buttons {
             button.setTitle("", for:  .normal)
             button.titleLabel?.text = ""
             button.isUserInteractionEnabled = true
             
         }
         turn = 0
         turnLabel.text = "X Turn"
        
    }
    
    // winning conditions
    func checkWinner(p: String) -> Bool{
        let f1: String! = (b1.titleLabel?.text)
        let f2: String! = (b2.titleLabel?.text)
        let f3: String! = (b3.titleLabel?.text)
        let f4: String! = (b4.titleLabel?.text)
        let f5: String! = (b5.titleLabel?.text)
        let f6: String! = (b6.titleLabel?.text)
        let f7: String! = (b7.titleLabel?.text)
        let f8: String! = (b8.titleLabel?.text)
        let f9: String! = (b9.titleLabel?.text)
        
        let r1 = (f1,f2,f3) == (p,p,p)
        let r2 = (f4,f5,f6) == (p,p,p)
        let r3 = (f7,f8,f9) == (p,p,p)
        let c1 = (f1,f4,f7) == (p,p,p)
        let c2 = (f2,f5,f8) == (p,p,p)
        let c3 = (f3,f6,f9) == (p,p,p)
        let d1 = (f1,f5,f9) == (p,p,p)
        let d2 = (f3,f5,f7) == (p,p,p)
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            return true
        } else {
            return false
        }
        let alertController = UIAlertController(title: "\(p), WINS!😍", message: "RESET THE GAME!", preferredStyle: .alert)
        let resetAlert =  UIAlertAction(title: "RESET THE GAME!", style: .cancel) { (alert) in
                   self.resetTheGame()
               }
        
    }
    
   
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    // background music
    @IBAction func playMusic(_ sender: UIButton) {
        let path = Bundle.main.path(forResource: "backgroundSound.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            backgroundSound = try AVAudioPlayer(contentsOf: url)
            backgroundSound?.play()
            
        } catch {
            // couldn't load file :(
            
        }
    }
    @IBAction func stopMusic(_ sender: UIButton) {
        backgroundSound?.stop()
    }
    
}


