//
//  RecipeViewCell.swift
//  Examen
//
//  Created by Tardes on 18/2/26.
//

import UIKit

class MovieViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with movie: Movie) {
        nameLabel.text = movie.title
        yearLabel.text = movie.year
        posterImageView.loadFrom(url: movie.poster)
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
