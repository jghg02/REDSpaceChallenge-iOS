//
//  EpisodiesViewController.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import UIKit

class EpisodiesViewController: UIViewController {

    // MARK: - Properties
    
    private let viewModel = EpisodiesViewModel()
    private var data: EpisodeResult? = nil
    private var result: [EpisodeResult.Episode?] = []
    private var currentPage: Int = 1
    private var isLoading: Bool = true
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var spinnerView: SpinnerView!
    
    // MARK: - Lifecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinnerView.pinToEdges(of: self.view)
        
        configNavigationBar()
        
        viewModel.fetchEpisodiesData()
        self.viewModel.spinner.bind { [weak self] show in
            self?.spinnerView.isHidden = show
        }
        
        tableView.register(UINib(nibName: "EpisodeTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodeTableViewCell")
        
        self.viewModel.allData.bind { [weak self] data in
            guard let data = data else { return }
            self?.data = data
            self?.result.append(contentsOf: data.results)
            self?.tableView.reloadData()
            self?.isLoading = false
        }
        
    }
    
    // MARK: - Methods
    
    func configNavigationBar() {
        title = "Episodies"
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let next = self.data?.info else { return }
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) &&
            next.pages != currentPage && !isLoading) {
            isLoading = true
            currentPage += 1
            viewModel.fetchEpisodeDataPage(with: currentPage)
            self.viewModel.allData.bind { [weak self] data in
                guard let data = data else { return }
                self?.result.append(contentsOf: data.results)
                self?.tableView.reloadData()
                self?.isLoading = false
            }
        }
    }

}

// MARK: - UITableViewDataSource
extension EpisodiesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath)
        guard let episodeCell = cell as? EpisodeTableViewCell else { return UITableViewCell() }
        episodeCell.configCell(with: self.result[indexPath.row]!)
        
        return episodeCell
    }

}

// MARK: - UITableViewDelegate
extension EpisodiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currentEpisode = self.result[indexPath.row] else { return }

        var message = "Episode: \(currentEpisode.episode!) \n"
        message += "Air date: \(currentEpisode.air_date!) \n"
        
        self.showModalView(title: currentEpisode.name!, message: message, buttonTitle: "Ok")
    }
    
}
