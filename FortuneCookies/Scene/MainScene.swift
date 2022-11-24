//
//  GameScene.swift
//  FortuneCookies
//
//  Created by muntyanu on 13.10.2022.
//

import SpriteKit

class MainScene: ParentScene {
    
    override func didMove(to view: SKView) {
        spawnCookies()
        createHUD()
    }
    
    fileprivate func createHUD() {
        addChild(hud)
        hud.configureMain()
        hud.configureText(textForTapLabel: "Узнай свое предсказание!")
    }
    
    fileprivate func spawnCookies() {
        let spawnCookies = SKAction.run {
            let cookie = Cookies.populate()
            cookie.setScale(0.7)
            cookie.position = cookie.randomPoint()
            cookie.run(cookie.rotateForRandomAngle())
            self.addChild(cookie)
        }
        run(SKAction.repeat(spawnCookies, count: 10))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        if node.name == "cookie" { transition(scene: DetailScene(size: size)) }
        else if node.name == "restart" {
            while let child = self.childNode(withName: "cookie") as? SKSpriteNode { child.removeFromParent() }
            spawnCookies()
        }
    }
}

