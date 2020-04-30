//
//  FactsViewModel.swift
//  POCApp
//
//  Created by Kavita Patil on 30/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import Foundation
public class FactsViewModel: NSObject {
    
    //Parse JSON
    func parseJson(completionHandler: @escaping ([Rows]?,String?) -> ()) {
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let urlObj = URL(string: url)!
        _ = URLSession.shared.dataTask(with: urlObj) {(data, responds, Error) in
            guard let data = data else { return }
            guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
            guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
            do{
                let jsonResult = try JSONDecoder().decode(Response.self, from: properData)
                let rowArray = jsonResult.rows
                var finalRowArray = [Rows]()
                for item in rowArray {
                    if (item.title?.count ?? 0 > 0) {
                        finalRowArray.append(item)
                    }
                }
                let rowTitle = jsonResult.title
                completionHandler(finalRowArray,rowTitle ?? "")
            }
            catch let error {
                print(error)
            }
        }.resume()
    }
}


