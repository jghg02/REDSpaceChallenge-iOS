//
//  RickAndMortyAPI.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import Foundation
import JNetworking

struct RickAndMortyAPIQueryParams {
    var characterId: Int? = 0
    var pageNumber: Int? = 0
}

/// This API will hold all API's related to Rick And Morty
enum RickAndMortyAPI {
    case getAllCharacters
    case getAllLocations
    case getAllEpisodies
    case getCharacter(RickAndMortyAPIQueryParams)
    case getLacationPage(RickAndMortyAPIQueryParams)
    case getEpisodePage(RickAndMortyAPIQueryParams)
    case getCharacterPage(RickAndMortyAPIQueryParams)
}

extension RickAndMortyAPI: APIProtocol {
    func httpMthodType() -> HTTPMethodType {
        var methodType = HTTPMethodType.get
        switch self {
        case .getAllCharacters, .getAllEpisodies, .getAllLocations, .getCharacter, .getLacationPage, .getEpisodePage,
                .getCharacterPage :
            methodType = .get
        }
        return methodType
    }

    func apiEndPath() -> String {
        var path = ""
        switch self {
        case .getAllCharacters:
            path += ServicesConstants.characters
        case .getAllLocations:
            path += ServicesConstants.locations
        case .getAllEpisodies:
            path += ServicesConstants.episode
        case .getCharacter(let param):
            path += ServicesConstants.characters + "/\(param.characterId!)"
        case .getLacationPage(let param):
            path += ServicesConstants.locations + "/?page=" + "\(param.pageNumber!)"
        case .getEpisodePage(let param):
            path += ServicesConstants.episode + "/?page=" + "\(param.pageNumber!)"
        case .getCharacterPage(let param):
            path += ServicesConstants.characters + "/?page=" + "\(param.pageNumber!)"
            
        }

        return path
    }

    func apiBasePath() -> String {
        switch self {
        case .getAllCharacters, .getAllLocations, .getAllEpisodies, .getCharacter, .getLacationPage, .getEpisodePage,
                .getCharacterPage:
            return ServicesConstants.baseURL
        }
    }

}

