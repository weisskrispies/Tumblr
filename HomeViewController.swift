//
//  HomeViewController.swift
//  Tumblr
//
//  Created by Patrick Weiss on 5/28/15.
//  Copyright (c) 2015 Patrick Weiss. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var loadingSpinner: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        UIView.animateWithDuration(3, delay: 0, options: UIViewAnimationOptions.Repeat | UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
            self.loadingSpinner.transform = CGAffineTransformMakeRotation(CGFloat(60 * M_PI / 180))
        }, completion: nil)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
