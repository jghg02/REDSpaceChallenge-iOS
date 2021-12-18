//
//  LocationsViewController.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import UIKit

class LocationsViewController: UIViewController {

    // MARK: - Properties
    
    private let viewModel = LocationViewModel()
    private var data: LocationResult? = nil
    private var result: [LocationResult.Location?] = []
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
        
        viewModel.fetchLocationsData()
        self.viewModel.spinner.bind { [weak self] show in
            self?.spinnerView.isHidden = show
        }
        
        tableView.register(UINib(nibName: "LocationViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "LocationViewCellTableViewCell")
        
        
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
        title = "Locations"
        guard let navigationController = navigationController else { return }
        navigationController.navigationBar.prefersLargeTitles = true
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let next = self.data?.info else { return }
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) &&
            next.pages != currentPage && !isLoading) {
            isLoading = true
            currentPage += 1
            viewModel.fetchLocationsDataPage(with: currentPage)
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
extension LocationsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocationViewCellTableViewCell", for: indexPath)
        guard let locationCell = cell as? LocationViewCellTableViewCell else { return UITableViewCell() }
        
        locationCell.configCell(with: self.result[indexPath.row]!)
        
        return locationCell
    }

}

// MARK: - UITableViewDelegate
extension LocationsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let currenLocation = self.result[indexPath.row] else { return }
        
        var message = "Type: \(currenLocation.type!) \n"
        message += "Dimension: \(currenLocation.dimension!) \n"
        message += "Residents: \(currenLocation.residents.count)"
        
        self.showModalView(title: currenLocation.name!, message: message, buttonTitle: "Ok")
    }
    
}
