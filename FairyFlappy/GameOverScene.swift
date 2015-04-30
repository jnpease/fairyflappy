//
//  GameOverScene.swift
//  FairyFlappy
//
//  Created by Jessie Pease on 4/27/15.
//  Copyright (c) 2015 Jessie Pease. All rights reserved.
//

import SpriteKit


class GameOverScene: SKScene {
    
    var restartScene :SKScene!
    var background: SKSpriteNode!
    var myLabel: SKLabelNode!
    var allowedToTap: Bool!
    var scoreLabel: SKLabelNode!
    var currentScore: Int!
    
    
    override func didMoveToView(view: SKView) {
        println("YAY! Loadedddddd")
        
        allowedToTap = false
        self.size = view.frame.size
        
        /*Initialize restart scene*/
        restartScene = GameScene.unarchiveFromFile("GameScene") as? GameScene
        
        /*Initialize background*/
        self.background = SKSpriteNode(imageNamed: "rainbowforest.jpg")
        background.anchorPoint = CGPointZero
        background.position = CGPointMake(-frame.size.width, 0)
        background.zPosition = -15
        background.size = CGSize(width: frame.size.width*2, height: frame.size.height)
        self.addChild(background)
        
        self.runAction(SKAction.waitForDuration(NSTimeInterval(1.0)), completion: {self.labelHelper()})
    }
    
    func labelHelper() {
        self.myLabel = SKLabelNode(fontNamed:"AppleSDGothicNeo-Light")
        self.myLabel.text = "Tap to Restart";
        self.myLabel.fontSize = 55;
        self.myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: self.frame.height*2/3);
        self.addChild(myLabel)
        
        self.scoreLabel = SKLabelNode(fontNamed:"AppleSDGothicNeo-Light")
        let toPrint = "Score: " + String(currentScore)
        self.scoreLabel.text = toPrint
        self.scoreLabel.fontSize = 55;
        self.scoreLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y: self.frame.height/3);
        self.addChild(scoreLabel)
        
        self.allowedToTap = true
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        if ((self.allowedToTap) == true) {
            self.view?.presentScene(restartScene)
        }
    }
    
}