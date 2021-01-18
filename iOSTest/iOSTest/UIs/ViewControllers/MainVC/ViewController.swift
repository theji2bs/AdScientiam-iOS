//
//  ViewController.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureMovableView()
    }
    private func configureMovableView() {
        let rectSize = 70.0
        let rectColor = UIColor.yellow
        
        let xFrame = (Double(view.bounds.width) - rectSize)/2
        let yFrame = (Double(view.bounds.height) - rectSize)/2
        
        let frame = CGRect(x: xFrame,
                           y: yFrame,
                           width: rectSize,
                           height: rectSize)
        let myView = MovableView(frame: frame)
        myView.configureView(with: rectColor)
        self.view.addSubview(myView)
    }
}

