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
    
    var composeModalIsPresenting: Bool = true
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var composeViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    
    var showingHome: Bool!
    var currentView: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("HomeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("SearchViewController") as! UIViewController
        composeViewController = storyboard.instantiateViewControllerWithIdentifier("ComposeViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("AccountViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("TrendingViewController") as! UIViewController

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
    

    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        composeModalIsPresenting = true
        println("presenting Compose modal")
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        composeModalIsPresenting = false
        println("time to dismiss modal")
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (composeModalIsPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 1
            transitionContext.completeTransition(true)

        } else {
                fromViewController.view.alpha = 0
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            
        }
    }

    
}

