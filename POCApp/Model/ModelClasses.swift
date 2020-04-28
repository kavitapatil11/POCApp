//
//  ModelClasses.swift
//  POCApp
//
//  Created by Kavita Patil on 28/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import Foundation

struct Response:Decodable {
    let rows:[rows]
    let title: String?
}
struct rows:Decodable {
    let title:String?
    let description:String?
    let imageHref:String?
}
