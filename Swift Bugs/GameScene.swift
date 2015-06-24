//
//  GameScene.swift
//  Swift Bugs
//
//  Created by Chris Malven on 6/20/15.
//  Copyright (c) 2015 Chris Malven. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    override func didMoveToView(view: SKView) {
        
        for idx in 1...50 {
            let mySprite = Bug(imageNamed:"bug")
            let frameX = CGFloat(self.frame.width).rand
            let frameY = CGFloat(self.frame.height).rand
            mySprite.position = CGPoint(x:CGFloat(frameX), y:CGFloat(frameY))
            mySprite.xScale = 0.15
            mySprite.yScale = 0.15
            mySprite.physicsBody = SKPhysicsBody(rectangleOfSize: mySprite.size)
            mySprite.physicsBody!.affectedByGravity = false
            self.addChild(mySprite)
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            for sprite in self.children {
                let distanceFromTouch:CGFloat = CGVector(dx: location.x, dy: location.y).dist(CGVector(dx: sprite.position.x, dy: sprite.position.y))
                sprite.physicsBody!!.applyForce(CGVector(dx: location.x - sprite.position.x, dy: location.y - sprite.position.y).div(distanceFromTouch / 800))
            }
        }
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent) {
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        for sprite in self.children {
            sprite.update()
        }
    }
}
