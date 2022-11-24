//
//  DetailScene.swift
//  FortuneCookies
//
//  Created by muntyanu on 20.10.2022.
//

import SpriteKit

class DetailScene: ParentScene {
    
    override func didMove(to view: SKView) {
        spawnCookies()
        createHUD()
    }
    
    fileprivate func createHUD() {
        addChild(hud)
        hud.configureText(textForTapLabel: "Нажми")
    }
    
    fileprivate func spawnCookies() {
        let cookie = Cookies.populate()
        cookie.setScale(1.5)
        self.addChild(cookie)
    }
    
    fileprivate func breakCookie() {
        self.hud.configureDetail()
        self.hud.tapLabel.text = "Хочу еще!"
        self.hud.tapLabel.name = "next"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        if node.name == "cookie"{
            breakCookie()
        } else if node.name == "next" {
            transition(scene: MainScene(size: size))
        }
    }
    
}


