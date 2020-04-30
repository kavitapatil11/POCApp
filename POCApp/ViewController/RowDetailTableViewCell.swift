//
//  RowDetailTableViewCell.swift
//  POCApp
//
//  Created by Kavita Patil on 27/04/20.
//  Copyright © 2020 Kavita Patil. All rights reserved.
//

import UIKit

class RowDetailTableViewCell: UITableViewCell {
    
    var rows: Rows? {
        didSet {
            if rows?.imageHref != nil{
                factsImage.downloaded(from: rows?.imageHref ?? "", contentMode: .scaleAspectFit)
            } else {
                //factsImage = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
            }
            if rows?.title != nil {
                titleLabel.text = rows?.title
            }
            if rows?.description != nil {
                descriptionLabel.text = rows?.description
            }
            
        }
    }
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.green
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor.black
        lbl.numberOfLines = 0
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.lineBreakMode = .byWordWrapping
        lbl.sizeToFit()
        return lbl
    }()
    
    private var factsImage: UIImageView = {
        let imgView = UIImageView(image: #imageLiteral(resourceName: "placeholder"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(factsImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        factsImage.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 90, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: factsImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, enableInsets: false)
        descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: factsImage.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 10, paddingBottom: 30, paddingRight: 20, width: frame.size.width , height: 0, enableInsets: false)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    override func prepareForReuse() {
        factsImage.image = UIImage(named: "placeholder")
    }
}
