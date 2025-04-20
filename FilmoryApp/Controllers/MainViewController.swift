//
//  MainViewController.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 20.04.2025.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    let gensres = Category.categories
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        
        setGradientBackground()
        setTableViewGradientBackground()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(hex: "#BDDDE4")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    // MARK: - Functions
    
    
    // MARK: - Actions
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - UITableView DataSource & Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        gensres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath) as! CategoryTableViewCell
        cell.updateUI(categoryName: gensres[indexPath.row])
       
        let selectedView = UIView()
        selectedView.backgroundColor = .white
        cell.selectedBackgroundView = selectedView
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "detailCategory", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension MainViewController {
    
    // MARK: - UI Setup: Background
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
    
    func setTableViewGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(hex: "#BDDDE4").cgColor,
            UIColor(hex: "#9FB3DF").cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = tableView.bounds
        
        let backgroundView = UIView(frame: tableView.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        tableView.backgroundView = backgroundView
    }
}
