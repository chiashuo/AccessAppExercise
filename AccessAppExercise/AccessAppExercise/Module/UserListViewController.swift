//
//  UserListViewController.swift
//  AccessAppExercise
//
//  Created by Johnny Chang on 2019/11/29.
//  Copyright © 2019 chiashuo. All rights reserved.
//

import UIKit
import PKHUD

class UserListViewController: BaseViewController {

    @IBOutlet weak var userTableView: UITableView!
    private var userListViewModel = UserListViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpView()
        setUpViewModel()
        fetchUsers()
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
fileprivate extension UserListViewController{
    
    private func setUpView() {
        
        let nib = UINib.init(nibName: "UserInfoTableViewCell", bundle: nil)
        userTableView.register(nib, forCellReuseIdentifier: "UserInfoTableViewCellIdentifier")
    }
    
    private func setUpViewModel() {
        
        userListViewModel.shouldUpdateUserList = { [weak self] (users) in
            HUD.hide()
            self?.userTableView.reloadData()
        }
    }
    
    private func fetchUsers() {
        HUD.show(.progress, onView: view)
        userListViewModel.fetchUserList()
    }
}

extension UserListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoTableViewCellIdentifier", for: indexPath) as! UserInfoTableViewCell
        cell.userInfo = userListViewModel.users[indexPath.section]
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section >= (userListViewModel.users.count - 1) {
            self.fetchUsers()
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
        return min(userListViewModel.users.count, 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
}

extension UserListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let userInfo = userListViewModel.users[indexPath.section]
        let userInfoDetailViewController = UserInfoDetailViewController(nibName: "UserInfoDetailViewController", bundle: nil)
        userInfoDetailViewController.userName = userInfo.login  ?? ""
        userInfoDetailViewController.modalPresentationStyle = .custom
        self.present(userInfoDetailViewController, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 5))
        headerView.backgroundColor = UIColor(hex: 0x000000, alpha: 0.1)
        return headerView
    }
}
