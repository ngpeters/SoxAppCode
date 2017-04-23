

//
//  CommentTableViewController.swift
//  PrototypeTwo
//
//  Created by Natalie Peters on 3/23/17.
//  Copyright © 2017 Natalie Peters. All rights reserved.
//

import UIKit

class CommentTableViewController: UITableViewController {
    
    var runs = ["General", "Alice Avenue \u{25CF}", "Bluebell \u{25A0}", "Easy Street \u{25CF}", "Figure 8 Gully \u{25C6} \u{25C6}", "Figure 8 Gully \u{25C6}", "Lazy Susan \u{25C6} \u{25C6}", "Lower Mini Miners \u{25CF}", "Thunder Alley \u{25C6} \u{25C6}", "Tiny Tiger \u{25C6} \u{25C6}", "To Baby Thunder Chair \u{25CF}", "Center of Gravity \u{25C6}", "Fields of Glory \u{25C6}", "High Baldy Traverse \u{25C6}", "High Ridge \u{25C6}", "Thanks for the Memories \u{25C6}", "Venus Line \u{25C6}", "West Baldy \u{25C6}", "Blackjack Traverse \u{25C6} \u{25C6}", "Lightning Tree Gully \u{25C6} \u{25C6}", "Who Cares \u{25C6} \u{25C6}", "Whodunnit \u{25A0}", "Blackjack Gully \u{25C6} \u{25C6}", "Condo Bypass\u{25C6} \u{25C6}", "Gun Towers \u{25C6}", "Shot \u{25C6}", "The Keyhole \u{25C6}", "Westward Ho (From Alta) \u{25C6} \u{25C6}", "Chickadee \u{25CF}", "Chickadee Chutes \u{25CF}", "Barry Barry Steep \u{25C6}", "Binx's Bumper \u{25C6}", "Cirque Traverse \u{25C6} \u{25C6}", "Dalton's Draw \u{25C6} \u{25C6}", "Gad Chutes \u{25C6}", "Glen's \u{25C6} \u{25C6}", "Great Scott \u{25C6}", "Lower Cirque \u{25C6} \u{25C6}", "Middle Cirque \u{25C6} \u{25C6}", "Restaurant Roll \u{25C6}", "Upper Cirque \u{25C6}", "Upper Mach Schnell \u{25C6}", "Wilbere Bowl \u{25C6}", "Wilma's \u{25C6}", "Bananas \u{25A0}", "Bass Below \u{25A0}", "Black Forest \u{25C6} \u{25C6}", "Election \u{25A0}", "Gad 2 Touring Gate \u{25C6}", "Gad Gully \u{25C6} \u{25C6}", "Gadzooks \u{25C6} \u{25C6}", "Lower Bassackwards \u{25A0}", "Organ Grinder \u{25C6} \u{25C6}", "S.T.H \u{25C6} \u{25C6}", "Tricep \u{25C6} \u{25C6}", "Upper Bassackwards \u{25A0}", "Carbonate \u{25C6}", "Madam Annie's \u{25A0}", "Sneaky Pete \u{25C6} \u{25C6}", "Upper Mini Miner's Camp \u{25CF}", "West 2nd South Onramp \u{25CF}", "Come From Behind Gully \u{25C6} \u{25C6}", "Goblin Gully \u{25C6} \u{25C6}", "Hoop's \u{25C6} \u{25C6}", "Knucklehead Traverse \u{25C6} \u{25C6}", "Last Choice \u{25C6} \u{25C6}", "Mark Malu \u{25C6}", "Old Ladies \u{25C6}", "Rasta Chutes \u{25C6} \u{25C6}", "Road to Provo \u{25C6}", "Shireen \u{25C6} \u{25C6}", "Shot 41 \u{25C6} \u{25C6}", "49er Gully \u{25C6} \u{25C6}", "Bassa10va \u{25A0}", "Bird's Nest \u{25CF}", "Blue By You \u{25C6} \u{25C6}", "Chamonix Bowl \u{25C6} \u{25C6}", "Chamonix Chutes \u{25C6}", "Claim Jumper \u{25CF}", "Double Down \u{25C6} \u{25C6}", "Fossil Chutes \u{25C6}", "High Stakes \u{25C6} \u{25C6}", "Limber Pines \u{25C6}", "Livin' The Dream \u{25C6}", "Lone Star \u{25C6} \u{25C6}", "Luckey Boy \u{25CF}", "Lupine Loop \u{25CF}", "Nash Flora Lode \u{25C6} \u{25C6}", "10t Quite Corn \u{25C6} \u{25C6}", "Path to Paradise \u{25C6} \u{25C6}", "Silver Dipper \u{25C6} \u{25C6}", "Ski Patrol Gully \u{25C6} \u{25C6}", "Cliff Access \u{25A0}", "Adager \u{25C6} \u{25C6}", "Anderson's Hill \u{25C6} \u{25C6}", "Chip's Access \u{25A0}", "Chip's Bypass \u{25A0}", "Chip's Face \u{25C6} \u{25C6}", "Chip's Run \u{25A0}", "Hot Foot Gully \u{25C6} \u{25C6}", "Hot Lips Gully \u{25A0}", "Hubba Bubba,1,10,No,2 \u{25A0}", "Lower Chip's \u{25CF}", "Lower Primrose Path \u{25C6} \u{25C6}", "Lower Silver Fox \u{25C6} \u{25C6}", "Middle Chip's Run \u{25A0}", "Oh My God \u{25C6} \u{25C6}", "Phone Shot \u{25C6} \u{25C6}", "Rothman Way \u{25C6} \u{25C6}", "Route Gully \u{25C6} \u{25C6}", "Upper Primrose Path \u{25C6} \u{25C6}", "Upper Silver Fox \u{25C6}", "Willows \u{25C6} \u{25C6}", "Bookmark Gully \u{25C6} \u{25C6}", "Junior's Powder Paradise \u{25C6}", "White Diamonds \u{25C6} \u{25C6}", "Alimony Chutes \u{25C6}", "Altar Bowl \u{25C6}", "Bookends Bowl \u{25C6}", "Bookends Traverse \u{25C6} \u{25C6}", "Richie's Run \u{25C6}", "The Endoras \u{25C6}", "Conrad \u{25C6}", "Defiance Ledge \u{25C6}", "Delores \u{25C6}", "Exit Gully \u{25C6}", "Figure 8 Bowl \u{25C6}", "High Saddle Traverse \u{25C6}", "Low Saddle \u{25C6}", "Mo \u{25C6}", "Mushroom Land \u{25C6}", "Shot \u{25C6}", "Thunder Bowl \u{25C6}", "White Rabbit \u{25C6}", "Gad 2 Return \u{25C6} \u{25C6}", "Lower Tiger Tail \u{25C6} \u{25C6}", "Mozza Bowl \u{25C6} \u{25C6}", "Pearly Gates \u{25C6} \u{25C6}", "Red Lens Line \u{25C6}", "S.O.B. \u{25C6} \u{25C6}", "Ted's Bowl \u{25C6} \u{25C6}", "Temptation Chutes \u{25C6} \u{25C6}", "Upper Tiger Tail \u{25C6} \u{25C6}"]
    
    let testRatingArray = [1, 2, 3, 4, 5]
    
    var commentArray = [String]()
    var commentID = [Int]()
    var timeList = [Int]()
    var userID = [Int]()
    var username = [String]()
    var ratingList = [Int]()
    var runIDList = [Int]()
    var timeStrings = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        self.refreshControl?.addTarget(self, action: #selector(CommentTableViewController.handleRefresh(_:)), for: UIControlEvents.valueChanged)
        self.loadCommentData()
    }
    func loadCommentData(){
        let url:String = "http://localhost:9000/comment?resortID=1"
        let urlRequest = URL(string: url)
        
        URLSession.shared.dataTask(with: urlRequest!, completionHandler: {
            (data, response, error) in
            if (error != nil) {
                print(error.debugDescription)
            }else{
                do{
                    let jArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                        as! NSDictionary as Dictionary
                    if let dic = jArray as? [String : AnyObject]{
                        if let nestedArray = dic["body"] as? Array<Dictionary<String, AnyObject>>{
                            for comment in nestedArray{
                                self.commentID.append((comment["commentID"] as? Int)!)
                                self.commentArray.append((comment["comment"] as? String)!)
                                self.userID.append((comment["userID"] as? Int)!)
                                self.ratingList.append((comment["rating"] as? Int)!)
                                self.timeList.append((comment["commentTime"] as? Int)!)
                                self.runIDList.append((comment["runID"] as? Int)!)
                            }
                            //print("commentID")
                            //print(self.commentID)
                            //print("commentArray")
                            //print(self.commentArray)
                            //print("ratingList")
                            //print(self.ratingList)
                            //print("timeList")
                            //print(self.timeList)
                            //print("userID")
                            //print(self.userID)
                            self.getTimeFormatted(time: self.timeList)
                            self.getUserName(idArray: self.userID)
                        }
                    }
                    self.tableView.reloadData()
                    
                }catch let error as NSError{
                    print(error)
                }
            }
            
        }).resume()
    }
    func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.loadCommentData()
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func getTimeFormatted(time: [Int]){
        for time in timeList{
            let newTime = time/1000
            let myFormatter = DateFormatter()
            myFormatter.dateFormat = "MMM dd, yyyy' at 'h:mm a"
            self.timeStrings.append(myFormatter.string(from: NSDate(timeIntervalSince1970: TimeInterval(newTime)) as Date))
        }
        
    }
    
    func getUserName(idArray: [Int]){
        for userIDnumber in self.userID {
            
            let userIDString = String(userIDnumber)
            let url:String = "http://localhost:9000/lookupusername?userID="+userIDString
            let urlRequest = URL(string: url)
            
            URLSession.shared.dataTask(with: urlRequest!, completionHandler: {
                (data, response, error) in
                if (error != nil) {
                    print(error.debugDescription)
                }else{
                    do{
                        let jArray = try JSONSerialization.jsonObject(with: data!, options: .allowFragments)
                            as! NSDictionary as Dictionary
                        if let dic = jArray as? [String : AnyObject]{
                            if let userNameFromID = dic["body"] as? String {
                                self.username.append(userNameFromID)
                            }
                        }
                        
                    }catch let error as NSError{
                        print(error)
                    }
                }
                
            }).resume()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CommentTableViewCell
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 100
        
        // Configure the cell...
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.cellComment.text = self.commentArray[indexPath.row]
        cell.cellComment.numberOfLines = 0
        cell.cellComment.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.cellTime.text = self.timeStrings[indexPath.row]
        cell.cellTime.numberOfLines = 0
        cell.cellTime.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.cellTime.textColor = UIColor(red:0.41, green:0.46, blue:0.65, alpha:1.0)
        if (self.username.count >= 10) {
            cell.cellUserName.text = self.username[indexPath.row]
        }
        cell.cellUserName.numberOfLines = 0
        cell.cellUserName.lineBreakMode = NSLineBreakMode.byWordWrapping
        cell.cellUserName.textColor = UIColor(red:0.02, green:0.15, blue:0.62, alpha:1.0)
        cell.cellRating.settings.updateOnTouch = false
        cell.cellRating.text = runs[self.runIDList[indexPath.row]]
        cell.update(self.ratingList[indexPath.row])
        return cell
    }
    
}
