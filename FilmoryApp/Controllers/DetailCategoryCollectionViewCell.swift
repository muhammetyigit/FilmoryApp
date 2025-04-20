//
//  DetailCategoryCollectionViewCell.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 20.04.2025.
//

import UIKit

class DetailCategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func updateUI(movieImage: UIImage, movieName: String, movieRate: String) {
        self.movieImage.image = movieImage
        self.movieName.text = movieName
        self.movieRate.text = movieRate
    }
}
