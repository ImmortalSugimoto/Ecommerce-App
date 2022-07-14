//
//  AccountViewController.swift
//  ecommerce
//
//  Created by xcode on 7/1/22.
//

import UIKit

class AccountViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var user: UILabel!
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath) as! SettingsTableViewCell
       cell.settingType.text = accountList[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(account.username as Any)
        print(account.email as Any)
        print(account.shippingAddress as Any)
        print(account.billingAddress as Any)
        print(account.paymentInfo as Any)

        let accountList = [account.username, account.email, account.shippingAddress, account.billingAddress, account.paymentInfo]

        print("make it")


    }
}
