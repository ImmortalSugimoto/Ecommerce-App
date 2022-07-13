//
//  AccountViewController.swift
//  ecommerce
//
//  Created by xcode on 7/1/22.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingsTableViewCell
       //cell.settingType.text = accountDetail[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
