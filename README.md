# AccessAppExercise

## Feature
* User list of GitHub 
 	* Include
    	- avatar
    	- lgoin
    	- site_admin badge
 	* Load as page,page size is 20
 	* Limit to 100 users
* User info 
 	* Include
 		- avatar
 		- name
 		- bio
 		- login
 		- site_admin
 		- location
 		- blog
 	* Click blog will open url in Safari
## Requirements
  * iOS 11.0+
	* Xcode 11.2.1
	* Swift 5
## Architecture
  * MVVM
	* Enum
		- EnumUserDetailCellType: tableViewCellType of user info page
	* Extension
		- UIColorExtension: use hexadecimal to set color
		- UIImageView: implement SDWebImage
	* Shared
		- BaseViewController: inherit ViewController, include default setting
		- Config: screen size、Api Domain
	* Service
		- UserListService: fetch User List api, implement by using Alamofire
		- UserInfoDetailService: fetch User Info, implement by using Alamofire
	* Model
		- User: user object of user list
		- UserInfoDetail: user object of user info detail 
	* ViewModel
		- UserListViewModel: fetch user list data, trigger view to update UI
			1.userListService: to fetch User List api 
			2.shouldUpdateUserList: trigger view to update UI
			3.users: user list object 
			4.fetchUserList: implement fetch user list 
		- UserInfoDetailViewModel: fetch user info dat, trigger view to update UI
			1.userInfoDetailService: to fetch user info api
			2.shouldUpdateUserDeatil: trigger view to update UI
			3.userInfoDetail: user info detail object 
			4.fetchUserInfo: implement fetch user info
	* Module
		*Cell
			- UserInfoTableViewCell: row item of user list view
				1. userAvatarImageView: avatar
				2. userNameLabel: login
				3. staffLabel: site_admin
				4. userInfo: user object of user list, show content in each ui component
			- UserAvatarTableViewCell: upper part of user info detail page
				1. avatarImageView: avatar
				2. nameLabel: name
				3. bioLabel: bio
			- UserInfoDetaiTableViewCell：lower part of user info detail page
				1. userNameLabel: login
				2. staffLabel: site_admin
				3. locationLabel: locatioin
				4. blogButton: blog, if clicked, will open url in Safari
		* UserListViewController
			1. userTableView: display user info by list
			2. userListViewModel: fetch user list data, trigger view to update UI
			3. fuction :
				- setUpView: register cell
				- setUpViewModel: setting up view model
				- fetchUsers: fetch User List
				- set data in UITableViewDataSource
				- handle click event, padding of row item in UITableViewDelegate
		* UserInfoDetailViewController
			1. userInfoDetailTableView: display user info deatil
			2. userInfoDetail: fetch user info detail data, trigger view to update UI
			3. dataSource: table view cell type
			4. userName : parameter for fetch user info detail
			5. closeButton: close page
			6. function :
				- setupView: register cell
				- setUpViewModel: setting up view model
				- fetchUserInfoDetail: fetch user info detail
				- set data in UITableViewDataSource
## Third Party
  * Alamofire: HTTP Networking
  * SDWebImage: Load Image
  * PKHUD: Loading View 





