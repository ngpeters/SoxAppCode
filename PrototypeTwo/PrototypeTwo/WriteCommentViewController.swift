
//
//  WriteCommentViewController.swift
//  PrototypeTwo
//
//  Created by Natalie Peters on 4/6/17.
//  Copyright © 2017 Natalie Peters. All rights reserved.
//

import UIKit

class WriteCommentViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var starRating: CosmosView!
    @IBOutlet weak var pickedRun: UILabel!
    @IBOutlet weak var runDropDown: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    var placeholderLabel : UILabel!
    //Circle -- 1 -- Easy -- \u{25CF}
    //Square -- 2 -- Moderate -- \u{25A0}
    //Diamond -- 3 -- Expert -- \u{25C6}
    //Double Diamond -- 4 -- Very Diffiult -- \u{25C6} \u{25C6}
    
    var runs = ["General", "Alice Avenue \u{25CF}", "Bluebell \u{25A0}", "Easy Street \u{25CF}", "Figure 8 Gully \u{25C6} \u{25C6}", "Figure 8 Gully \u{25C6}", "Lazy Susan \u{25C6} \u{25C6}", "Lower Mini Miners \u{25CF}", "Thunder Alley \u{25C6} \u{25C6}", "Tiny Tiger \u{25C6} \u{25C6}", "To Baby Thunder Chair \u{25CF}", "Center of Gravity \u{25C6}", "Fields of Glory \u{25C6}", "High Baldy Traverse \u{25C6}", "High Ridge \u{25C6}", "Thanks for the Memories \u{25C6}", "Venus Line \u{25C6}", "West Baldy \u{25C6}", "Blackjack Traverse \u{25C6} \u{25C6}", "Lightning Tree Gully \u{25C6} \u{25C6}", "Who Cares \u{25C6} \u{25C6}", "Whodunnit \u{25A0}", "Blackjack Gully \u{25C6} \u{25C6}", "Condo Bypass\u{25C6} \u{25C6}", "Gun Towers \u{25C6}", "Shot \u{25C6}", "The Keyhole \u{25C6}", "Westward Ho (From Alta) \u{25C6} \u{25C6}", "Chickadee \u{25CF}", "Chickadee Chutes \u{25CF}", "Barry Barry Steep \u{25C6}", "Binx's Bumper \u{25C6}", "Cirque Traverse \u{25C6} \u{25C6}", "Dalton's Draw \u{25C6} \u{25C6}", "Gad Chutes \u{25C6}", "Glen's \u{25C6} \u{25C6}", "Great Scott \u{25C6}", "Lower Cirque \u{25C6} \u{25C6}", "Middle Cirque \u{25C6} \u{25C6}", "Restaurant Roll \u{25C6}", "Upper Cirque \u{25C6}", "Upper Mach Schnell \u{25C6}", "Wilbere Bowl \u{25C6}", "Wilma's \u{25C6}", "Bananas \u{25A0}", "Bass Below \u{25A0}", "Black Forest \u{25C6} \u{25C6}", "Election \u{25A0}", "Gad 2 Touring Gate \u{25C6}", "Gad Gully \u{25C6} \u{25C6}", "Gadzooks \u{25C6} \u{25C6}", "Lower Bassackwards \u{25A0}", "Organ Grinder \u{25C6} \u{25C6}", "S.T.H \u{25C6} \u{25C6}", "Tricep \u{25C6} \u{25C6}", "Upper Bassackwards \u{25A0}", "Carbonate \u{25C6}", "Madam Annie's \u{25A0}", "Sneaky Pete \u{25C6} \u{25C6}", "Upper Mini Miner's Camp \u{25CF}", "West 2nd South Onramp \u{25CF}", "Come From Behind Gully \u{25C6} \u{25C6}", "Goblin Gully \u{25C6} \u{25C6}", "Hoop's \u{25C6} \u{25C6}", "Knucklehead Traverse \u{25C6} \u{25C6}", "Last Choice \u{25C6} \u{25C6}", "Mark Malu \u{25C6}", "Old Ladies \u{25C6}", "Rasta Chutes \u{25C6} \u{25C6}", "Road to Provo \u{25C6}", "Shireen \u{25C6} \u{25C6}", "Shot 41 \u{25C6} \u{25C6}", "49er Gully \u{25C6} \u{25C6}", "Bassa10va \u{25A0}", "Bird's Nest \u{25CF}", "Blue By You \u{25C6} \u{25C6}", "Chamonix Bowl \u{25C6} \u{25C6}", "Chamonix Chutes \u{25C6}", "Claim Jumper \u{25CF}", "Double Down \u{25C6} \u{25C6}", "Fossil Chutes \u{25C6}", "High Stakes \u{25C6} \u{25C6}", "Limber Pines \u{25C6}", "Livin' The Dream \u{25C6}", "Lone Star \u{25C6} \u{25C6}", "Luckey Boy \u{25CF}", "Lupine Loop \u{25CF}", "Nash Flora Lode \u{25C6} \u{25C6}", "10t Quite Corn \u{25C6} \u{25C6}", "Path to Paradise \u{25C6} \u{25C6}", "Silver Dipper \u{25C6} \u{25C6}", "Ski Patrol Gully \u{25C6} \u{25C6}", "Cliff Access \u{25A0}", "Adager \u{25C6} \u{25C6}", "Anderson's Hill \u{25C6} \u{25C6}", "Chip's Access \u{25A0}", "Chip's Bypass \u{25A0}", "Chip's Face \u{25C6} \u{25C6}", "Chip's Run \u{25A0}", "Hot Foot Gully \u{25C6} \u{25C6}", "Hot Lips Gully \u{25A0}", "Hubba Bubba,1,10,No,2 \u{25A0}", "Lower Chip's \u{25CF}", "Lower Primrose Path \u{25C6} \u{25C6}", "Lower Silver Fox \u{25C6} \u{25C6}", "Middle Chip's Run \u{25A0}", "Oh My God \u{25C6} \u{25C6}", "Phone Shot \u{25C6} \u{25C6}", "Rothman Way \u{25C6} \u{25C6}", "Route Gully \u{25C6} \u{25C6}", "Upper Primrose Path \u{25C6} \u{25C6}", "Upper Silver Fox \u{25C6}", "Willows \u{25C6} \u{25C6}", "Bookmark Gully \u{25C6} \u{25C6}", "Junior's Powder Paradise \u{25C6}", "White Diamonds \u{25C6} \u{25C6}", "Alimony Chutes \u{25C6}", "Altar Bowl \u{25C6}", "Bookends Bowl \u{25C6}", "Bookends Traverse \u{25C6} \u{25C6}", "Richie's Run \u{25C6}", "The Endoras \u{25C6}", "Conrad \u{25C6}", "Defiance Ledge \u{25C6}", "Delores \u{25C6}", "Exit Gully \u{25C6}", "Figure 8 Bowl \u{25C6}", "High Saddle Traverse \u{25C6}", "Low Saddle \u{25C6}", "Mo \u{25C6}", "Mushroom Land \u{25C6}", "Shot \u{25C6}", "Thunder Bowl \u{25C6}", "White Rabbit \u{25C6}", "Gad 2 Return \u{25C6} \u{25C6}", "Lower Tiger Tail \u{25C6} \u{25C6}", "Mozza Bowl \u{25C6} \u{25C6}", "Pearly Gates \u{25C6} \u{25C6}", "Red Lens Line \u{25C6}", "S.O.B. \u{25C6} \u{25C6}", "Ted's Bowl \u{25C6} \u{25C6}", "Temptation Chutes \u{25C6} \u{25C6}", "Upper Tiger Tail \u{25C6} \u{25C6}"]
    
    var runID = 0
    var runRating = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.darkGray.cgColor
        pickedRun.layer.borderWidth = 0.5
        pickedRun.layer.borderColor = UIColor.darkGray.cgColor
        placeholderLabel = UILabel()
        placeholderLabel.text = "Enter a comment"
        placeholderLabel.font = UIFont.italicSystemFont(ofSize: (textView.font?.pointSize)!)
        placeholderLabel.sizeToFit()
        textView.addSubview(placeholderLabel)
        placeholderLabel.frame.origin = CGPoint(x: 5, y: (textView.font?.pointSize)! / 2)
        placeholderLabel.textColor = UIColor.lightGray
        placeholderLabel.isHidden = !textView.text.isEmpty
        //print("placeholder set")
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(WriteCommentViewController.DismissKeyboard))
        view.addGestureRecognizer(tap)
        
        // Show only fully filled stars
        starRating.settings.fillMode = .full
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    
    func DismissKeyboard(){
        view.endEditing(true)
    }
    //posting button
    @IBAction func postComment(_ sender: Any) {
        print("text: ")
        print(textView.text)
        print("runID: ")
        print(runID)
        data_request(url: "http://localhost:9000/newcomment")
        
        self.performSegue(withIdentifier: "postedComment", sender: nil)
    }
    
    //posting function, called from button
    func data_request(url: String)
    {
        runRating = Int(starRating.rating)
        
        starRating.didFinishTouchingCosmos = { rating in
            self.starRating.rating = rating
        }
        
        runRating = Int(starRating.rating)
        
        let runRatingString = String(runRating)
        //GET userID from saved userDefaults
        let userID = (UserDefaults.standard.string(forKey: "userID"))!
        let userIDString = String(userID)
        let runIDString = String(runID)
        var comment = textView.text
        if (comment?.isEmpty)!{
            comment = "No Comment"
        }
        let nurl = URL(string: url)!
        //snowbird is resortID 1
        let jsonDict = ["comment" : comment ?? "NoComment",
                        "rating" : runRatingString,
                        "userID" : userIDString!,
                        "runID" : runIDString,
                        "resortID" : "1"] as [String : Any]
        
        let jsonData = try! JSONSerialization.data(withJSONObject: jsonDict, options: [])
        var request = URLRequest(url: nurl)
        request.httpMethod = "post"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error:", error)
                return
            }
            
            do {
                guard let data = data else { return }
                guard let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: AnyObject] else { return }
                print("json:", json)
            } catch {
                print("error:", error)
                self.displayErrorMessage(userMessage: "You didn't pick a run to rate, so your comment didn't get posted.")
                print("error 2")
            }
        }
        
        task.resume()
        
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        
        return runs.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        self.view.endEditing(true)
        return runs[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.pickedRun.text = self.runs[row]
        runID = row
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayErrorMessage(userMessage: String) {
        let myAlert = UIAlertController(title: "Comment Check", message: userMessage, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        myAlert.addAction(alertAction)
        self.present(myAlert, animated: true, completion:nil)
    }
}
