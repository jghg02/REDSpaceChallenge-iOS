//
//  CharacterCollectionViewCell.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    // MARK: - IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(with data: CharacterResult.Character) {
        
        guard let imageUrl = data.image, let url = URL(string: imageUrl) else {
            imageView.image = UIImage(named: "PlaceHolder")
            return
        }
        imageView.load(url: url)
        
        guard let name = data.name else { return }
        configLabel(with: name)
    }
    
    func configLabel(with text: String) {
        nameLabel.layer.shadowOpacity = 0.4
        nameLabel.layer.masksToBounds = false
        nameLabel.layer.shouldRasterize = true
        nameLabel.text = text
    }
    
    override func prepareForReuse() {
        imageView.image = nil
    }

}
