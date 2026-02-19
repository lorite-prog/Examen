//
//  DetailViewController.swift
//  Examen
//
//  Created by Tardes on 18/2/26.
//

import UIKit

class DetailViewController: UIViewController {
    
    var movie: Movie!
    var movieName: String!
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var  yearLabel: UILabel!
    @IBOutlet weak var  directorLabel: UILabel!
    @IBOutlet weak var  runtimeLabel: UILabel!
    @IBOutlet weak var  plotLabel: UILabel!
    @IBOutlet weak var  genreLabel: UILabel!
    @IBOutlet weak var  countryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        Task {
            movie = await MovieApi.getMovieByTitle(imdbID: movie.id)
            DispatchQueue.main.async {
                self.configureView()
            }
        }
    }
        
        func configureView() {
            posterImageView.loadFrom(url: movie.poster)
            titleLabel.text = movie.title
            runtimeLabel.text = movie.runtime
            plotLabel.text = movie.plot
            yearLabel.text = movie.year
            directorLabel.text = movie.director
            genreLabel.text = movie.genre
            countryLabel.text = movie.country
            
        }
        
    }
