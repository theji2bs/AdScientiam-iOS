//
//  MovableViewData.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import Foundation
import UIKit

struct MovableViewData: Codable {
    let viewPosition: CGPoint
    let date: Date
    let pressure: CGFloat
    
    func getViewPosition() -> CGPoint {
        return viewPosition
    }
    
    func getDate() -> Date {
        return date
    }
    
    func getPressure() -> CGFloat {
        return pressure
    }
}
