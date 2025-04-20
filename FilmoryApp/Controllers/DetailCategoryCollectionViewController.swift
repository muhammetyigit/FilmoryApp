//
//  DetailCategoryCollectionViewController.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 20.04.2025.
//

import UIKit

class DetailCategoryCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieManager = MovieManager.shared
        collectionView.backgroundColor = .clear
        
        setGradientBackground()
        setCollectionViewGradientBackground()
        configureNavigationBarAppearance()
    }
    
    // MARK: UICollectionView DataSource & Delegate
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return MovieManager.shared.movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryDetail", for: indexPath) as! DetailCategoryCollectionViewCell
        let movie = MovieManager.shared.movies[indexPath.row]
        cell.updateUI(movieImage: movie.movieImage!, movieName: movie.movieName, movieRate: movie.movieRate)
        return cell
    }
    
    @IBAction func unwindSegue(unwindSegue: UIStoryboardSegue) {
        if let sourceVC = unwindSegue.source as? NewMoviewTableViewController {
            if let newMovie = sourceVC.newMovie {
                MovieManager.shared.addMovie(newMovie)
                collectionView.reloadData()
                print("New movie added:", newMovie.movieName)
            }
        }
    }
    
}

extension DetailCategoryCollectionViewController {
    
    func setGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "#BDDDE4").cgColor,
            UIColor(hex: "#9FB3DF").cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setCollectionViewGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "#BDDDE4").cgColor,
            UIColor(hex: "#9FB3DF").cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = collectionView.bounds
        
        let backgroundView = UIView(frame: collectionView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        collectionView.backgroundView = backgroundView
    }
    
    func configureNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hex: "#BDDDE4")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.isTranslucent = false
    }
}
