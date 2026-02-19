//
//  ViewController.swift
//  Examen
//
//  Created by Tardes on 18/2/26.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var movieList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        searchBar.delegate = self
        
        tableView.dataSource = self
        
        //searchMovies(title: "")
    }
    
    private func searchMovies(title: String) {
          Task {
              movieList = await MovieApi.getMovies(title: title)
              DispatchQueue.main.async {
                  self.tableView.reloadData()
              }
          }
          
      }

   
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchMovies(title: searchBar.text ?? "")
    }
    
    /*func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchMovies(title: "")
    }
    
    // Actualiza la lista de películas mientras el usuario escribe en la barra de búsqueda
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchMovies(title: searchText)
    }*/
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie Cell", for: indexPath) as! MovieViewCell
        let movie = movieList[indexPath.row]
        cell.configure(with: movie)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailViewController = segue.destination as! DetailViewController
        let indexPath = tableView.indexPathForSelectedRow!
        let movie = movieList[indexPath.row]
        detailViewController.movie = movie
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

