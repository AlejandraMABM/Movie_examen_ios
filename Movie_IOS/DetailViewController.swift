//
//  DetailViewController.swift
//  Movie_IOS
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    // @IBOutlet weak var nameLabel: UILabel!
    // @IBOutlet weak var avatarImageView: UIImageView!
    
    
    
    @IBOutlet weak var directorTextField: UITextField!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var SinopsisLabel: UILabel!
    @IBOutlet weak var DuracionLabel: UILabel!
    @IBOutlet weak var DirectorLabel: UILabel!
    @IBOutlet weak var GeneroLabel: UILabel!
    @IBOutlet weak var PaisLabel: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    var movie:Movie!
    var imdbID: String!
    
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        
        navigationItem.title = self.movie.Title
        
        
        
        
        
        // Do any additional setup after loading the view.
        
        
        fetchMovieDetails(by: movie.imdbID)
    }
    
    func fetchMovieDetails(by imdbID: String) {
        Task {
            do {
                // Llama a la función para buscar la película
                movie = try await MovieProvider.findMovieBy(imdbID:imdbID)
                
                updateUI() // Actualiza la interfaz con los datos obtenidos
            } catch {
                print("Error fetching movie details: \(error)")
                // Puedes manejar el error mostrando un mensaje al usuario
            }
        }
    }
    
    private func updateUI() {
        nameLabel.text = movie.Title
        YearLabel.text = movie.Year
        directorTextField.text = movie.Director
        nameLabel.text = movie.Title
        YearLabel.text = movie.Year
        SinopsisLabel.text = movie.Plot
        DuracionLabel.text = movie.Runtime
        DirectorLabel.text = movie.Director
        GeneroLabel.text = movie.Genre
        PaisLabel.text = movie.Country
        avatarImageView.loadFrom(url: movie.Poster)
        
        
    }
}
