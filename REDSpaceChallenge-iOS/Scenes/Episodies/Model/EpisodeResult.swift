//
//  EpisodeResult.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 03-12-21.
//

struct EpisodeResult: Codable {
    let info: Info?
    let results: [Episode?]
    
    struct Episode: Codable {
        let id: Int?
        let name: String?
        let air_date: String?
        let episode: String?
        let characters: [String?]
        let url: String?
        let created: String?
    }
    
    struct Info: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }
}

