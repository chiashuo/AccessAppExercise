//
//  UserInfoDetaiTableViewCell.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import UIKit

class UserInfoDetaiTableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var staffLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var blogButton: UIButton!
    
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
    @IBAction func blogButtonPressed(_ sender: Any) {
        let blog = blogButton.title(for: .normal) ?? ""
        if let url = URL(string: blog){
            UIApplication.shared.open(url, options:[:], completionHandler: nil)
        }
    }
    
}
