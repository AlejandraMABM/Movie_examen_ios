//
//  MovieViewCell.swift
//  Movie_IOS
//
//  Created by Tardes on 27/1/25.
//

import UIKit

class MovieViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var yearLabel: UILabel!
    // @IBOutlet weak var iconImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func render(from movie: Movie) {
        nameLabel.text = movie.Title
        avatarImageView.loadFrom(url: movie.Poster)
        yearLabel.text = movie.Year
           
       }
    
    

}
