//
//  GameViewController.swift
//  FortuneCookies
//
//  Created by admin on 13.10.2022.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            
            let scene = MainScene(size: self.view.bounds.size)
                
                scene.scaleMode = .aspectFill
                scene.size = self.view.bounds.size
               
                view.presentScene(scene)
            
            //отвечает за рендер картинок
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
