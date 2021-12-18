//
//  CharacterViewModel.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import Foundation

class CharacterViewModel {
    
    let allData: DataBiding<CharacterResult?> = DataBiding(nil)
    let spinner: DataBiding<Bool> = DataBiding(true)
    
    func fetchCharacterData() {
        spinner.value = false
        let queryParams = RickAndMortyAPIQueryParams()
        _ = RickAndMortyServicesRequest().getAllCharacters(apiQueryModel: queryParams) { [weak self] data in
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
    
    func fetchCharacterDataPage(with pageNumber: Int) {
        spinner.value = false
        let queryParams = RickAndMortyAPIQueryParams(pageNumber: pageNumber)
        _ = RickAndMortyServicesRequest().getCharacterPage(apiQueryModel: queryParams) { [weak self] data in
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
