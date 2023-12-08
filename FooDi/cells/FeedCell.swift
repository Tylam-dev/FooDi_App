//
//  FeedCell.swift
//  FooDi
//
//  Created by Tyrone Vera on 6/12/23.
//

import UIKit
import Kingfisher
class FeedCell: UITableViewCell {

    @IBOutlet weak var imgUploaded: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgUploaded.clipsToBounds = true
        imgUploaded.layer.cornerRadius = imgUploaded.frame.size.width / 2
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpCell (image: URL, description: String, account: String, name: String, profileP: URL){
        imgUploaded.kf.setImage(with: image)
        descriptionText.text = description
        accountLabel.text = account
        nameLabel.text = name
        profilePicture.kf.setImage(with: profileP)
    }
}
