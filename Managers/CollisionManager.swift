//
//  CollisionManager.swift
//  iOS-Game-Getting-Started
//
//  Created by Ashkan Goharfar on 2022-02-09.
//  ICE3

import SpriteKit
import GameplayKit

class CollisionManager
{
    // ICE3 last part
    // As I call the ScoreManager object to change score and live value, but they didn't change, we call the gameviewcontroller object here to call it in GameView Controller ***
    // So, in general, we made a global reference to the gameviewcontroller
    public static var gameViewController: GameViewController?
    
    // Utillity Function
    public static func SquaredDistance(point1: CGPoint, point2: CGPoint) -> CGFloat
    {
        let Xs: CGFloat = point2.x - point1.x
        let Ys: CGFloat = point2.y - point1.y
        return Xs * Xs + Ys * Ys
    }
    
    public static func SquaredRadiousCheck(scene: SKScene, object1: GameObject, object2: GameObject) -> Void
    {
        let P1 = object1.position
        let P2 = object2.position
        let P1Radius = object1.halfHeight!
        let P2Radius = object2.halfHeight!
        let Radii = P1Radius + P2Radius
        
        if (SquaredDistance(point1: P1, point2: P2) < Radii * Radii)
        {
            // we have a collision here
            if (!object2.isCollding!)
            {
                switch (object2.name)
                {
                case "island":
                    // print("Colliding with Island")
                    
                    // calculate the score when the plane colide with island
                    ScoreManager.Score += 100
                    
                    // ICE 3 last part, call update score here to update collision manager
                    gameViewController?.updateScoreLabel()
                    
                    // make sounds when the plane colide with island
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    break
                case "cloud":
                    // print("Colliding with Cloud")
                    
                    // calculate the lives when the plane colide with island
                    ScoreManager.Lives -= 1
                    
                    // ICE 3 last part, call update lives here to update collision manager
                    gameViewController?.updateLivesLabel()
                    
                    // make sounds when the plane colide with cloud
                    scene.run(SKAction.playSoundFileNamed("thunder", waitForCompletion: false))
                    break
                default:
                    break
                }
                object2.isCollding = true
            }
        }
    }
}
