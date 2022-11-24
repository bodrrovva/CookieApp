//
//  Cookies.swift
//  FortuneCookies
//
//  Created by muntyanu on 20.10.2022.
//

import SpriteKit
import GameplayKit

class Cookies: SKSpriteNode {
    static func populate() -> Cookies {
        let cookie = Cookies(imageNamed: "cookie")
        cookie.position = CGPoint(x: screen.width/2, y: screen.height/2)
        cookie.physicsBody = SKPhysicsBody(circleOfRadius: max(cookie.size.width/1.5, cookie.size.height/1.5))
        cookie.physicsBody?.affectedByGravity = false
        cookie.name = "cookie"
        return cookie
    }
}

extension Cookies {
    func randomPoint() -> CGPoint {
        let heightDistribution = GKRandomDistribution(lowestValue: Int(screen.height/5), highestValue: Int(screen.height-screen.height/9))
        let widthDistribution = GKRandomDistribution(lowestValue: 100, highestValue: Int(screen.width-100))
        let y = CGFloat(heightDistribution.nextInt())
        let x = CGFloat(widthDistribution.nextInt())
        return CGPoint(x: x, y: y)
    }
    
    func rotateForRandomAngle() -> SKAction {
        let distribution = GKRandomDistribution(lowestValue: 0, highestValue: 360)
        let randomNumber = CGFloat(distribution.nextInt())
        return SKAction.rotate(toAngle: randomNumber * CGFloat(Double.pi / 180), duration: 0)
    }
}
