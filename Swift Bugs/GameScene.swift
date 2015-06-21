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
        /* Setup your scene here
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
        */
        
        for idx in 1...50 {
            let mySprite = Bug(imageNamed:"bug")
            let frameX = arc4random_uniform(UInt32(UInt(self.frame.width)))
            let frameY = arc4random_uniform(UInt32(UInt(self.frame.height)))
            mySprite.position = CGPoint(x:CGFloat(frameX), y:CGFloat(frameY))
            mySprite.xScale = 0.25
            mySprite.yScale = 0.25
            mySprite.physicsBody = SKPhysicsBody(rectangleOfSize: mySprite.size)
            mySprite.physicsBody!.affectedByGravity = false
            //mySprite.physicsBody!.friction = 0.8
            self.addChild(mySprite)
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            for sprite in self.children {
                
                sprite.physicsBody!!.velocity=CGVector(dx: location.x - sprite.position.x, dy: location.y - sprite.position.y);
                sprite.physicsBody!!.angularVelocity=CGFloat(20)
                
                avoidBorders(sprite as! SKSpriteNode)
                
                /*
                let action = SKAction.moveTo(CGPoint(x:CGFloat(frameX), y:CGFloat(frameY)), duration: 2)
                sprite.runAction(action)
                */
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        for sprite in self.children {
            
        }
    }
    
    func avoidBorders(sprite: SKSpriteNode) {
//        if sprite.position.x > self.frame.width + sprite.size.width {
//            sprite.position.x = -1 * sprite.size.width
//        }
    }
}
