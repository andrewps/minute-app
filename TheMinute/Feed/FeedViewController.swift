//
//  FeedViewController.swift
//  TheMinute
//
//  Created by Andrew Sass on 2/10/16.
//  Copyright © 2016 Andrew Sass. All rights reserved.
//

import UIKit
import WYInteractiveTransitions

class FeedViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var nav: UIView!
    @IBOutlet weak var FeedCollectionView: UICollectionView!
    @IBOutlet weak var FeedFlow: UICollectionViewFlowLayout!
    
    let refreshControl = UIRefreshControl()
    
    let reuseIdentifier = "Feed Cell"
    var items: [String] = [
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
        "Secret Documents: NSA Targeted Germany And EU Buildings",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        // # MARK: Pull To Refresh
        refreshControl.addTarget(self, action: "refresh", forControlEvents: .ValueChanged)
        FeedCollectionView.addSubview(refreshControl)
        FeedCollectionView.alwaysBounceVertical = true
        refreshControl .endRefreshing()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // # MARK: Define cells
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FeedCollectionViewCell
        
        cell.feedTitle.text = self.items[indexPath.item]
        
        // Image blend modes
        if let img = UIImage(named: "sample-article-image"), img2 = UIImage(named: "half-tone") {
            let rect = CGRect(x: 0, y: 0, width: img.size.width, height: img.size.height)
            
            UIGraphicsBeginImageContextWithOptions(img.size, true, 0)
            
            img.drawInRect(rect, blendMode: .Normal, alpha: 1)
            img2.drawInRect(rect, blendMode: .Multiply, alpha: 1)
            
            // grab the finished image and return it
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            cell.feedHalfTone?.image = result
            
        }
        
        return cell
        
    }
    
    
    
    // # MARK: Cell size and properties
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        return CGSize(width: screenWidth/1, height: 180.0);
    }
    
    
    // # MARK: Tap Cell, Custom Segues
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("segueToArticle", sender: nil)
    }
    
    let transitionMgr = WYInteractiveTransitions()
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "segueToArticle"  {
            let toView = segue.destinationViewController
            let duration = 0.5
            transitionMgr.configureTransition(duration, toViewController: toView, handGestureEnable: true, transitionType: WYTransitoinType.Up)
        }
    }
    
}
