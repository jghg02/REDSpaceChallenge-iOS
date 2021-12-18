//
//  EpisodiesViewModel.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import Foundation

class EpisodiesViewModel {
    
    let allData: DataBiding<EpisodeResult?> = DataBiding(nil)
    let spinner: DataBiding<Bool> = DataBiding(true)
    
    func fetchEpisodiesData() {
        spinner.value = false
        let queryParams = RickAndMortyAPIQueryParams()
        _ = RickAndMortyServicesRequest().getAllEpisodies(apiQueryModel: queryParams) { [weak self] data in
            DispatchQueue.main.async {
                switch data {
                case .success(let result):
                    self?.allData.value = result
                    self?.spinner.value = true
                case  .failure(let error):
                    print("ERROR \(error)")
                    self?.spinner.value = true
                }
            }
            
        }
    }
    
    func fetchEpisodeDataPage(with pageNumber: Int) {
        spinner.value = false
        let queryParams = RickAndMortyAPIQueryParams(pageNumber: pageNumber)
        _ = RickAndMortyServicesRequest().getEpisodePage(apiQueryModel: queryParams) { [weak self] data in
            DispatchQueue.main.async {
                switch data {
                case .success(let result):
                    self?.allData.value = result
                    self?.spinner.value = true
                case  .failure(let error):
                    print("ERROR \(error)")
                    self?.spinner.value = true
                }
            }
            
        }
    }
}
