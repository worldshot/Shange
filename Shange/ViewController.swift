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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor();
        
        let layout:CHTCollectionViewWaterfallLayout = CHTCollectionViewWaterfallLayout()
        
        // Change individual layout attributes for the spacing between cells
        layout.minimumColumnSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        //layout.itemSize = CGSize(width: self.view.frame.size.width / 2 - 10, height: 120)
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.yellowColor()
        collectionView.delegate = self
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.alwaysBounceVertical = true
        // Add the waterfall layout to your collection view
        collectionView.collectionViewLayout = layout
        collectionView.autoresizingMask = [UIViewAutoresizing.FlexibleHeight,UIViewAutoresizing.FlexibleWidth]
        collectionView.alwaysBounceVertical = true
        self.view.addSubview(collectionView)
        
        /*
        http://lorempixel.com/400/200 to get a random picture of 400 x 200 pixels
        http://lorempixel.com/g/400/200 to get a random gray picture of 400 x 200 pixels
        http://lorempixel.com/400/200/sports to get a random picture of the sports category
        http://lorempixel.com/400/200/sports/1 to get picture no. 1/10 from the sports category
        http://lorempixel.com/400/200/sports/Dummy-Text with a custom text on the random Picture
        http://lorempixel.com/400/200/sports/1/Dummy-Text
    */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 14
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.lightGrayColor()
        cell.layer.borderColor = UIColor.redColor().CGColor
        cell.layer.borderWidth = 1.0
        cell.contentView.frame = cell.bounds
        cell.contentView.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleHeight]
        return cell
    }
    
    func collectionView(_collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        let height = Int.random(100...200)
        let size = CGSizeMake(self.view.frame.size.width / 2 - 10, CGFloat(height))
        print(size)
        return size
    }
}

