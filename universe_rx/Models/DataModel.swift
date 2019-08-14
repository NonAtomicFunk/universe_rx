//
//  DataModel.swift
//  universe_rx
//
//  Created by Alexander Berezovsky on 8/14/19.
//  Copyright © 2019 Me_Myself_i. All rights reserved.
//

import Foundation

struct DataModel: Codable {
    let id: Int
    let type: String
    let title: String
    let shortDescription: String
    let description: String
    let smallImage: String
    let bigImage: String
    let latitude: String
    let longitude: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case title
        case shortDescription
        case description
        case smallImage
        case bigImage
        case latitude
        case longitude
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(type, forKey: .type)
        try container.encode(title, forKey: .title)
        try container.encode(shortDescription, forKey: .shortDescription)
        try container.encode(description, forKey: .description)
        try container.encode(smallImage, forKey: .smallImage)
        try container.encode(bigImage, forKey: .smallImage)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    
    
    init(id: Int,
         type: String,
         title: String,
         shortDescription: String,
         description: String,
         smallImage: String,
         bigImage: String,
         latitude: String,
         longitude: String) {
        
        self.id = id
        self.type = type
        self.title = title
        self.shortDescription = shortDescription
        self.description = description
        self.smallImage = smallImage
        self.bigImage = bigImage
        self.latitude = latitude
        self.longitude = longitude
    }
}
