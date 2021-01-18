//
//  MovableViewDataCell.swift
//  iOSTest
//
//  Created by Elhadad MALIDI on 18/01/2021.
//

import UIKit

class MovableViewDataCell: UITableViewCell {
    @IBOutlet weak var xPositionLabel: UILabel!
    @IBOutlet weak var yPositionLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with data: MovableViewData) {

        xPositionLabel.text = "X position : \(data.getViewPosition().x)"
        yPositionLabel.text = "Y position : \(data.getViewPosition().y)"
        pressureLabel.text = "Pressure : \(data.getPressure())"
        dateLabel.text = "Date : \(data.getDate())"
    }
    
}
