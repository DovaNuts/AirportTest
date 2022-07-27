//
//  AirportTableViewCell.swift
//  AirportTest
//
//  Created by Axel Gonzalez on 25/07/22.
//

import UIKit

class AirportTableViewCell: UITableViewCell {
    @IBOutlet weak var name: GradientLabel!
    @IBOutlet weak var distance: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(airport: Airport) {
        name.text = airport.name?.capitalized
        
        distance.text = String(format: "%.2f km", airport.distance!)
    }
}
