//
//  CWFeedsModel.swift
//  CWNetworkSDK
//
//  Created by Aravindhan Natarajan on 24/05/21.
//

import Foundation

// MARK: - CWFeedsModel
public struct CWFeedsModel: Codable {
    public let status: String
    public let totalResults: Int
    public let articles: [Article]

    public init(status: String, totalResults: Int, articles: [Article]) {
        self.status = status
        self.totalResults = totalResults
        self.articles = articles
    }
}

// MARK: - Article
public struct Article: Codable {
    public let source: Source
    public let author: String?
    public let title, articleDescription: String
    public let url: String
    public let urlToImage: String?
    public let publishedAt: Date
    public let content: String

    enum CodingKeys: String, CodingKey {
        case source, author, title
        case articleDescription = "description"
        case url, urlToImage, publishedAt, content
    }

    public init(source: Source, author: String?, title: String, articleDescription: String, url: String, urlToImage: String?, publishedAt: Date, content: String) {
        self.source = source
        self.author = author
        self.title = title
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }
}

// MARK: - Source
public struct Source: Codable {
    public let id: String?
    public let name: String

    public init(id: String?, name: String) {
        self.id = id
        self.name = name
    }
}
