//
//  NewAPIResponse.swift
//  XCANews
//
//  Created by Aditya Medhane on 29/08/24.
//

import Foundation

struct NewsAPIResponse: Decodable{
    let status: String
    let totalResults: Int?
    
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
    
}
