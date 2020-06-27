//
//  ViewController.swift
//  iOS-XO-CW5-p2
//
//  Created by Huda on 6/27/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import UIKit

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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var turn = 0
    @IBAction func tap(_ sender: UIButton) {
        if turn % 2 == 0 {
            sender.setTitle("X", for:  .normal)
            sender.setTitleColor(.green, for:  .normal)
            turnLabel.text = "O Turn"
        } else{
            sender.setTitle("O", for:  .normal)
            sender.setTitleColor(.red, for:  .normal)
            turnLabel.text = "X Turn"
            
        }
        turn += 1
        sender.isUserInteractionEnabled = false
        
        if checkWinner(p: "X"){
            okAlert(title: "X Wins!!", message: "Congrats!😍 you can reset the game NOW!" )
            turnLabel.text = "O"
        }else if checkWinner(p: "O"){
            okAlert(title: "O Wins!!", message: "Congrats!😍 you can reset the game NOW!" )
            turnLabel.text = "X"
        } else if turn == 9 {
            okAlert(title: "No one ones☹️", message: "reset game NOW!")
        }
        
    }
    func checkWinner(p: String) -> Bool{
        let f1 = (b1.titleLabel?.text)!
        let f2 = (b2.titleLabel?.text)!
        let f3 = (b3.titleLabel?.text)!
        let f4 = (b4.titleLabel?.text)!
        let f5 = (b5.titleLabel?.text)!
        let f6 = (b6.titleLabel?.text)!
        let f7 = (b7.titleLabel?.text)!
        let f8 = (b8.titleLabel?.text)!
        let f9 = (b9.titleLabel?.text)!
        
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
    }
    
    @IBAction func reset(_ sender: Any) {
        var buttons: [UIButton] = [b1, b2, b3, b4, b5, b6, b7, b8, b9]
        for button in buttons {
            button.setTitle("", for:  .normal)
            button.titleLabel?.text = ""
            button.isUserInteractionEnabled = true
            
        }
        turn = 0
        turnLabel.text = "X Turn"
    }
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

