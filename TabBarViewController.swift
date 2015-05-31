//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Patrick Weiss on 5/28/15.
//  Copyright (c) 2015 Patrick Weiss. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var dismissButtonView: UIButton!
    
    var composeModalIsPresenting: Bool = true
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var showingHome: Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! UIViewController

        dismissButtonView.alpha = 0

        homeViewController.view.frame = contentView.bounds
        contentView.addSubview(homeViewController.view)
        homeButton.selected = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onHomeButtonTap(sender: UIButton) {
        addChildViewController(homeViewController)
        homeViewController.view.frame = contentView.bounds
        contentView.addSubview(homeViewController.view)

        println("showing Home")
        self.showingHome = true

        sender.selected = true
        searchButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false

        homeViewController.didMoveToParentViewController(self)
    }
    
    @IBAction func onSearchButtonTap(sender: UIButton) {
        addChildViewController(searchViewController)
        searchViewController.view.frame = contentView.bounds
        contentView.addSubview(searchViewController.view)
        
        sender.selected = true
        homeButton.selected = false
        accountButton.selected = false
        trendingButton.selected = false
        
        println("showing Search")
        
        searchViewController.didMoveToParentViewController(self)
    }
    
    @IBAction func onComposeButtonTap(sender: UIButton) {
        addChildViewController(composeViewController)
        composeViewController.view.frame = contentView.bounds
        contentView.addSubview(composeViewController.view)
        
        composeViewController.view.alpha = 0
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.composeViewController.view.alpha = 1
            self.dismissButtonView.alpha = 1
        })
        sender.selected = true
        println("showing Compose")
        
        composeViewController.didMoveToParentViewController(self)
    }
    
    @IBAction func onAccountButtonTap(sender: UIButton) {
        addChildViewController(accountViewController)
        accountViewController.view.frame = contentView.bounds
        contentView.addSubview(accountViewController.view)

        sender.selected = true
        homeButton.selected = false
        searchButton.selected = false
        trendingButton.selected = false
        
        println("showing Account")
        accountViewController.didMoveToParentViewController(self)
    }
    
    @IBAction func onTrendingButtonTap(sender: UIButton) {
        addChildViewController(trendingViewController)
        trendingViewController.view.frame = contentView.bounds
        contentView.addSubview(trendingViewController.view)

        sender.selected = true
        homeButton.selected = false
        searchButton.selected = false
        accountButton.selected = false
        
        println("showing Trending")
        trendingViewController.didMoveToParentViewController(self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as! UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        
    }

    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        composeModalIsPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        composeModalIsPresenting = false
        return self
    }       

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        // TODO: animate the transition in Step 3 below
    }
    
}
