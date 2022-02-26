//
//  Island.swift
//  iOS-Game-Getting-Started
//
//  Created by Ashkan Goharfar on 11/10/1400 AP.
//

import GameplayKit
import SpriteKit

class Island: GameObject
{
    // contrcutor / initializer
    init()
    {
        super.init(imageString: "island", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds()
    {
        // if it is then the motion is move so we need to call reset method
        if(position.y <= -730)
        {
            Reset()
        }
    }
    
    override func Reset()
    {
        position.y = 730
        
        // get a psudo random number -313 to 313
        let randomX:Int = (randomSource?.nextInt(upperBound: 616))! - 313
        position.x = CGFloat(randomX)
        isCollding = false
    }
    
    // Initialization
    override func Start()
    {
        
        // zPosition provide an opportunity to set different layers on the screen, for example: zPosition = 0 could be background and zPostion1 could be reels of slot machine
        Reset()
        zPosition = 1
//        zPosition = 0
        verticalSpeed = 5.0
    }
    
    override func Update() {
        Move()
        CheckBounds()
    }
    
    func Move()
    {
        position.y -= verticalSpeed!
    }
    
}


