//
//  CGVectorExtension.swift
//  Swift Bugs
//
//  Created by Christopher Malven on 6/23/15.
//  Copyright (c) 2015 Chris Malven. All rights reserved.
//

import SpriteKit
import Foundation

extension CGVector {
    
    var magnitude: CGFloat {
        let product = (self.dx * self.dx) + (self.dy * self.dy)
        return sqrt(product)
    }
    
    var normalize: CGVector {
        let m: CGFloat = self.magnitude
        return self.div(m)
    }
    
    var direction: CGVector {
        // NOT YET IMLEMENTED
        let m: CGFloat = self.magnitude
        return self.div(m)
    }
    
    func mult(num:CGFloat) -> CGVector {
        let x:CGFloat = self.dx * num
        let y:CGFloat = self.dy * num
        return CGVector(dx: x, dy: y)
    }
    
    func div(num:CGFloat) -> CGVector {
        let x:CGFloat = self.dx / num
        let y:CGFloat = self.dy / num
        return CGVector(dx: x, dy: y)
    }
    
    func addVector(vector:CGVector) -> CGVector {
        let x:CGFloat = self.dx + vector.dx
        let y:CGFloat = self.dy + vector.dy
        return CGVector(dx: x, dy: y)
    }
    
    func multiplyVector(vector:CGVector) -> CGVector {
        let x:CGFloat = self.dx * vector.dx
        let y:CGFloat = self.dy * vector.dy
        return CGVector(dx: x, dy: y)
    }
    
    func dist(vector:CGVector) -> CGFloat {
        var xs = CGFloat(0.0)
        var ys = CGFloat(0.0)
        
        xs = self.dx - vector.dx
        xs = xs * xs
        
        ys = self.dy - vector.dy
        ys = ys * ys
        
        return sqrt(xs + ys)
    }
}