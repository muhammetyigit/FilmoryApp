//
//  CategoryTableViewCell.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 20.04.2025.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        selectionStyle = .none
        textLabel?.textColor = .label
    }
    
}
