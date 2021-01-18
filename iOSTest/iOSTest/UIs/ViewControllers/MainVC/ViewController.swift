//
//  ViewController.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import UIKit

class ViewController: BaseViewController {
    @IBOutlet weak var informationsLabel: UILabel!
    var positionsData: [MovableViewData] = []
    
    let dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureMovableView()
        loadDataStored()
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
        myView.delegate = self
    }
    
    private func configureLabelwith( data: MovableViewData) {
        let xPosition = "x: \(data.getViewPosition().x)"
        let yPosition = " y: \(data.getViewPosition().y)"
        let pressure = " pressure: \(data.getPressure())"
        let date = " date: \(data.getDate())"
        
        informationsLabel.text = xPosition + yPosition + pressure + date
    }
    
    private func loadDataStored() {
        if let datas = dataManager.loadMovableViewDatas() {
            self.positionsData = datas
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "GoToMovableViewDatasVC") {
            // pass data to next view
            let destinationVC = segue.destination as? MovableViewDatasVC
            destinationVC?.datas = positionsData
        }
    }
}

extension ViewController : MovableViewDelegate {
    func resetTimerForPopin() {
        self.resetTimer()
    }
    
    func getLastDataToSave(datas: [MovableViewData]) {
        positionsData = datas
        dataManager.saveMovableViewDatas(with: datas)
    }
    
    func getCurrentData(data: MovableViewData) {
        configureLabelwith(data: data)
    }
}

