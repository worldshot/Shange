//
//  ViewController.swift
//  Shange
//
//  Created by Gal Blank on 10/22/15.
//  Copyright © 2015 Gal Blank. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource,CHTCollectionViewDelegateWaterfallLayout {

    var collectionView: UICollectionView!
    
    var imagesArray: NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor();
        
        let layout:CHTCollectionViewWaterfallLayout = CHTCollectionViewWaterfallLayout()
        
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        //layout.itemSize = CGSize(width: self.view.frame.size.width / 2 - 10, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
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
        cell.imageView.contentMode = UIViewContentMode.ScaleAspectFill
        cell.imageView.setImageWithURL(fullUrl)
        cell.imageView.setNeedsDisplay()
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
}

