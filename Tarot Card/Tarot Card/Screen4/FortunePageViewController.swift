//
//  FortunePageViewController.swift
//  Tarot Card
//
//  Created by Nicole Beilis on 4/27/20.
//  Copyright © 2020 nickelogic. All rights reserved.
//

import UIKit

class FortunePageViewController: UIViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    @IBOutlet weak var contentView: UIView!
    
    var currentViewControllerIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageViewController()
    }
    
    func configurePageViewController() {
        
        guard let pageViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: CustomPageViewController.self)) as? CustomPageViewController else {
            return
        }
        
        pageViewController.delegate = self
        pageViewController.dataSource = self
        
        addChild(pageViewController)
        pageViewController.didMove(toParent: self)
        
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(pageViewController.view)
        
        let views: [String: Any] = ["pageView": pageViewController.view as Any]
        
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))


        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        
        guard let startingViewController = fortuneViewControllerAt(index: currentViewControllerIndex) else {
            return
        }
        
        pageViewController.setViewControllers([startingViewController], direction: UIPageViewController.NavigationDirection.forward , animated: true, completion: nil)
    }
    
    func fortuneViewControllerAt(index: Int) -> FortuneViewController? {
        
        if index > 3 || index < 1 {
            return nil
        }
        
        guard let fortuneViewController = storyboard?.instantiateViewController(withIdentifier: String(describing: FortuneViewController.self)) as?
            FortuneViewController else {
                return nil
        }
        fortuneViewController.curIndex = index
        
        return fortuneViewController
      }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return currentViewControllerIndex
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return 3
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let fortuneViewController = viewController as? FortuneViewController
        
        guard var currentIndex = fortuneViewController?.curIndex else {
            return nil
        }
        
        currentViewControllerIndex = currentIndex
        
        if currentIndex == 0 {
            return nil
        }
        
        currentIndex -= 1
        
        return fortuneViewControllerAt(index: currentIndex)
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let fortuneViewController = viewController as? FortuneViewController
        
        guard var currentIndex = fortuneViewController?.curIndex else {
            return nil
        }
        
        currentIndex += 1
        
        if currentIndex == 3 {
            return nil
        }
        
        currentViewControllerIndex = currentIndex
        
        return fortuneViewControllerAt(index: currentIndex)
    }
    
}
