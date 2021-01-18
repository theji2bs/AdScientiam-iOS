//
//  BaseViewController.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import UIKit

class BaseViewController: UIViewController {
    
    let delayInSecondBeforeDisplay = 10.0  // 10 seconds
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        resetTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Sets the status bar to visible when the view is about to disappear
        super.viewWillDisappear(false)
        // IdleVideo Timer
        stopTimer()
    }
    
    @objc func displayAlertPopin() {
        let alert = UIAlertController(title: " ",
                                      message: "Êtes-vous toujours là ?",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Quitter", style: .default){ (action:UIAlertAction!) in
            self.resetTimer()
        })
        present(alert, animated: true)
    }
}


extension BaseViewController {
    private func startTimer() {
        self.timer = Timer.scheduledTimer(timeInterval: delayInSecondBeforeDisplay,
                                          target: self,
                                          selector: #selector(displayAlertPopin),
                                          userInfo: "AlertPopin",
                                          repeats: true)
    }
    
    private func stopTimer() {
        timer.invalidate()
    }
    
    func resetTimer() {
        if let timer = timer {
            timer.invalidate()
        }
        startTimer()
    }
}
