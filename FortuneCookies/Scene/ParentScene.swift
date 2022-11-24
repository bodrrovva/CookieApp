//
//  ParentScene.swift
//  FortuneCookies
//
//  Created by muntyanu on 23.11.2022.
//

import SpriteKit

class ParentScene: SKScene {
    
    let hud = HUD()
    
    override init(size: CGSize) {
        super.init(size: size)
        backgroundColor = UIColor(named: "back")!
        scene?.anchorPoint = CGPoint(x: 0.0, y: 0.0)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    func transition(scene: ParentScene) {
        let transition = SKTransition.crossFade(withDuration: 0)
        scene.scaleMode = .aspectFill
        self.scene!.view?.presentScene(scene, transition: transition)
    }
}
