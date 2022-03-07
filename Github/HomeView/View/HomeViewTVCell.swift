//
//  HomeViewTVCell.swift
//  Github
//
//  Created by Karthick R on 4/11/21.
//

import UIKit

class HomeViewTVCell: UITableViewCell {
    
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var lblCommitHash: UILabel!
    @IBOutlet weak var lblCommitMsg: UILabel!
    @IBOutlet weak var seperatorView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func loadTVCCell(_ objHomeViewDisplayEntity: HomeViewDisplayEntity) {
        if let tempAuthor = objHomeViewDisplayEntity.author {
            lblAuthor.text = tempAuthor
        }
        else {
            lblAuthor.text = Empty_Text
        }
        if let tempCommitHash = objHomeViewDisplayEntity.commitHash {
            lblCommitHash.text = tempCommitHash
        }
        else {
            lblCommitHash.text = Empty_Text
        }
        if let tempCommitMsg = objHomeViewDisplayEntity.commitMessage {
            lblCommitMsg.text = tempCommitMsg
        }
        else {
            lblCommitMsg.text = Empty_Text
        }
        seperatorView.isHidden = false
    }
    
}
