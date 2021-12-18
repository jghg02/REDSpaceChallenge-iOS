//
//  CharacterResult.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

struct CharacterResult: Codable {
    
    let info: Info?
    let results: [Character?]
    
    struct Character: Codable {
        let id: Int?
        let name: String?
        let status: String?
        let species: String?
        let type: String?
        let gender: String?
        let origin: Origin?
        let location: Location?
        let image: String?
        let episode: [String?]
        let url: String?
        let created: String?
    }
    
    struct Info: Codable {
        let count: Int?
        let pages: Int?
        let next: String?
        let prev: String?
    }
    
    struct Origin: Codable {
        let name: String?
        let url: String?
    }
    
    struct Location: Codable {
        let name: String?
        let url: String?
    }
    
}
