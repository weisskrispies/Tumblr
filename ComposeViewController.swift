//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Patrick Weiss on 5/28/15.
//  Copyright (c) 2015 Patrick Weiss. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textButton: UIButton!
    @IBOutlet weak var photoButton: UIButton!
    @IBOutlet weak var quoteButton: UIButton!
    @IBOutlet weak var linkButton: UIButton!
    @IBOutlet weak var chatButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    var textButtonStartingPosition: CGPoint!
    var photoButtonStartingPosition: CGPoint!
    var quoteButtonStartingPosition: CGPoint!
    var linkButtonStartingPosition: CGPoint!
    var chatButtonStartingPosition: CGPoint!
    var videoButtonStartingPosition: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textButtonStartingPosition = textButton.center
        photoButtonStartingPosition = photoButton.center
        quoteButtonStartingPosition = quoteButton.center
        linkButtonStartingPosition = linkButton.center
        chatButtonStartingPosition = chatButton.center
        videoButtonStartingPosition = videoButton.center

        
        
        composeButtonsAnimateIn()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func composeButtonsAnimateIn() {

        UIView.animateWithDuration(0.6, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.textButton.center.y = 203
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                self.photoButton.center.y = 203
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.quoteButton.center.y = 203
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.linkButton.center.y = 340
            }, completion: nil)
        UIView.animateWithDuration(0.6, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.chatButton.center.y = 340
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.videoButton.center.y = 340
            }, completion: nil)

    }

    @IBAction func onDismissButtonTap(sender: UIButton) {
        composeButtonsAnimateOut()
    }

    func composeButtonsAnimateOut() {
        
        UIView.animateWithDuration(0.6, delay: 0.3, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.textButton.center = self.textButtonStartingPosition
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: nil, animations: { () -> Void in
                self.photoButton.center = self.photoButtonStartingPosition
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0.2, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.2, options: nil, animations: { () -> Void in
                self.quoteButton.center = self.quoteButtonStartingPosition
            }, completion: nil)
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.linkButton.center = self.linkButtonStartingPosition
            }, completion: nil)
        UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
                self.chatButton.center = self.chatButtonStartingPosition
            }, completion: nil)
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.0, options: nil, animations: { () -> Void in
            self.videoButton.center = self.videoButtonStartingPosition
            }, completion: nil)
    }
    
}
