//
//  HUD.swift
//  FortuneCookies
//
//  Created by admin on 20.10.2022.
//

import SpriteKit

class HUD: SKNode {
    var arrow = SKSpriteNode(imageNamed: "arrow")
    var tapLabel = SKLabelNode()
    
    func configureUI(sizeScreen: CGSize, textForTapLabel: String) {
        
        tapLabel.text = textForTapLabel
        tapLabel.fontColor = .black
        tapLabel.fontSize = 30
        tapLabel.position = CGPoint(x: 0, y: -320)
        addChild(tapLabel)
    }
}
