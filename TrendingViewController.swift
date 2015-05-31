//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by Patrick Weiss on 5/28/15.
//  Copyright (c) 2015 Patrick Weiss. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var trendingFeedImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.contentSize = trendingFeedImageView.image!.size
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
