//
//  ViewController.swift
//  POCApp
//
//  Created by Kavita Patil on 27/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var navigationBarTitle: UINavigationBar!
    
    var rowsList = [rows]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parseJson()
    }
    
    func parseJson() {
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        let urlObj = URL(string: url)!
        let task = URLSession.shared.dataTask(with: urlObj) {(data, responds, Error) in
            guard let data = data else { return }
            guard let string = String(data: data, encoding: String.Encoding.isoLatin1) else { return }
            guard let properData = string.data(using: .utf8, allowLossyConversion: true) else { return }
            do{
                let jsonResult = try JSONDecoder().decode(Response.self, from: properData)
                let rowArray = jsonResult.rows
                self.rowsList = rowArray
                DispatchQueue.main.async() {
                    self.navigationBarTitle.topItem?.title = jsonResult.title
                    self.tableView.reloadData()
                }
            }
            catch let error {
                print(error)
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRow = rowsList[indexPath.row]
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "RowDetailTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RowDetailTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RowDetailTableViewCell.")
        }
        if currentRow.title != nil {
        cell.labelTitle.text = currentRow.title
        }
        if currentRow.title != nil {
        cell.labeldescription.text = currentRow.description
        }
        if currentRow.imageHref != nil{
            cell.imgView.downloaded(from: currentRow.imageHref!, contentMode: .scaleAspectFit)
        }
        return cell
    }
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
