//
//  Ocean.swift
//  iOS-Game-Getting-Started
//
//  Created by Ashkan Goharfar on 11/4/1400 AP.
//

import GameplayKit
import SpriteKit

class Ocean: GameObject
{
    // contrcutor / initializer
    init()
    {
        super.init(imageString: "ocean", initialScale: 2.0)
        Start()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // LifeCycle Functions
    override func CheckBounds() {
        // if it is then the motion is move so we need to call reset method
        if(position.y <= -773){
            Reset()
        }
    }
    
    override func Reset() {
        position.y = 773
    }
    
    // Initialization
    override func Start() {
        
        // zPosition provide an opportunity to set different layers on the screen, for example: zPosition = 0 could be background and zPostion1 could be reels of slot machine
        zPosition = 0
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
