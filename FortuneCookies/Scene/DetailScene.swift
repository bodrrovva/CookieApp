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
    
    override func didMove(to view: SKView) {
        scene?.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        backgroundColor = .white
        print("Сцена построена")
        spawnCookies()
        createHUD()
    }
    
    fileprivate func createHUD(){
        hud.setScale(0.001)
        addChild(hud)
        hud.configureUI(sizeScreen: sizeScreen, textForTapLabel: "Нажми, чтобы открыть пченку")
        print("HUD построен")
    }
    
    fileprivate func spawnCookies(){
        let spawnCookies = SKAction.run {
            let cookie = Cookies.populate(at: CGPoint(x: 0 , y: 0), imageName: "cookies")
            cookie.setScale(0.001)
            self.addChild(cookie)
        }
        run(spawnCookies)
        print("SKNode построен")
    }
    
    
    fileprivate func breakCookie(){
        let breakCookie = SKAction.run {
            
            let back = SKSpriteNode(imageNamed: "blackBackground")
            back.zPosition = 1
            self.addChild(back)
            
            let cookie = Cookies.populate(at: CGPoint(x: 0 , y: 0), imageName: "breakCookies")
            cookie.zPosition = 0
            cookie.setScale(0.001)
            self.addChild(cookie)
            
            let text = SKLabelNode(text: "Предсказание")
            text.fontColor = .white
            text.setScale(0.001)
            text.zPosition = 2
            self.addChild(text)
    
            self.hud.isHidden = true
            
            let nextLabel = SKLabelNode(text: "Хочу еще!")
            nextLabel.fontColor = .white
            nextLabel.fontSize = 35
            nextLabel.setScale(0.001)
            nextLabel.position = CGPoint(x: 0, y: -0.4)
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
            print("print")
            let transition = SKTransition.crossFade(withDuration: 0.1)
            let nextScene = MainScene()
            nextScene.scaleMode = .aspectFill
            self.scene!.view?.presentScene(nextScene, transition: transition)
        }
    }
    
}
