//
//  CategoryTableViewCell.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 20.04.2025.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellLabel: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = .clear
        textLabel?.textColor = .label
    }
    
    func updateUI(categoryName: String) {
        cellLabel.text = categoryName
    }
    
}
