//
//  CWOnboardPageViewController.swift
//  Cowin
//


import Foundation
import UIKit
import HelperKit

public protocol CWOnboardDelegate {
    func didChangeController(at index: Int)
}

class CWOnboardPageViewController: UIPageViewController {
    
    let pageControl = UIPageControl()
    
    var onboardDelegate: CWOnboardDelegate? = nil
    
    let controllers = [createChildController( index: 0) ,
                       createChildController(index: 1) ,
                       createChildController(index: 2),
                       createChildController(index: 3)]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.prepareDataSourceAndDelegate()
        
        self.prepareScrollView()
        
        self.preparePageControl()
        
        if let firstViewController = controllers.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    
}

// MARK: - DataSource
extension CWOnboardPageViewController: UIPageViewControllerDataSource  , UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewIndex = controllers.firstIndex(of: viewController) else { return nil }
        
        if (viewIndex == 0) || (viewIndex == NSNotFound) { return nil }
        let index = viewIndex - 1
        return viewControllerAtIndex(index)
    }
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewIndex = controllers.firstIndex(of: viewController) else { return nil }
        
        let index = viewIndex + 1
        if index == self.controllers.count { return nil }
        return viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard finished, let currentPageController = pageViewController.viewControllers?.last as? CWOnboardChildViewController , let index = self.controllers.firstIndex(of: currentPageController) else {
            return
        }
        
        
        self.onboardDelegate?.didChangeController(at: index)
    }
    
    func presentationCount(for _: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndex(for _: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
              let firstViewControllerIndex = controllers.firstIndex(of: firstViewController) else {
            return 0
        }
        
        
        return firstViewControllerIndex
    }
    
}

//MARK:- UTILS
extension CWOnboardPageViewController {
    
    fileprivate func prepareDataSourceAndDelegate() {
        dataSource = self
        delegate = self
    }
    
    fileprivate func prepareScrollView() {
        self.scrollView?.isDirectionalLockEnabled = true
        self.scrollView?.panGestureRecognizer.maximumNumberOfTouches = 1
    }
    
    fileprivate func preparePageControl() {
        var pc: UIPageControl = UIPageControl()
        pc = UIPageControl.appearance(whenContainedInInstancesOf: [CWOnboardPageViewController.self])
        pc.isHidden = true
    }
    
    
    fileprivate static func createChildController(index: Int) -> UIViewController {
        let controller = CWUtility.getController("OnBoard", "CWOnboardChildViewController", type: CWOnboardChildViewController.self)
        controller.index = index
        return controller
    }
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        // Create a new view controller and pass suitable data.
        if self.controllers.isEmpty || (index >= self.controllers.count) {
            return nil
        }
        return controllers[index]
    }
    
}
