//
//  WelcomeViewController.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 20.04.2025.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Animation
    let clapperImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "filmory")
        imageView.contentMode = .scaleAspectFit
        imageView.alpha = 1
        return imageView
    }()
    
    let fullLabel: UILabel = {
        let label = UILabel()
        label.text = "FILMORY"
        label.font = UIFont(name: "Copperplate", size: 48)
        label.textColor = .label
        label.alpha = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientBackground()
        
        view.addSubview(clapperImageView)
        view.addSubview(fullLabel)
        
        clapperImageView.translatesAutoresizingMaskIntoConstraints = false
        fullLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            clapperImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clapperImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            clapperImageView.widthAnchor.constraint(equalToConstant: 96),
            clapperImageView.heightAnchor.constraint(equalToConstant: 96),
            
            fullLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fullLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        animateClapper()
    }
    
    func animateClapper() {
        clapperImageView.transform = CGAffineTransform(translationX: -view.bounds.width / 2 - 96, y: 0)
        
        UIView.animate(withDuration: 1.2,
                       delay: 0.3,
                       usingSpringWithDamping: 0.6,
                       initialSpringVelocity: 0.8,
                       options: [],
                       animations: {
            self.clapperImageView.transform = .identity
        }) { _ in
            UIView.animate(withDuration: 0.4, animations: {
                self.clapperImageView.alpha = 0
                self.fullLabel.alpha = 1
            }, completion: { _ in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    self.goToMainScreen()
                }
            })
        }
    }
    
    func goToMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let navController = UINavigationController(rootViewController: mainVC)
        navController.modalTransitionStyle = .crossDissolve
        navController.modalPresentationStyle = .fullScreen
        self.present(navController, animated: true)
    }
    
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
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

