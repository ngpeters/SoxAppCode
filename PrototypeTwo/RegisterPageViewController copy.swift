//
//  RegisterPageViewController.swift
//  PrototypeOne
//
//  Created by Natalie Peters on 1/30/17.
//  Copyright © 2017 Natalie Peters. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var usernameTextFeild: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func RegisterButtonGo(_ sender: Any) {
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userConfirmPassword = confirmPasswordTextField.text
        let username = usernameTextFeild.text
        
        //check for empty feilds
        if ( (userEmail?.isEmpty)! || (userPassword?.isEmpty)! || (userConfirmPassword?.isEmpty)! || (username?.isEmpty)! ){
            //alert message
            displayAlertMessage(userMessage: "All feilds required")
            return
        }
        
        //check passwords match
        if ( userPassword != userConfirmPassword ){
            //alert message
            displayAlertMessage(userMessage: "Passwords must match")
            return
        }
        
        
        //store data -- this is locally stored right now!
        UserDefaults.standard.set(userEmail, forKey: "userEmail")
        UserDefaults.standard.set(userPassword, forKey: "userPassword")
        UserDefaults.standard.set(username, forKey: "username")
        UserDefaults.standard.synchronize()
        
        //display alert message with confirmation
        let myAlert = UIAlertController(title: "Alert", message: "Registration Successful", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Ok", style: .default){ action in
            self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okayAction)
        self.present(myAlert, animated: true, completion:nil)
    }
    //display alert
    func displayAlertMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(alertAction)
        self.present(myAlert, animated: true, completion:nil)
    }
    
    
    @IBAction func AlreadyHaveAnAccount(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
