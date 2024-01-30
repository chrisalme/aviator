//
//  GiftModel.swift
//  aviator
//
//  Created by apple on 18.01.2024.
//

import Foundation

struct GiftsModel: Decodable {
    
    let id: String
    let image: String
    let title: String
    let price: Int
    let description: String
    
}
