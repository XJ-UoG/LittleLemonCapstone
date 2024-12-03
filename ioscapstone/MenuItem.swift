//
//  MenuItem.swift
//  ioscapstone
//
//  Created by Tan Xin Jie on 3/12/24.
//

import Foundation

struct MenuItem: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String
}
