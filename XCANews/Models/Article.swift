//
//  Article.swift
//  XCANews
//
//  Created by Aditya Medhane on 28/08/24.
//

import Foundation

struct Article{
    let source: Source
    
    let title: String
    let url: String
    let publishedAt: Date
    
    
    let author: String?
    let description: String?
    let urlToImage: String?
    
    var authorText: String{
        author ?? ""
    }
    
    var descriptionText: String{
        description ?? ""
    }
    
    var articleURL: URL{
        URL(string: url)!
    }
    
    var imageURL: URL?{
        guard let urlToImage = urlToImage else{
            return nil
        }
        return URL(string: urlToImage)
    }
    
}

extension Article: Codable {}
extension Article: Equatable{}
extension Article: Identifiable{
    var id: String { url }
}

//extension Article{
//    
//    static var previewData: [Article] {
//        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")
//        let data = try! Data(contentsOf: previewDataURL)
//        
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.dateDecodingStrategy = .iso8601
//    }
//}

extension Article {
    
    static var previewData: [Article] {
        // Safely unwrap the URL
        guard let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json") else {
            fatalError("Failed to locate news.json in bundle.")
        }
        
        // Load the data from the URL
        let data: Data
        do {
            data = try Data(contentsOf: previewDataURL)
        } catch {
            fatalError("Failed to load data from \(previewDataURL): \(error)")
        }
        
        // Decode the JSON data
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        do {
            let articles = try jsonDecoder.decode([Article].self, from: data)
            return articles
        } catch {
            fatalError("Failed to decode JSON data: \(error)")
        }
    }
}




struct Source {
    let name: String
}

extension Source: Codable {}
extension Source: Equatable{}
