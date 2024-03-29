//
//  MoviesViewController.swift
//  Flixster-1
//
//  Created by Rishabh Tewari on 7/7/21.
//

import UIKit
import AlamofireImage
import Nuke

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var movies = [[String:Any]]()

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        

        // Do any additional setup after loading the view.
        //print("Hello")
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    self.movies = dataDictionary["results"] as! [[String:Any]]
                    self.tableView.reloadData()
                    //print(dataDictionary)
                
                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
             }
        }
        task.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableCell") as! MovieTableCell
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        //cell.textLabel?.text = "row: \(indexPath.row)"
        //cell.textLabel?.text = title
        cell.MovieTitle.text = title
        cell.MovieSynopsis.text = synopsis
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl+posterPath)
        //cell.MovieImage.af.setImage(withURL: posterUrl)
        Nuke.loadImage(with: posterUrl!, into: cell.MovieImage)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        
        vc.movie =  movies[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
       
    }
    
    
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//        print("Loading up the details screen")
//
//        //Tasks to do:
//        //Find the selected movie
//        let cell = sender as! UITableViewCell
//        let indexPath = tableView.indexPath(for: cell)!
//        let movie = movies[indexPath.row]
//        let detailsViewController = segue.destination as! MovieDetailViewController
//        detailsViewController.movie = movie
//        //pass the selected movie to the details view controller



 


}

