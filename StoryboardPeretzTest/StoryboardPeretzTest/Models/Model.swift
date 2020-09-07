//
//  Model.swift
//  StoryboardPeretzTest
//
//  Created by Муслим Курбанов on 04.09.2020.
//  Copyright © 2020 Муслим Курбанов. All rights reserved.
//

import Foundation

struct Model: Decodable {
    var id: Int
    var date: String
    var name: String
    var description: String
    var new: Bool
    var price: Int
    var image_app: String
    var image: String
    var sort: Int

}
