//
//  CWOnboardPageViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 22/05/21.
//

import Foundation
import UIKit
import HelperKit

public protocol CWOnboardDelegate {
    func didChangeController(at index: Int)
}

class CWOnboardPageViewController: UIPageViewController {
    fileprivate var items: [UIViewController] = []
    let pageControl = UIPageControl()

    var onboardDelegate: CWOnboardDelegate? = nil
    
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
    
    fileprivate func createCarouselItemControler(index: Int) -> UIViewController {
        let controller = CWUtility.getController("OnBoard", "CWOnboardChildViewController", type: CWOnboardChildViewController.self)
        controller.index = index
       return controller
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
        
        self.onboardDelegate?.didChangeController(at: firstViewControllerIndex)
        return firstViewControllerIndex
    }
     
}
