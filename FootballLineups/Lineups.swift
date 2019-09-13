//
//  Lineups.swift
//  FootballLineups
//
//  Created by Ahmed Khalaf on 9/13/19.
//  Copyright © 2019 Ahmed Khalaf. All rights reserved.
//

import UIKit

// MARK: - Lineups
struct Lineups: Codable {
    let lineups: Lineup
}

// MARK: - Lineup
struct Lineup: Codable {
    let home: Team
}

// MARK: - Team
struct Team: Codable {
    let formation: Formation
}

// MARK: - Formation
struct Formation: Codable {
    let name: String
    let positions: [String: Position]
}

// MARK: - Position
struct Position: Codable {
    let x, y: CGFloat
}

// MARK: - Parsing
extension Lineups {
    static func all() throws -> Lineups {
        let url = Bundle.main.url(forResource: "lineups", withExtension: "json")!
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(Lineups.self, from: data)
    }
}
