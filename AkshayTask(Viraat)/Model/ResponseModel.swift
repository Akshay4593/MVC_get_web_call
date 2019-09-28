//
//  ResponseModel.swift
//  AkshayTask(Viraat)
//
//  Created by Akshay Shedge on 23/09/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation


class ResponseModel : Decodable {
    
    var status: String?
    var totalResults: Int?
    var articles: [ArticleDetails]?
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
        articles = try values.decodeIfPresent([ArticleDetails].self, forKey: .articles)

    }
    
    
}

class ArticleDetails : Decodable {
    
    var source : SourceDetails?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        
        case description
        case url
        case urlToImage
        
        case publishedAt
        case content
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        source = try values.decodeIfPresent(SourceDetails.self, forKey: .source)
        author = try values.decodeIfPresent(String.self, forKey: .author)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        urlToImage = try values.decodeIfPresent(String.self, forKey: .urlToImage)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        content = try values.decodeIfPresent(String.self, forKey: .content)

    }
    
}


class SourceDetails : Decodable {
    
    var id : String?
    var name : String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
     
    }
    
    required init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        
    }
    
    
}
