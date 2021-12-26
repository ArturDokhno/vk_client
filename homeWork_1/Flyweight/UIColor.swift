//
//  UIColor.swift
//  homeWork_1
//
//  Created by Артур Дохно on 26.12.2021.
//  Copyright © 2021 Марат Нургалиев. All rights reserved.
//

import UIKit

extension UIColor {
    static let midnightBlue = rgba(0.17, 0.24, 0.31, a: 1.00)
    static let alizarin = rgba(0.91, 0.30, 0.24, a: 1.00)
    static let carrot = rgba(0.90, 0.49, 0.13, a: 1.00)
    static let nephriis = rgba(0.15, 0.68, 0.38, a: 1.00)
}

UIColor(red: 0.17, green: 0.24, blue: 0.31, alpha: 1.00)
extension UIColor {
    private static var colorsCache: [String: UIColor] = [:]
    
    public static func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, a: CGFloat) -> UIColor {
        let key = "\(r)\(g)\(b)\(a)"
        if let cachedColor = self.colorsCache[key] {
            return cachedColor
        }
        self.clearColorsCacheIfNeeded()
        let color = UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
        self.colorsCache[key] = color
        return color
    }
    
    private static func clearColorsCacheIfNeeded() {
        let maxObjectsCount = 100
        guard self.colorsCache.count >= maxObjectsCount else { return }
        colorsCache = [:]
    }
}
