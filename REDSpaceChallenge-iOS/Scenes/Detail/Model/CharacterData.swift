//
//  CharacterData.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 05-12-21.
//

struct CharacterData: Codable {
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
    
    struct Origin: Codable {
        let name: String?
        let url: String?
    }
    
    struct Location: Codable {
        let name: String?
        let url: String?
    }
}
