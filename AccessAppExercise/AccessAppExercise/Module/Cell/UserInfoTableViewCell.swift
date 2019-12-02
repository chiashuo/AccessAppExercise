//
//  UserInfoTableViewCell.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var staffLabel: UILabel!
    var userInfo: User?{
        didSet{
            userAvatarImageView.setImageWithFadeEffectWithURL(userInfo?.avatar_url ?? "", placeHolder: UIImage())
            userNameLabel.text = userInfo?.login
            staffLabel.isHidden = userInfo?.site_admin == false
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userAvatarImageView.layer.cornerRadius = 30
        staffLabel.layer.cornerRadius = 9
        selectionStyle = .none
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
