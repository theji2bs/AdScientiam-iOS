//
//  MovableView.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import UIKit

protocol MovableViewDelegate: class {
    func getLastDataToSave(datas: [MovableViewData])
    func getCurrentData(data: MovableViewData)
    func resetTimerForPopin()

}

class MovableView: UIView {
    private var positionsDatas: [MovableViewData] = []

    private var position = CGPoint(x:0, y:0)
    weak var delegate:MovableViewDelegate!

    
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
    
    private func createPostionData(position: CGPoint, date: Date, pressure: CGFloat) {
        let data = MovableViewData(viewPosition: position,
                                   date: date,
                                   pressure: pressure)
        delegate?.getCurrentData(data: data)
        positionsDatas.append(data)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.superview?.bringSubviewToFront(self)
        position = center
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        for touche in touches {
            createPostionData(position: center,
                              date: Date(),
                              pressure: touche.force)
        }
        delegate?.resetTimerForPopin()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.resetTimerForPopin()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        delegate?.getLastDataToSave(datas: positionsDatas )
    }
}

