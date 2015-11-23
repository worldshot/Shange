//
//  ViewController.swift
//  Shange
//
//  Created by Gal Blank on 10/22/15.
//  Copyright © 2015 Gal Blank. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout,WalkVCControllerDelegate, UITableViewDataSource,UITableViewDelegate {

    var chainsTable: UITableView!
    
    var collectionView: UICollectionView!
    
    var imagesArray: NSMutableArray!
    let authView = AuthViewController()
    
    let walkthrough = WalkthroughViewController()

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBarHidden = true
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor();
        
     
        chainsTable = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150), style: UITableViewStyle.Plain)
        chainsTable.delegate = self
        chainsTable.dataSource = self
        self.view.addSubview(chainsTable)
        chainsTable.scrollToRowAtIndexPath(NSIndexPath(forRow: 4, inSection: 0), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        //chainsTable.scrollToRowAtIndexPath(NSIndexPath(forRow: 20, inSection: 0), atScrollPosition: UITableViewScrollPosition.Bottom, animated: true)
        
        let layout:CHTCollectionViewWaterfallLayout = CHTCollectionViewWaterfallLayout()
        
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        //layout.itemSize = CGSize(width: self.view.frame.size.width / 2 - 10, height: 120)
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 150, width: self.view.frame.size.width, height: self.view.frame.size.height - 150), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.delegate = self
        collectionView.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.alwaysBounceVertical = true
        // Add the waterfall layout to your collection view
        collectionView.collectionViewLayout = layout
        collectionView.autoresizingMask = [UIViewAutoresizing.FlexibleHeight,UIViewAutoresizing.FlexibleWidth]
        collectionView.alwaysBounceVertical = true
        self.view.addSubview(collectionView)
        
        imagesArray = ["http://lorempixel.com/400/200","http://lorempixel.com/g/400/200","http://lorempixel.com/400/200/nightlife/5","http://lorempixel.com/400/200/sports/1","http://lorempixel.com/400/200/sports/2","http://lorempixel.com/400/200/sports/3","http://lorempixel.com/400/200/nightlife/4","http://lorempixel.com/400/200/sports/5","http://lorempixel.com/400/200/sports/6","http://lorempixel.com/400/200/sports/7","http://lorempixel.com/400/200/sports/10","http://lorempixel.com/400/200/sports/8","http://lorempixel.com/400/200/sports/9","http://lorempixel.com/400/200/sports/Dummy-Text","http://lorempixel.com/400/200/sports/1/Dummy-Text","http://lorempixel.com/400/200/nightlife/3","http://lorempixel.com/400/200/nightlife/1","http://lorempixel.com/400/200/nightlife/2"]
        collectionView.reloadData()
        
        //authView.delegate = self
        walkthrough.delegate = self
      
        self.navigationController!.presentViewController(walkthrough, animated: true, completion: { () -> Void in
            
        })
    }
    
    func unloadScreen()
    {
        walkthrough.dismissViewControllerAnimated(true) { () -> Void in
            self.navigationController!.presentViewController(self.authView, animated: true, completion: { () -> Void in
                
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let url = imagesArray.objectAtIndex(indexPath.row) as! String
        cell.backgroundColor = UIColor.clearColor()
        cell.layer.borderColor = UIColor.lightGrayColor().CGColor
        cell.layer.borderWidth = 1.0
        cell.contentView.frame = cell.bounds
        cell.contentView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        let fullUrl:NSURL = NSURL(string: url)!
        cell.imageView.layer.masksToBounds = true;
        cell.imageView.setImageWithURL(fullUrl)
        cell.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        return cell
    }
    
    
    func collectionView(_collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let height = Int.random(100...200)
        let size = CGSizeMake(self.view.frame.size.width / 2 - 10, CGFloat(height))
        return size
    }
    
    

//////////////////TABLEVIEW DELEGATE///////////////////
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
       
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier")
        
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "reuseIdentifier")
            cell.backgroundColor = UIColor.whiteColor()
            
        }
        cell.textLabel?.textAlignment = NSTextAlignment.Center
       cell.textLabel?.text = "MAIN CHAIN"
    
        
        return cell
    }
    
}

