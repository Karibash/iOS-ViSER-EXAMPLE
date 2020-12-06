//
//  Article.swift
//  ViSER-Example
//
//  Created by Karibash on 2020/12/03.
//

import Foundation

struct Article: Decodable {
    let id: Int
    let slug: String
    let title: String
    let emoji: String
    let readingTimeMinutes: Int
    let publishedAt: Date
    let user: User

    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case title
        case emoji
        case readingTimeMinutes = "reading_time"
        case publishedAt = "published_at"
        case user
    }
}

extension Article: Comparable {

    static func < (lhs: Article, rhs: Article) -> Bool {
        return lhs.publishedAt < rhs.publishedAt
    }

    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.publishedAt == rhs.publishedAt
    }

}
