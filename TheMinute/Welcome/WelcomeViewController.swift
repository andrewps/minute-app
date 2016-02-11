//
//  WelcomeViewController.swift
//  TheMinute
//
//  Created by Andrew Sass on 2/10/16.
//  Copyright © 2016 Andrew Sass. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIPageViewControllerDataSource {
    
    @IBOutlet weak var coolButton: UIButton!
    
    var pageViewController: UIPageViewController!
    var pageTitles: NSArray!
    var pageImages: NSArray!
    // var pageBackgrounds: NSAttributedString!
    @IBOutlet weak var minuteLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pageTitles = NSArray(objects:
            "We find the best non-English news stories daily",
            "Then we translate it and TL;DR",
            "Share articles and see the original source"
        )
        self.pageImages = NSArray(objects:
            "welcome 1",
            "welcome 1",
            "welcome 1"
        )
        
        self.pageViewController = self.storyboard?.instantiateViewControllerWithIdentifier("PageViewController") as! UIPageViewController
        self.pageViewController.dataSource = self
        
        let startVC = self.viewControllerAtIndex(0) as WelcomeContentViewController
        let viewControllers = NSArray(object: startVC)
        
        pageViewController.setViewControllers(viewControllers as? [UIViewController], direction: .Forward, animated: true, completion: nil)
        
        self.pageViewController.view.frame = CGRectMake(0, 120, self.view.frame.width, self.view.frame.size.height - 200)
        
        self.addChildViewController(self.pageViewController)
        self.view.addSubview(self.pageViewController.view)
        self.pageViewController.didMoveToParentViewController(self)
        
        coolButton.layer.cornerRadius = 20
        coolButton.layer.masksToBounds = true
        
        // Change Logo Color
        let tintableImage = UIImage(named: "minute")!.imageWithRenderingMode(.AlwaysTemplate)
        
        minuteLogo.image = tintableImage
        minuteLogo.tintColor = minSeafoam
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func viewControllerAtIndex(index: Int) -> WelcomeContentViewController {
        if self.pageTitles.count == 0 || index >= self.pageTitles.count {
            return WelcomeContentViewController()
        }
        
        let vc: WelcomeContentViewController = self.storyboard?.instantiateViewControllerWithIdentifier("ContentViewController") as! WelcomeContentViewController
        
        vc.imageFile = self.pageImages[index] as! String
        vc.titleText = self.pageTitles[index] as! String
        vc.pageIndex = index
        
        return vc
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let vc = viewController as! WelcomeContentViewController
        var index = vc.pageIndex as Int
        
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index--
        return self.viewControllerAtIndex(index)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        let vc = viewController as! WelcomeContentViewController
        var index = vc.pageIndex as Int
        
        if index == NSNotFound {
            return nil
        }
        
        index++
        if index == self.pageTitles.count {
            return nil
        }
        
        return self.viewControllerAtIndex(index)
        
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return self.pageTitles.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
}
