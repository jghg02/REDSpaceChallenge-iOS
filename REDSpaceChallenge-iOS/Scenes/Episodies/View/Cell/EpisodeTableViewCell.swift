//
//  EpisodeTableViewCell.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 05-12-21.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var numCharacterLabel: UILabel!
    
    
    func configCell(with data: EpisodeResult.Episode) {
        nameLabel.text = data.name
        releaseDate.text = data.air_date
        
        numCharacterLabel.text = String(data.characters.count)
    }


    
}
