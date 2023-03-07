//
//  MovieDetailViewController.swift
//  Flixter1.2
//
//  Created by Jose Ortiz on 3/6/23.
//

import UIKit
import Nuke
class MovieDetailViewController: UIViewController {
    var movie: [String:Any]!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieBackground: UIImageView!
    
    @IBOutlet weak var totalVotes: UILabel!
    
    @IBOutlet weak var avgVote: UILabel!
    
    @IBOutlet weak var popuLabel: UILabel!
    
    @IBOutlet weak var sypnopsisLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTitle.text = movie["title"] as! String
        movieTitle.sizeToFit()
        
        sypnopsisLabel.text = movie["overview"] as! String
        
        
//        votesString += movie["vote_average"] as! String
        let AvgVotes = movie["vote_average"] as! Double
        avgVote.text = "Vote average:  " + String(AvgVotes)
        
        let votes = movie["vote_count"] as! Double
        totalVotes.text = "Total votes: " + String(votes)
        
        let popul = movie["popularity"] as! Double
        popuLabel.text = "Popularity: " + String(popul)
        
        
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w1280"+backdropPath)
        Nuke.loadImage(with:backdropUrl!, into: movieBackground)
        
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
