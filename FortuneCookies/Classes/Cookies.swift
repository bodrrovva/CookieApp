//
//  Cookies.swift
//  FortuneCookies
//
//  Created by admin on 20.10.2022.
//

import SpriteKit

final class Cookies: SKSpriteNode {

    static func populate(at point: CGPoint, imageName: String) -> Cookies {
        let cookie = Cookies(imageNamed: imageName)
        cookie.setScale(0.5)
        cookie.position = point
        cookie.name = "cookie"
        return cookie
    }
}
