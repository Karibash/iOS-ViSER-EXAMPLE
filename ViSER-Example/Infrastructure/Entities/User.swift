//
//  User.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/06.
//

import Foundation

struct User: Decodable {
    let id: Int
    let username: String

    enum CodingKeys: String, CodingKey {
        case id
        case username
    }
}
