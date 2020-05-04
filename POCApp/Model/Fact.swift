//
//  ModelClasses.swift
//  POCApp
//
//  Created by Kavita Patil on 28/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import Foundation

struct Response:Decodable {
    let rows:[Rows]
    let title: String?
}

struct Rows:Decodable {
    let title:String?
    let description:String?
    let imageHref:String?
}
