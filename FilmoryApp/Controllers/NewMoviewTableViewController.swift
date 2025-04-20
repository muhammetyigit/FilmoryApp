//
//  NewMoviewTableViewController.swift
//  FilmoryApp
//
//  Created by Muhammet Yiğit on 20.04.2025.
//

import UIKit

class NewMoviewTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieNameTextField: UITextField!
    @IBOutlet weak var movieRateTextField: UITextField!
    
    var newMovie: NewMovie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        movieImage.isUserInteractionEnabled = true
        movieImage.contentMode = .scaleAspectFill
        movieImage.clipsToBounds = true
    }
    
    
    func newMovie(image: UIImage, name: String, rate: String) -> NewMovie {
        let newMovie = NewMovie(movieImage: image, movieName: name, movieRate: rate)
        return newMovie
    }
    
    
    @IBAction func newMovieButtonPressed(_ sender: Any) {
        if let image = movieImage.image, let name = movieNameTextField.text, let rate = movieRateTextField.text {
            newMovie = newMovie(image: image, name: name, rate: rate)
        }
    }
    
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            movieImage.image = selectedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            movieImage.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    
}

