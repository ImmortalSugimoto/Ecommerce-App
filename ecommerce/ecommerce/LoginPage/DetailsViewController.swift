//
//  DetailsViewController.swift
//  ecommerce
//
//  Created by xcode on 7/5/22.
//

import UIKit
import KeychainSwift

class DetailsViewController: UIViewController {
let keychain = KeychainSwift()
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let topString = keychain.get("user") else {return}
        navigationItem.prompt = NSLocalizedString(topString, comment: "")
    }
    
    @IBOutlet weak var titleBar: UINavigationBar!
    
    
     @IBOutlet weak var titleTop: UINavigationItem!
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
    }
    

}
