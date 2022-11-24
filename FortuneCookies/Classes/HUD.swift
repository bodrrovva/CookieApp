//
//  HUD.swift
//  FortuneCookies
//
//  Created by muntyanu on 20.10.2022.
//

import SpriteKit

class HUD: SKNode {
    
    let tapLabel = SKLabelNode()    
    var predictionsArray = ["Нужно делать то, что ты должен делать. И пусть все будет так, как будет", "Определитесь с конечной целью – и у вас появится шанс на победу.", "Чтобы быть поистине счастливым – властвуй над своими помыслами", "Лучше сделать и пожалеть о сделанном, чем не сделать и сожалеть о не сделанном.", "Что бы ни случилось, все в конечном итоге приведет к лучшему.", "Стоя на месте, двигаться можно только назад.", "Если чувствуешь, что это твое, никого не слушай - рискни!", "Не позволяй плохим дням внушить тебе, что плоха сама жизнь.", "Найди того, с кем захочешь стать намного лучше чем вчера.", "Кто-то прямо сейчас рассчитывает на твою поддержку. Не отказывай.", "Не забывай о главном!", "Не нужно ничего просить у сильных. Захотят – сами дадут.", "Секрет успешной дороги лежит в ее начале", "Разделите задачу или проблему на небольшие задачки, с которыми нужно справиться, чтобы добиться успеха, и решайте их постепенно, одну за другой.", "Врагов нужно любить, их это бесит.", "Высоко оценивая себя, убедитесь, что вы пользуетесь спросом.", "В отношениях вам просто необходим прилив свежей энергии.", "Ваш путь верен, продолжайте его столь же настойчиво.", "Осветите тайную часть своего бытия.", "Сначала думайте, потом действуйте.", "Твое предназначение скрыто в том, что ты любишь делать больше всего на свете."]
    
    func configureText(textForTapLabel: String) {
        tapLabel.text = textForTapLabel
        tapLabel.fontColor = UIColor(named: "text")
        tapLabel.fontSize = 30
        tapLabel.position = CGPoint(x: screen.width/2, y: screen.height/10)
        tapLabel.zPosition = 10
        addChild(tapLabel)
    }
    
    func configureMain() {
        let restart = SKLabelNode(text: "🔄")
        restart.fontSize = 50
        restart.position = CGPoint(x: screen.width/10, y: screen.height-screen.height/10)
        restart.zPosition = 10
        restart.name = "restart"
        addChild(restart)
        
        let text = SKLabelNode(text: "Перемешать")
        text.fontSize = 30
        text.fontColor = UIColor(named: "text")
        text.position = CGPoint(x: screen.width/2, y: screen.height-screen.height/10)
        text.zPosition = 10
        text.name = "restart"
        addChild(text)
    }
    
    func configureDetail() {
        let back = SKSpriteNode(imageNamed: "blackBackground")
        back.setScale(10)
        back.zPosition = 1
        self.addChild(back)
        
        let text = SKLabelNode(text: self.predictionsArray.randomElement())
        text.position = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        text.preferredMaxLayoutWidth = screen.width-35
        text.numberOfLines = 0
        text.fontColor = .white
        text.zPosition = 2
        self.addChild(text)
    
        let musicURL = Bundle.main.url(forResource: "sound", withExtension: "mp3")
        let sound = SKAudioNode(url: musicURL!)
        sound.autoplayLooped = false
        sound.run(SKAction.play())
        self.addChild(sound)
    }
}
