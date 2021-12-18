//
//  RickAndMortyServicesRequest.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

import Foundation
import JNetworking

typealias GetAllCharactersResponse = (Result<CharacterResult, Error>) -> Void
typealias GetAllLocationsResponse = (Result<LocationResult, Error>) -> Void
typealias GetAllEpisodiesResponse = (Result<EpisodeResult, Error>) -> Void
typealias GetCharacterResponse = (Result<CharacterData, Error>) -> Void
typealias GetLocationPageResponse = (Result<LocationResult, Error>) -> Void
typealias GetEpisodePageResponse = (Result<EpisodeResult, Error>) -> Void
typealias GetCharacterPageResponse = (Result<CharacterResult, Error>) -> Void

protocol RickAndMortyServicesRequestType {
    @discardableResult func getAllCharacters(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetAllCharactersResponse) -> URLSessionDataTask?
    @discardableResult func getAllLocations(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetAllLocationsResponse) -> URLSessionDataTask?
    @discardableResult func getAllEpisodies(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetAllEpisodiesResponse) -> URLSessionDataTask?
    @discardableResult func getCharacter(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetCharacterResponse) -> URLSessionDataTask?
    @discardableResult func getLocationPage(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetLocationPageResponse) -> URLSessionDataTask?
    @discardableResult func getEpisodePage(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetEpisodePageResponse) -> URLSessionDataTask?
    @discardableResult func getCharacterPage(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetCharacterPageResponse) -> URLSessionDataTask?
}

struct RickAndMortyServicesRequest: RickAndMortyServicesRequestType {
    
    func getAllCharacters(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetAllCharactersResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: RickAndMortyAPI.getAllCharacters)
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: CharacterResult.self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }

                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
        }
    
    func getAllLocations(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetAllLocationsResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: RickAndMortyAPI.getAllLocations)
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: LocationResult.self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }

                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
    }
    
    func getAllEpisodies(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetAllEpisodiesResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: RickAndMortyAPI.getAllEpisodies)
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: EpisodeResult.self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }

                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
        }
    
    func getCharacter(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetCharacterResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: RickAndMortyAPI.getCharacter(apiQueryModel))
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: CharacterData.self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }

                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
        }
    
    func getLocationPage(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetLocationPageResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: RickAndMortyAPI.getLacationPage(apiQueryModel))
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: LocationResult.self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }

                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
    }
    
    func getEpisodePage(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetEpisodePageResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: RickAndMortyAPI.getEpisodePage(apiQueryModel))
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: EpisodeResult.self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }

                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
    }
    
    func getCharacterPage(apiQueryModel: RickAndMortyAPIQueryParams, completion: @escaping GetCharacterPageResponse) -> URLSessionDataTask? {
        let requestModel = APIRequestModel(api: RickAndMortyAPI.getCharacterPage(apiQueryModel))
        return JNWebserviceHelper.requestAPI(apiModel: requestModel) { response in
            switch response {
            case .success(let data):
                JNJSONResponseDecoder.decodeFrom(data, returningModelType: CharacterResult.self, completion: { (allData, error) in
                    if let parserError = error {
                        completion(.failure(parserError))
                        return
                    }

                    if let data = allData {
                        completion(.success(data))
                    }
                })
            case .failure(let error):
                completion(.failure(error))
                }
            }
    }
    
}
