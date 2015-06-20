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
        
        for idx in 1...20 {
            let mySprite = SKSpriteNode(imageNamed:"bug")
            let frameX = arc4random_uniform(UInt32(UInt(self.frame.width)))
            let frameY = arc4random_uniform(UInt32(UInt(self.frame.height)))
            mySprite.position = CGPoint(x:CGFloat(frameX), y:CGFloat(frameY))
            mySprite.xScale = 0.5
            mySprite.yScale = 0.5
            self.addChild(mySprite)
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            
            for sprite in self.children {
                
                let frameX = arc4random_uniform(UInt32(UInt(self.frame.width)))
                let frameY = arc4random_uniform(UInt32(UInt(self.frame.height)))
                
                let action = SKAction.moveTo(CGPoint(x:CGFloat(frameX), y:CGFloat(frameY)), duration: 2)
                sprite.runAction(action)
            }
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
