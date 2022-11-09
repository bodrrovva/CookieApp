//
//  DetailScene.swift
//  FortuneCookies
//
//  Created by admin on 20.10.2022.
//

import SpriteKit

class DetailScene: SKScene {
    
    let hud = HUD()
    let sizeScreen = UIScreen.main.bounds.size
    var cookiesArray = ["cookies", "breakCookies"]
    
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
        hud.configureUI(sizeScreen: sizeScreen, textForTapLabel: "Нажми, чтобы открыть пченку")
    }
    
    fileprivate func spawnCookies() {
        let spawnCookies = SKAction.run {
            let cookie = Cookies.populate(at: CGPoint(x: 0 , y: 0), imageName: "cookies")
            cookie.setScale(1.1)
            self.addChild(cookie)
        }
        run(spawnCookies)
    }
    
    
    fileprivate func breakCookie() {
        let breakCookie = SKAction.run {
            
            let back = SKSpriteNode(imageNamed: "blackBackground")
            back.setScale(2)
            back.zPosition = 1
            self.addChild(back)
            
            let cookie = Cookies.populate(at: CGPoint(x: 0 , y: 0), imageName: "breakCookies")
            cookie.setScale(1.1)
            cookie.zPosition = 0
            self.addChild(cookie)
            
            let text = SKLabelNode(text: "Твое предназначение скрыто в том, что ты любишь делать больше всего на свете. Твое предназначение скрыто в том, что ты любишь делать больше всего на свете.")
//            text.anchorPoint = CGPoint(x: 0, y: 0)
            text.position = CGPoint(x: 0, y: -100)
//            text.scene?.anchorPoint = CGPoint(x: 0, y: 0)
            text.preferredMaxLayoutWidth = self.sizeScreen.width
            text.numberOfLines = 0
            text.fontColor = .white
            text.zPosition = 2
            self.addChild(text)
    
            self.hud.isHidden = true
            
            let nextLabel = SKLabelNode(text: "Хочу еще!")
            nextLabel.fontColor = .white
            nextLabel.fontSize = 35
            nextLabel.position = CGPoint(x: 0, y: -350)
            nextLabel.name = "next"
            nextLabel.zPosition = 10
            self.addChild(nextLabel)
        }
        run(breakCookie)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let location = touches.first!.location(in: self)
        let node = self.atPoint(location)
        
        if node.name == "cookie"{
            //добвить хруст типо печенка разломалась
            print("нажатие зарегистрированно")
            node.isHidden = true
            breakCookie()
        } else if node.name == "next" {
            let transition = SKTransition.crossFade(withDuration: 0)
            let nextScene = MainScene(size: sizeScreen)
            nextScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(nextScene, transition: transition)
        }
    }
    
}
