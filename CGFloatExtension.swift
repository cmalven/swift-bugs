//
//  CGFloatExtension.swift
//  Swift Bugs
//
//  Created by Christopher Malven on 6/21/15.
//  Copyright (c) 2015 Chris Malven. All rights reserved.
//

import SpriteKit

extension CGFloat {
    
    var rand: CGFloat {
        return CGFloat(arc4random_uniform(UInt32(UInt(self))))
    }
}
