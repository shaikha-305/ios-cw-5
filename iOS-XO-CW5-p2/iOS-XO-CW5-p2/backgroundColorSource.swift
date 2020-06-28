//
//  backgroundColorSource.swift
//  iOS-XO-CW5-p2
//
//  Created by Huda on 6/28/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import Foundation
import UIKit
import GameKit

struct BackgroundColorSource {
    let colors = [
        UIColor(displayP3Red: 27.0/255.0 , green: 52.0/255.0, blue: 125.0/255.0, alpha: 0),
        UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0),
        UIColor(displayP3Red: 152.0/255.0, green: 180.0/255.0, blue: 237.0/255.0, alpha: 0),
        UIColor(displayP3Red: 212.0/255.0, green: 184.0/255.0, blue: 140.0/255.0, alpha: 0),
        UIColor(displayP3Red: 242.0/255.0, green: 206.0/255.0, blue: 239.0/255.0, alpha: 0),
        UIColor(displayP3Red: 0, green: 35.0/255.0, blue: 82.0/255.0, alpha: 0)
    ]
    let colors1: UIColor = [
        UIColor(red: 27.0/255.0 , green: 52.0/255.0, blue: 125.0/255.0, alpha: 0),
                            
    ]
    
    func randomBackground() -> UIColor {
        let randomColor = GKRandomSource.sharedRandom().nextInt(upperBound: colors.count)
        return colors[randomColor]
    }
}
