//
//  MovieTableCell.swift
//  Flixter1.2
//
//  Created by Jose Ortiz on 3/6/23.
//

import UIKit

class MovieTableCell: UITableViewCell {

   
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieSynopsis: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
