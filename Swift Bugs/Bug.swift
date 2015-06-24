//
//  Bug.swift
//  Swift Bugs
//
//  Created by Christopher Malven on 6/21/15.
//  Copyright (c) 2015 Chris Malven. All rights reserved.
//

import SpriteKit

class Bug: SKSpriteNode {
    var acceleration = CGVector(dx: 0, dy: 0)
    var wanderTheta = CGFloat(0)
    let maxSpeed = CGVector(dx: 2, dy: 2)
    let maxForce = CGVector(dx: 0.15, dy: 0.15)
    
    let wanderR = 15
    let wanderD  = 400
    let change: CGFloat = 0.3

    func update() {
        wander()
        let x = CGFloat(1.0) * 4
        let y = CGFloat(1.0).rand * 4
        let newVector = CGVector(dx: x, dy: y)
        self.physicsBody?.applyForce(newVector)
    }
    
    func wander() {
        // Create the wander circle
        self.wanderTheta += CGFloat(1.0).rand * (change * 2)
        
        // Now we have to calculate the new location to steer towards on the wander circle
        
        // Start with velocity
        var circleloc = self.physicsBody?.velocity
        
        // Normalize to get heading
        circleloc = circleloc!.normalize
        
        // Multiply by distance
        circleloc = circleloc!.multiplyVector(CGVector(dx: wanderD, dy: wanderD))
        
        // Make it relative to location
        circleloc = circleloc!.addVector(CGVector(dx: self.position.x, dy: self.position.y))
        
        // We need to know the heading to offset wanderTheta
        let h = self.physicsBody?.velocity.direction
    }
    
    func seek() {
        
    }
    
    func applyForce() {
        
    }
    
    func vectorNormalize(vector: CGVector) {
        
    }
    
    func vectorMagnitude(vector: CGVector) {
        
    }
}