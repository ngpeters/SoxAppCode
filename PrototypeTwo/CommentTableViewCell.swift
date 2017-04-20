//
//  CommentTableViewCell.swift
//  PrototypeTwo
//
//  Created by Natalie Peters on 4/15/17.
//  Copyright © 2017 Natalie Peters. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var cellUserName: UILabel!
    @IBOutlet weak var cellRating: CosmosView!
    @IBOutlet weak var cellTime: UILabel!
    @IBOutlet weak var cellComment: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(_ rating: Int) {
        cellRating.settings.fillMode = .full
        cellRating.settings.updateOnTouch = false
        cellRating.rating = Double(rating)
    }
}
