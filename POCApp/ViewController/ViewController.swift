//
//  ViewController.swift
//  POCApp
//
//  Created by Kavita Patil on 27/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables and IBOutlets
    let factsTableView = UITableView()
    var safeArea: UILayoutGuide!
    var rowsList = [Rows]()
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        safeArea = view.layoutMarginsGuide
        setupTableView()
        fetchData()
    }
    //MARK: - Fetch data
    func fetchData() {
        let factViewModel = FactsViewModel()
        factViewModel.parseJson(completionHandler: {
            data,title  in
            if data != nil
            {
                self.rowsList = data!
                DispatchQueue.main.async {
                    self.title = title
                    self.factsTableView.reloadData()
                }
            }
        })
    }
    
    // MARK: -Set up TableView
    func setupTableView()
    {
        view.addSubview(factsTableView)
        factsTableView.dataSource = self
        factsTableView.delegate = self
        factsTableView.register(RowDetailTableViewCell.self, forCellReuseIdentifier: "cellId")
        
        factsTableView.translatesAutoresizingMaskIntoConstraints = false
        factsTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        factsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        factsTableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor).isActive = true
        factsTableView  .rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
    }
}
// MARK: - TableView Delegate and DataSource Methods
extension ViewController: UITableViewDataSource,UITableViewDelegate {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowsList.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentRow = rowsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! RowDetailTableViewCell
        cell.selectionStyle = .none
        cell.rows = currentRow
        return cell
    }
    
}
