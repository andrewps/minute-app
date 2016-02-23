//
//  ArticleViewController.swift
//  TheMinute
//
//  Created by Andrew Sass on 2/10/16.
//  Copyright © 2016 Andrew Sass. All rights reserved.
//

import UIKit
import WYInteractiveTransitions
import SafariServices

class ArticleViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var articleBottom: UIView!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var articleHeader: UIView!
    @IBOutlet weak var articleTitle: UILabel!
    
    @IBOutlet weak var articleMeta: UIView!
    
    @IBOutlet weak var articleBody: UIView!
    @IBOutlet weak var articleBodyText: UITextView!
    
    @IBOutlet weak var articleFooter: UIView!
    @IBOutlet weak var articleFooterButton: UIButton!
    
    
    
    @IBAction func closeArticle(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        articleFooterButton.layer.cornerRadius = 20
        articleFooterButton.layer.masksToBounds = true
        
        
        let topBorder: CALayer = CALayer()
        topBorder.frame = CGRectMake(0.0, 0.0, articleBottom.frame.size.width, 1.0)
        topBorder.backgroundColor = minPurple.CGColor
        articleBottom.layer.addSublayer(topBorder)
        
        let bottomBorder: CALayer = CALayer()
//        bottomBorder.frame = CGRectMake(0.0, 1.0, articleMeta.frame.size.width, 1.0)
        bottomBorder.frame = CGRectMake(0.0, 49.0, articleMeta.frame.size.width, 1.0)
        bottomBorder.backgroundColor = CGColorCreateCopyWithAlpha(minPurple.CGColor, 0.1)
        articleMeta.layer.addSublayer(bottomBorder)
        
        
        shareButton.imageEdgeInsets = UIEdgeInsetsMake(0, 65, 0, 0);
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // Open Safari Webview
    private var urlString:String = "https://andrewsass.com"
    
    @IBAction func articleFooterButton(sender: AnyObject) {
        // Open Safari ViewController iOS9 ONLY
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!)
        self.presentViewController(svc, animated: true, completion: nil)
    }
    
    

    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func shareButton(sender: UIButton) {
        displayShareSheet(articleTitle.text!)
    }
    
    func displayShareSheet(shareContent:String) {
        let activityViewController = UIActivityViewController(activityItems: [shareContent as NSString], applicationActivities: nil)
        presentViewController(activityViewController, animated: true, completion: {})
    }
    
}


