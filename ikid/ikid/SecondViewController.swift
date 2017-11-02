//
//  SecondViewController.swift
//  ikid
//
//  Created by zichu zheng on 10/31/17.
//  Copyright © 2017 zichu zheng. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    fileprivate var firstViewController : SecondViewController!
    fileprivate var secondViewController : SecondViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    fileprivate func firstBuilder() {
        if firstViewController == nil {
            firstViewController =
                storyboard?.instantiateViewController(withIdentifier: "secondJoke") as! SecondViewController
        }
    }
    
    fileprivate func secondBuilder() {
        if secondViewController == nil {
            secondViewController =
                storyboard?.instantiateViewController(withIdentifier: "secondPunchline") as! SecondViewController!
        }
    }
    
    @IBAction func switchViews(sender: AnyObject) {
        secondBuilder()
        firstBuilder()
        
        if firstViewController != nil && firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController.view.frame = view.frame
            switchViewController(firstViewController, to: secondViewController)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(secondViewController, to: firstViewController)
        }
    }
    
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }

}

