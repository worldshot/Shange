//
//  WalkthroughViewController.swift
//  Shange
//
//  Created by Gal Blank on 11/21/15.
//  Copyright © 2015 Gal Blank. All rights reserved.
//

import UIKit
import WebKit

protocol WalkVCControllerDelegate {
    func unloadScreen()
}

class WalkthroughViewController: UIViewController {

    var webView:WKWebView!
    var signUpButton:UIButton!
    
    var delegate: WalkVCControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height - 50))

        let url = NSURL(string: "http://www.cnn.com")
        webView.loadRequest(NSURLRequest(URL: url!))
        self.view.addSubview(webView)
        
        signUpButton = UIButton(type: UIButtonType.Custom)
        signUpButton.frame = CGRect(x: 0, y: self.view.frame.size.height - 50, width: self.view.frame.size.width, height: 50)
        signUpButton.setTitle("Sign Up", forState: UIControlState.Normal)
        signUpButton.addTarget(self, action:"unloadScreen" , forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(signUpButton)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func unloadScreen(){
        if(delegate != nil){
            delegate?.unloadScreen()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
