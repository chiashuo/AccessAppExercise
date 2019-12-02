//
//  UserInfoDetailViewController.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import UIKit
import PKHUD

class UserInfoDetailViewController: BaseViewController {

    @IBOutlet weak var userInfoDetailTableView: UITableView!
    
    var userInfoDetail : UserInfoDetail?
    
    private var viewModel = UserInfoDetailViewModel()
    
    private var dataSource: Array<UserDetailCellType> = []
    
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        fetchUserInfoDetail()
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
}

// MARK: - IBAction
extension UserInfoDetailViewController {
    @IBAction func closeButtonDidPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
fileprivate extension UserInfoDetailViewController {
    func setupView(){
        let avatarNib = UINib.init(nibName: "UserAvatarTableViewCell", bundle: nil)
        userInfoDetailTableView.register(avatarNib, forCellReuseIdentifier: "UserAvatarTableViewCellIdentifier")
        let detailNib = UINib.init(nibName: "UserInfoDetaiTableViewCell", bundle: nil)
        userInfoDetailTableView.register(detailNib, forCellReuseIdentifier: "UserInfoDetaiTableViewCelldentifier")
    }
    func setupViewModel() {
        viewModel.shouldUpdateUserDeatil = { [weak self] (userInfoDetail) in
            self?.userInfoDetail = userInfoDetail
            self?.dataSource = [.avatar,.detail]
            self?.userInfoDetailTableView.reloadData()
            HUD.hide()
        }
    }
    func fetchUserInfoDetail() {
        HUD.show(.progress, onView: view)
        viewModel.fetchUserInfo(userName: userName)
    }
}

extension UserInfoDetailViewController: UITableViewDataSource{
     
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let type = dataSource[indexPath.section]
        switch type {
        case .avatar:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserAvatarTableViewCellIdentifier", for: indexPath) as! UserAvatarTableViewCell
            cell.avatarImageView.setImageWithFadeEffectWithURL(userInfoDetail?.avatar_url ?? "", placeHolder: UIImage())
            cell.nameLabel.text = userInfoDetail?.name
            cell.bioLabel.text = userInfoDetail?.bio
            return cell
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoDetaiTableViewCelldentifier", for: indexPath) as! UserInfoDetaiTableViewCell
            cell.blogButton.setTitle(userInfoDetail!.blog, for: .normal)
            cell.locationLabel.text = userInfoDetail?.location
            cell.userNameLabel.text = userInfoDetail?.login
            let shouldShow = userInfoDetail?.site_admin ?? false;
            cell.shouldShowStaffLabel(show: shouldShow)
            return cell
        }
        
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
}
