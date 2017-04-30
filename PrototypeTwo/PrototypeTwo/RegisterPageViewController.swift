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
    
    var userEmail = String()
    var userPassword = String()
    var username = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func data_request(_ url:String)
    {
        var urls = url;
        
        let parameters = ["username" : username ,
                          "password" : userPassword,
                          "email" : userEmail].map { "\($0)=\($1 )" }
        //map { "\($0)=\($1 ?? "")" }
        
        let paramString = parameters.joined(separator: "&")
        
        print()
        print(paramString)
        print()
        
        urls = urls + paramString
        
        let url:NSURL = NSURL(string: urls)!
        
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url as URL)
        
        request.httpMethod = "POST"
        
//        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest) {
            (
            data, response, error) in
            
            guard let _:NSData = data as NSData?, let _:URLResponse = response, error == nil else {
                print("error")
                return
            }
            
            if let dataString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            {
                print(dataString)
            }
        }
        
        task.resume()
        
    }

    @IBAction func RegisterButtonGo(_ sender: Any) {
        username = usernameTextFeild.text!
        userEmail = userEmailTextField.text!
        userPassword = userPasswordTextField.text!
        let userConfirmPassword = confirmPasswordTextField.text
        
        //check for empty feilds
        if ( (userEmail.isEmpty) || (userPassword.isEmpty) || (userConfirmPassword?.isEmpty)! || (username.isEmpty) ){
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
        
        //store data
        //to server
        data_request("https://ratemyrun.herokuapp.com/newuser?")
        
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
