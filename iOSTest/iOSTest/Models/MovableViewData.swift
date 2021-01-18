//
//  MovableViewData.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import Foundation
import UIKit

struct MovableViewData: Codable {
    var viewPosition: CGPoint
    var date: Date
    var pressure: CGFloat
    
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
