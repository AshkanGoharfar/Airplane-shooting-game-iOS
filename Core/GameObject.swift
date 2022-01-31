//
//  GameObject.swift
//  iOS-Game-Getting-Started
//
//  Created by Ashkan Goharfar on 11/4/1400 AP.
//

import GameplayKit
import SpriteKit

// GameObject class is going to inherit (or extend) SKSprite node
class GameObject : SKSpriteNode, GameProtocol
{
    // Public instance memebers
    var horizontalSpeed: CGFloat?
    var verticalSpeed: CGFloat?
    var width: CGFloat?
    var height: CGFloat?
    var halfWidth: CGFloat?
    var halfHeight: CGFloat?
    var scale: CGFloat? // Uniform Scale
    var isCollding: Bool?
    var randomSource: GKARC4RandomSource?
    
    //constructor / initializer
    init(imageString: String, initialScale: CGFloat)
    {
        let texture = SKTexture(imageNamed: imageString)
        let color = UIColor.clear
        super.init(texture: texture, color: color, size: texture.size())
        
        scale = initialScale
        setScale(scale!)
        width = texture.size().width * scale!
        height = texture.size().height * scale!
        halfWidth = width! * 0.5
        halfHeight = height! * 0.5
        isCollding = false
        name = imageString
        randomSource = GKARC4RandomSource()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Lifecycle objects: the functions that we are going to use over and over again more game objects
    
    func CheckBounds() {
        
    }
    
    func Reset() {
        
    }
    
    func Start() {
        
    }
    
    func Update() {
        
    }
    
    //constructor / initializer
    
    // Colision manager is a seprate class which checks for seeing any collisions like it handles some things like handling game object to not overlap, or the collsion manager handles the shapes like being line, rectangle, circule and etc, or ...
}
