//
//  GameProtocol.swift
//  iOS-Game-Getting-Started
//
//  Created by Ashkan Goharfar on 11/4/1400 AP.
//

// This class is making contract between code and the classes that we are using

protocol GameProtocol
{
    // Prevent an object from leaving the screen or detect that it has done so.
    func CheckBounds()
    
    // Reset our GameObject offscreen.
    func Reset()
    
    // Initialize properties of our GameObjects.
    func Start()
    
    // Update will be called every frame (60 times per second) = 16.666ms
    func Update()
}
