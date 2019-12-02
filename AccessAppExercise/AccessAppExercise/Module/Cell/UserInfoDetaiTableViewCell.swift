//
//  UserInfoDetaiTableViewCell.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import UIKit

class UserInfoDetaiTableViewCell: UITableViewCell {
    
    /// login
    @IBOutlet weak var userNameLabel: UILabel!
    /// site_admin
    @IBOutlet weak var staffLabel: UILabel!
    /// login
    @IBOutlet weak var locationLabel: UILabel!
    /// blog
    @IBOutlet weak var blogButton: UIButton!
    
    @IBOutlet weak var userNameLabelCenterYConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var userNameLabelTopYConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        staffLabel.layer.cornerRadius = 10
        // Initialization code
        selectionStyle = .none
        blogButton.contentHorizontalAlignment = .left
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func shouldShowStaffLabel( show:Bool){
        userNameLabelCenterYConstraint.priority = show ? .defaultLow: .defaultHigh
        userNameLabelTopYConstraint.priority = show ? .defaultHigh: .defaultLow
        staffLabel.isHidden = !show
    }
    
    /// Blog button click event
    /// - Parameter sender: blog button
    @IBAction func blogButtonPressed(_ sender: Any) {
        let blog = blogButton.title(for: .normal) ?? ""
        if let url = URL(string: blog){
            UIApplication.shared.open(url, options:[:], completionHandler: nil)
        }
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        staffLabel.isHidden = true
        userNameLabelCenterYConstraint.priority = .defaultHigh
        userNameLabelTopYConstraint.priority = .defaultLow
    }
    
}
