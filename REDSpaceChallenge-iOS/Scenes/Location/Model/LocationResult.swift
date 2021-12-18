//
//  LocationResult.swift
//  REDSpaceTest
//
//  Created by Josue German Hernandez Gonzalez on 04-12-21.
//

struct LocationResult: Codable {
    let info: Info?
    var results: [Location?]
    
    struct Location: Codable {
        let id: Int?
        let name: String?
        let type: String?
        let dimension: String?
        let residents: [String?]
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
