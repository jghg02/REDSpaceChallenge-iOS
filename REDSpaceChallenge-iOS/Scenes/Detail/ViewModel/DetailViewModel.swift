//
//  DetailViewModel.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 05-12-21.
//

import Foundation

class DetailViewModel {
    let allData: DataBiding<CharacterData?> = DataBiding(nil)
    let spinner: DataBiding<Bool> = DataBiding(true)
    
    func fetchCurrentCharacter(with id: Int) {
        spinner.value = false
        let queryParams = RickAndMortyAPIQueryParams(characterId: id)
        
        _ = RickAndMortyServicesRequest().getCharacter(apiQueryModel: queryParams) { [weak self] data in
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
