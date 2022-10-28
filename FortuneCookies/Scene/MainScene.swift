//
//  GameScene.swift
//  FortuneCookies
//
//  Created by admin on 13.10.2022.
//

import SpriteKit

class MainScene: SKScene {
    
    let hud = HUD()
    let sizeScreen = UIScreen.main.bounds.size
    let pointArray = [(-150, 150), (0, 150), (150, 150), (-150, 0), (0, 0), (150, 0), (-150, -150), (0, -150), (150, -150)]
    
    override func didMove(to view: SKView) {
        scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundColor = .white
        spawnCookies()
        createHUD()
    }
    
    fileprivate func createHUD(){
        addChild(hud)
        hud.configureUI(sizeScreen: sizeScreen, textForTapLabel: "Узнай свое предназанчение!")
    }
    
    fileprivate func spawnCookies(){
        let spawnCookies = SKAction.run {
            for point in self.pointArray {
                let cookie = Cookies.populate(at: CGPoint(x: point.0, y: point.1), imageName: "cookies")
                self.addChild(cookie)
            }
        }
        run(spawnCookies)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "cookie"{
            let transition = SKTransition.crossFade(withDuration: 0.1)
            let nextScene = DetailScene()
            nextScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(nextScene, transition: transition)
            print("Переход выполнен")
        }
    }
}
