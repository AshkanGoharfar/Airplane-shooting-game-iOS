//
//  GameViewController.swift
//  iOS-Game-Getting-Started
//
//  Created by Ashkan Goharfar on 11/3/1400 AP.
//  ICE1

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var LiveLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            
            // these varibales were commneted to remove the details at right down side of the screen
            //view.showsFPS = true
            //view.showsNodeCount = true
        }
        
        // Initialize the Lives and Score
        
        // ICE 3 last part ***, we expected to see changes in score and live value in simulator, although, there were not changed, so we made an object fir gameviewcontroller in collision manager class and call it here
        CollisionManager.gameViewController = self
        ScoreManager.Score = 0
        ScoreManager.Lives = 5
        updateLivesLabel()
        updateScoreLabel()
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func updateScoreLabel() -> Void
    {
        ScoreLabel.text = "Score: \(ScoreManager.Score)"
    }
    
    func updateLivesLabel() -> Void
    {
        LiveLabel.text = "Lives: \(ScoreManager.Lives)"
    }
}
