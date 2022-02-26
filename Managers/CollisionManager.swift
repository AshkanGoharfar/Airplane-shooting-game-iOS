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
                    // make sounds when the plane colide with island
                    scene.run(SKAction.playSoundFileNamed("yay", waitForCompletion: false))
                    break
                case "cloud":
                    // print("Colliding with Cloud")
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
