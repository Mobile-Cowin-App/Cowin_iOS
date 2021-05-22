//
//  CWOnboardPageViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit
import HelperKit

class CWOnboardPageViewController: UIPageViewController {
    fileprivate var items: [UIViewController] = []
    let pageControl = UIPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        let pc = UIPageControl.appearance(whenContainedInInstancesOf: [CWOnboardPageViewController.self])
        pc.currentPageIndicatorTintColor = .orange
        pc.pageIndicatorTintColor = .gray
        pc.isHidden = true
        
        populateItems()
        if let firstViewController = items.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
  
    
    fileprivate func populateItems() {
        items.append(contentsOf: [createCarouselItemControler( index: 0) ,
                                  createCarouselItemControler(index: 1) ,
                                  createCarouselItemControler(index: 2)])
    }
    
<<<<<<< HEAD
    fileprivate func createCarouselItemControler(index: Int) -> UIViewController {
        let controller = CWUtility.getController("Main", "CWOnboardChildViewController", type: CWOnboardChildViewController.self)
        controller.index = index
       return controller
=======
    fileprivate func createCarouselItemControler(with titleText: String?, with color: UIColor?) -> UIViewController {
        let c = UIViewController()
       
        let contentView = CWOnboardContentView.loadFromXib()
        contentView.backgroundColor = color
        c.view.addSubview(contentView)
        contentView.g_pinEdges()
        return c
>>>>>>> 804fa42a7ab00c0d6f7de01693dc282cc1d86514
    }
}

// MARK: - DataSource
extension CWOnboardPageViewController: UIPageViewControllerDataSource {
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return items.last
        }
        
        guard items.count > previousIndex else {
            return nil
        }
        
        return items[previousIndex]
    }
    
    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = items.firstIndex(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard items.count != nextIndex else {
            return items.first
        }
        
        guard items.count > nextIndex else {
            return nil
        }
        
        return items[nextIndex]
    }
    
    func presentationCount(for _: UIPageViewController) -> Int {
        return items.count
    }
    
    func presentationIndex(for _: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
              let firstViewControllerIndex = items.firstIndex(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
     
}
