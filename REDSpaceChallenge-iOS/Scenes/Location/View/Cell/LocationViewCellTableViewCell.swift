//
//  LocationViewCellTableViewCell.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import UIKit

class LocationViewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    

    func configCell(with data: LocationResult.Location) {
        nameLabel.text = data.name
        typeLabel.text = data.type
        
        quantityLabel.text = String(data.residents.count)
    }
    
}
