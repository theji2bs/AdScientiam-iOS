//
//  MovableView.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import UIKit

class MovableView: UIView {
    private var position = CGPoint(x:0, y:0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let gesture = UIPanGestureRecognizer(target: self,
                                             action: #selector(movableViewDidTouched))
        self.gestureRecognizers = [gesture]
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func movableViewDidTouched(reconizer : UIPanGestureRecognizer) {
        let shiftPosition = reconizer.translation(in: self.superview)
        center = CGPoint(x: position.x + shiftPosition.x,
                         y: position.y + shiftPosition.y)
    }
    
    func configureView(with color: UIColor) {
        backgroundColor = color
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        position = center
    }
}
