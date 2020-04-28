//
//  RowDetailTableViewCell.swift
//  POCApp
//
//  Created by Kavita Patil on 27/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import UIKit

class RowDetailTableViewCell: UITableViewCell {
       @IBOutlet weak var labelTitle: UILabel!
       @IBOutlet weak var labeldescription: UILabel!
       @IBOutlet weak var imgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
