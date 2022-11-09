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
    let pointArray = [(-125, 150), (0, 150), (125, 150), (-125, 0), (0, 0), (125, 0), (-125, -150), (0, -150), (125, -150)]
    
    override init(size: CGSize) { super.init(size: size) }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func didMove(to view: SKView) {
        scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundColor = .white
        spawnCookies()
        createHUD()
    }
    
    fileprivate func createHUD() {
        addChild(hud)
        hud.configureUI(sizeScreen: sizeScreen, textForTapLabel: "Узнай свое предназанчение!")
    }
    
    fileprivate func spawnCookies() {
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
            let transition = SKTransition.crossFade(withDuration: 0)
            let nextScene = DetailScene(size: sizeScreen)
            nextScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(nextScene, transition: transition)
        }
    }
}
