//
//  FactsViewModel.swift
//  POCApp
//
//  Created by Kavita Patil on 30/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import Foundation

struct FactsViewModel {
    let factTitle: String?
    let factDescription: String?
    let factimage: String?
    
    init(rows:Rows) {
        self.factTitle = rows.title
        self.factDescription = rows.description
        self.factimage = rows.imageHref
    }
}


