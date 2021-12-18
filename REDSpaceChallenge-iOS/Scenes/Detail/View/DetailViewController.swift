//
//  DetailViewController.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 05-12-21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var speciesImage: UIImageView!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var originImage: UIImageView!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var episodeImage: UIImageView!
    @IBOutlet weak var spinnerView: SpinnerView!
    
    var data: CharacterResult.Character?
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinnerView.pinToEdges(of: self.view)
        
        guard let characterId = data?.id else { return }
        viewModel.fetchCurrentCharacter(with: characterId)
        
        configView()
        self.viewModel.spinner.bind { [weak self] show in
            self?.spinnerView.isHidden = show
        }
        
        self.viewModel.allData.bind{ [weak self] data in
            guard let data = data else { return }
            self?.populateInfoView(with: data)
        }
        
        
    }
    
    func configView() {
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismssVC))
        navigationItem.rightBarButtonItem = doneButton
        
        title = data?.name
        guard let imageUrl = data?.image, let url = URL(string: imageUrl) else {
            avatar.image = UIImage(named: "PlaceHolder")
            return
        }
        avatar.load(url: url)
    }
    

    func populateInfoView(with data: CharacterData) {
        locationImage.image = Symbols.location
        locationImage.tintColor = .label
                
        locationLabel.textColor = .secondaryLabel
        locationLabel.text = data.location?.name
        
        genderImage.image = Symbols.person
        genderImage.tintColor = .label
        
        genderLabel.textColor = .secondaryLabel
        genderLabel.text = data.gender
        
        speciesImage.image = Symbols.species
        speciesImage.tintColor = .label
        
        speciesLabel.textColor = .secondaryLabel
        speciesLabel.text = data.species
        
        originImage.image = Symbols.globe
        originImage.tintColor = .label
        
        originLabel.textColor = .secondaryLabel
        originLabel.text = data.origin?.name
        
        episodeImage.image = Symbols.episode
        episodeImage.tintColor = .label
        
        episodeLabel.textColor = .secondaryLabel
        episodeLabel.text = String(data.episode.count)
    }
    
    
    @objc func dismssVC() {
        dismiss(animated: true)
    }

}
