//
//  CharacterViewController.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import UIKit

class CharacterViewController: UIViewController {

    // MARK: - Properties
    
    private let viewModel = CharacterViewModel()
    private var data: CharacterResult? = nil
    private var result: [CharacterResult.Character?] = []
    private var currentPage: Int = 1
    private var isLoading: Bool = true
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var spinnerView: SpinnerView!
    
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.spinnerView.pinToEdges(of: self.view)
        configNavigationBar()
        
        viewModel.fetchCharacterData()
        self.viewModel.spinner.bind { [weak self] show in
            self?.spinnerView.isHidden = show
        }
        
        collectionView.register(UINib(nibName:"CharacterCollectionViewCell", bundle: nil), forCellWithReuseIdentifier:"CharacterCollectionViewCell")
        
        self.viewModel.allData.bind { [weak self] data in
            guard let data = data else { return }
            self?.data = data
            self?.result.append(contentsOf: data.results)
            self?.collectionView.reloadData()
            self?.isLoading = false
        }

    }

    // MARK: - Methods
    
    func configNavigationBar() {
        title = "Characters"
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let next = self.data?.info else { return }
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) &&
            next.pages != currentPage && !isLoading) {
            isLoading = true
            currentPage += 1
            viewModel.fetchCharacterDataPage(with: currentPage)
            self.viewModel.allData.bind { [weak self] data in
                guard let data = data else { return }
                self?.result.append(contentsOf: data.results)
                self?.collectionView.reloadData()
                self?.isLoading = false
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension CharacterViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return result.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath)
        guard let characterCell = cell as? CharacterCollectionViewCell else { return UICollectionViewCell() }
        
        characterCell.configCell(with: (self.result[indexPath.row])!)

        return characterCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailCoordinator = DetailCoordinator(self.navigationController!)
        detailCoordinator.data = self.result[indexPath.row]
        detailCoordinator.start()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CharacterViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var newSize = CGSize.zero
        newSize.height = 160

        let screenBounds = UIScreen.main.bounds
        let screenSize = screenBounds.size

        if indexPath.item % 4 == 0 || indexPath.item % 4 == 3 {
            newSize.width = screenSize.width * 0.4
        } else {
            newSize.width = screenSize.width * 0.5
        }
        return newSize

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 2.0, bottom: 10, right: 2.0)
    }
    
}
