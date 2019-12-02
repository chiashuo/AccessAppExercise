//
//  UserAvatarTableViewCell.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import UIKit

class UserAvatarTableViewCell: UITableViewCell {
    
    /// avatar_url
    @IBOutlet weak var avatarImageView: UIImageView!
    /// name
    @IBOutlet weak var nameLabel: UILabel!
    
    /// bio
    @IBOutlet weak var bioLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatarImageView.layer.cornerRadius = (ScreenWidth - 120) / 2
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
