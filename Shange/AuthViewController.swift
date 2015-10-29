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
    
    var emailTF:UITextField!
    var passTF:UITextField!
    var passAgainTF:UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tableRect = CGRect(x: (self.view.frame.size.width - 300)/2, y: (self.view.frame.size.height - 240) / 2, width: 300, height: 240)
        tableView = UITableView(frame: tableRect, style: UITableViewStyle.Plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor.clearColor()
        //tableView.scrollEnabled  = false
        tableView.tableHeaderView = nil
        tableView.tableFooterView = nil
        tableView.backgroundView = nil
        tableView.layer.cornerRadius = 10.0
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
        return 4
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
            cell.textLabel?.text = NSLocalizedString("EMail:", comment: "")
            emailTF = UITextField(frame: CGRect(x: 0,y: 0,width: 200,height: cell.frame.size.height))
            emailTF.backgroundColor = UIColor.clearColor()
            emailTF.font = UIFont(name: "HelveticaNeue", size: 14)
            emailTF.layer.borderWidth = 0.5
            emailTF.layer.borderColor = UIColor.lightGrayColor().CGColor
            emailTF.layer.cornerRadius = 10.0
            cell.accessoryView = emailTF
        }
        else if(indexPath.row == 1){
            cell.textLabel?.text = NSLocalizedString("Password:", comment: "")
            passTF = UITextField(frame: CGRect(x: 0,y: 0,width: 200,height: cell.frame.size.height))
            passTF.backgroundColor = UIColor.clearColor()
            passTF.font = UIFont(name: "HelveticaNeue", size: 14)
            passTF.secureTextEntry = true
            passTF.layer.borderWidth = 0.5
            passTF.layer.borderColor = UIColor.lightGrayColor().CGColor
            passTF.layer.cornerRadius = 10.0
            cell.accessoryView = passTF
        }
        else if(indexPath.row == 2){
            cell.textLabel?.text = NSLocalizedString("Retype:", comment: "")
            passAgainTF = UITextField(frame: CGRect(x: 0,y: 0,width: 200,height: cell.frame.size.height))
            passAgainTF.backgroundColor = UIColor.clearColor()
            passAgainTF.font = UIFont(name: "HelveticaNeue", size: 14)
            passAgainTF.layer.borderWidth = 0.5
            passAgainTF.secureTextEntry = true
            passAgainTF.layer.borderColor = UIColor.lightGrayColor().CGColor
            passAgainTF.layer.cornerRadius = 10.0
            cell.accessoryView = passAgainTF
        }
        else if(indexPath.row == 3){
            cell.textLabel?.textAlignment = NSTextAlignment.Center
            cell.textLabel?.text = NSLocalizedString("SIGN IN", comment: "")
        }
        
        return cell
    }

}
