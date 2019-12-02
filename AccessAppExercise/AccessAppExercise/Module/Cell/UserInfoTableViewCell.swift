//
//  UserInfoTableViewCell.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    /// avatar_url
    @IBOutlet weak var userAvatarImageView: UIImageView!
    /// login
    @IBOutlet weak var userNameLabel: UILabel!
    
    /// site_admin
    @IBOutlet weak var staffLabel: UILabel!
    
    @IBOutlet weak var userNameLabelCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var userNameLabelTopYConstraint: NSLayoutConstraint!
    
    var userInfo: User?{
        didSet{
            userAvatarImageView.setImageWithFadeEffectWithURL(userInfo?.avatar_url ?? "", placeHolder: UIImage())
            userNameLabel.text = userInfo?.login
            guard let shouldShow = userInfo?.site_admin else {
                return
            }
            staffLabel.isHidden = shouldShow == false
            userNameLabelCenterYConstraint.priority = shouldShow ? .defaultLow: .defaultHigh
            userNameLabelTopYConstraint.priority = shouldShow ? .defaultHigh: .defaultLow
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
    override func prepareForReuse() {
        super.prepareForReuse()
        staffLabel.isHidden = true
        userNameLabelCenterYConstraint.priority = .defaultHigh
        userNameLabelTopYConstraint.priority = .defaultLow
    }
    
}
