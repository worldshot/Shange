//
//  AuthViewController.swift
//  Shange
//
//  Created by Gal Blank on 10/28/15.
//  Copyright © 2015 Gal Blank. All rights reserved.
//

import UIKit

protocol AuthViewControllerDelegate {
    func unloadAuthScreen()
}



class AuthViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    
    var delegate: AuthViewControllerDelegate?
    var phoneNumber:UITextField!
    var emailTF:UITextField!
    var passTF:UITextField!
    var passAgainTF:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let tableRect = CGRect(x: (self.view.frame.size.width - 300)/2, y: (self.view.frame.size.height - 240) / 2, width: 300, height: 240)
        tableView = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None
        tableView.backgroundColor = UIColor.whiteColor()
        //tableView.scrollEnabled  = false
        tableView.tableHeaderView = nil
        tableView.tableFooterView = nil
        tableView.backgroundView = nil
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        if(indexPath.row == 3)
        {
            if(delegate != nil){
                delegate?.unloadAuthScreen()
            }
        }
    }
    
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")

        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
            cell.backgroundColor = UIColor.whiteColor()
            
        }
        
        if(indexPath.row == 0){
            cell.textLabel?.text = NSLocalizedString("Country:", comment: "")
            emailTF = UITextField(frame: CGRect(x: 0,y: 0,width: 200,height: cell.frame.size.height))
            emailTF.backgroundColor = UIColor.clearColor()
            emailTF.font = UIFont(name: "HelveticaNeue", size: 14)
            emailTF.layer.borderWidth = 0.5
            emailTF.layer.borderColor = UIColor.lightGrayColor().CGColor
            emailTF.layer.cornerRadius = 10.0
            cell.accessoryView = emailTF
        }
        else if(indexPath.row == 1){
            cell.textLabel?.text = NSLocalizedString("Phone Number:", comment: "")
            phoneNumber = UITextField(frame: CGRect(x: 0,y: 0,width: 200,height: cell.frame.size.height))
            phoneNumber.backgroundColor = UIColor.clearColor()
            phoneNumber.font = UIFont(name: "HelveticaNeue", size: 14)
            phoneNumber.secureTextEntry = true
            phoneNumber.layer.borderWidth = 0.5
            phoneNumber.layer.borderColor = UIColor.lightGrayColor().CGColor
            phoneNumber.layer.cornerRadius = 10.0
            cell.accessoryView = phoneNumber
        }
        else if(indexPath.row == 2){
            cell.textLabel?.textAlignment = NSTextAlignment.Center
            cell.textLabel?.text = NSLocalizedString("SIGN IN", comment: "")
        }
        
        return cell
    }

}
