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
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarImageView: UIImageView!
    var movie:Movie!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = self.movie.Title
        
        nameLabel.text = movie.Title
        print("estoy en detail view controler : \(movie.Title)")
        //avatarImageView.loadFrom(url:

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
