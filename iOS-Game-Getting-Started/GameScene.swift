//
//  GameScene.swift
//  iOS-Game-Getting-Started
//
//  Created by Ashkan Goharfar on 11/3/1400 AP.
//

import UIKit
import AVFoundation
import SpriteKit
import GameplayKit

let screenSize = UIScreen.main.bounds
var screenWidth: CGFloat?
var screenHeight: CGFloat?


class GameScene: SKScene {
    
    // instance variables, their priority is based on their level
    var ocean: Ocean?
    var island: Island?
    var plane: Plane?
    var clouds: [Cloud] = []
    
    override func didMove(to view: SKView) {
        screenWidth = frame.width
        screenHeight = frame.height
        
        name = "GAME"
        
        // add ocean to the scene
        ocean = Ocean() // allocate memory
        ocean?.position = CGPoint(x: 0, y: 773)
        addChild(ocean!) // add the ocean to the scene
        
        // add island to the scene
        island = Island() // allocate memory
        addChild(island!) // add the island to the scene
        
        // add plane to the scene
        plane = Plane() // allocate memory
        plane?.position = CGPoint(x: 0, y: -495)
        addChild(plane!)
        
        // add 3 clouds to the scene
        for index in 0...2
        {
            let cloud: Cloud = Cloud()
            clouds.append(cloud)
            addChild(clouds[index])
        }


    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    func touchUp(atPoint pos : CGPoint) {
        plane?.TouchMove(newPos: CGPoint(x: pos.x, y: -495))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        ocean?.Update()
        island?.Update()
        plane?.Update()
        
        // update each cloud in clouds
        for cloud in clouds
        {
            cloud.Update()
            CollisionManager.SquaredRadiousCheck(scene: self, object1: plane!, object2: cloud)
        }
        
        CollisionManager.SquaredRadiousCheck(scene: self, object1: plane!, object2: island!)
    }
}
