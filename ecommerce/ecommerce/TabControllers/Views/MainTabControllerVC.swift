//
//  TemporaryVC.swift
//  ecommerce
//
//  Created by Vincent Salinas on 7/2/22.
//

import UIKit
import SwiftUI

class MainTabControllerVC: UIViewController {
    
    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let childView = UIHostingController(rootView: MainTabControllerSVC(idx: 0))
        addChild(childView)
        childView.view.frame = container.bounds
        container.addSubview(childView.view)
        
        initializeDatabase()
        
    }
    
    func initializeDatabase() {
        ProductDB.productDb.createDB()
        ProductDB.productDb.createTable()
//        print(ProductDB.productDb.getData())
        
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
