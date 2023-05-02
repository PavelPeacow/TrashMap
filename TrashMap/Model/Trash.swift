//
//  Trash.swift
//  TrashMap
//
//  Created by Павел Кай on 27.04.2023.
//

import Foundation

struct Trash: Codable {
    let title: String
    let description: String
    let coordinates: TrashCoordinates
}

struct TrashCoordinates: Codable {
    let latitude: Double
    let longitude: Double
}
