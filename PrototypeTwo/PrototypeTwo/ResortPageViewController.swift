//
//  ResortPageViewController.swift
//  PrototypeTwo
//
//  Created by Natalie Peters on 3/7/17.
//  Copyright © 2017 Natalie Peters. All rights reserved.
//

import UIKit

class ResortPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func LogoutButton(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        UserDefaults.standard.synchronize()
        
        self.performSegue(withIdentifier: "loginViewFromResort", sender: self)
    }
    
}
