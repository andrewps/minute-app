//
//  WelcomeContentViewController.swift
//  TheMinute
//
//  Created by Andrew Sass on 2/10/16.
//  Copyright © 2016 Andrew Sass. All rights reserved.
//

import UIKit

class WelcomeContentViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var pageIndex: Int!
    var titleText: String!
    var imageFile: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageView.image = UIImage(named: self.imageFile)
        self.titleLabel.text = self.titleText
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
