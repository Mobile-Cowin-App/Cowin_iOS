//
//  CWMainBasePageController.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import Foundation
import UIKit

class CWMainBasePageController: UIPageViewController {
    
    var controllers: [UIViewController] = []
    
    lazy var pagingScrollDelegate: CWPagingViewScrollerDelegate? = nil
    private var scrollingFromTapAction: Bool = false
    private var scrollIndex: Int = 0
    internal var currentIndex: Int? {
        guard let viewController = viewControllers?.first else {
            return nil
        }
        return controllers.map{ $0 }.firstIndex(of: viewController)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = self
        self.delegate = self
        self.view.backgroundColor = .clear
        
        self.controllers = [ self.preparHomeViewController(),
                     self.prepareStatsViewController(),
                     self.prepareBookingViewController(),
                     self.prepareProfileViewController() ]
        
        self.scrollView?.delegate = self
        self.scrollView?.isScrollEnabled = true
        self.scrollView?.showsHorizontalScrollIndicator = false
        self.scrollView?.isDirectionalLockEnabled = true
        self.scrollView?.panGestureRecognizer.maximumNumberOfTouches = 1

        if #available(iOS 13.0, *) {
            self.scrollView?.automaticallyAdjustsScrollIndicatorInsets = true
        }

        self.pushtoVC(index: 0, animate: false)
    }
    
    func pushtoVC(index:Int, animate: Bool) {
        guard let viewControllers = [self.viewControllerAtIndex(index)] as? [UIViewController] else { return }
        
        self.scrollingFromTapAction = true
        setViewControllers(viewControllers,
                           direction: (index > self.scrollIndex) ? .forward: .reverse ,
                           animated: animate ) { [weak self] (finished) in
                            guard let selfObject = self else { return }
                            
                            if let currentIndex = selfObject.currentIndex , currentIndex < selfObject.controllers.count {
                                selfObject.scrollIndex = currentIndex
                                selfObject.scrollingFromTapAction = false
                            }
        }
    }
    
    func viewControllerAtIndex(_ index: Int) -> UIViewController? {
        // Create a new view controller and pass suitable data.
        if self.controllers.isEmpty || (index >= self.controllers.count) {
            return nil
        }

        return controllers[index]
    }
}

fileprivate extension CWMainBasePageController {
    
    func preparHomeViewController() -> UIViewController {
        let controller = CWHomeConfiguration.setup()
        return controller
    }
    
    func prepareStatsViewController() -> UIViewController {
        let controller = CWStatsConfiguration.setup()
        return controller
    }
    
    func prepareBookingViewController() -> UIViewController {
        let controller = CWBookingConfiguration.setup()
        return controller
    }
    
    func prepareProfileViewController() -> UIViewController {
        let controller = CWProfileConfiguration.setup()
        return controller.appendWithNavigation()
    }
}

extension CWMainBasePageController: UIPageViewControllerDataSource {
    
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
}

extension CWMainBasePageController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let defaultContentOffsetX = scrollView.frame.width
        
        if (self.scrollIndex == 0 && scrollView.contentOffset.x < defaultContentOffsetX) || ((self.scrollIndex == controllers.count - 1) && scrollView.contentOffset.x > defaultContentOffsetX) || self.scrollingFromTapAction { return }

        guard scrollView.contentOffset.x != defaultContentOffsetX else { return }
        
        let offsetPercent = scrollView.contentOffset.x / scrollView.bounds.width
        var percent = 1.0 - offsetPercent
        let toItem = percent > 0 ? scrollIndex - 1 : scrollIndex + 1
        percent = abs(percent)
        
        if percent > 1 {
            percent = 1
        }
        
        guard toItem > -1 && toItem < controllers.count else {
            return
        }
        
        self.pagingScrollDelegate?.didChange(scrollIndex, toItem, percent)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // We've handled directionLock manually... It's for subcontrollers scrollable views..
        self.viewControllers?.forEach({ (controller) in
            controller.view.subviews.forEach({
                if let scollableView = $0 as? UIScrollView {
                    scollableView.isScrollEnabled = false
                }
            })
        })
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
       // We've handled directionLock manually... It's for subcontrollers scrollable views..
        self.viewControllers?.forEach({ (controller) in
            controller.view.subviews.forEach({
                if let scollableView = $0 as? UIScrollView {
                    scollableView.isScrollEnabled = true
                }
            })
        })
    }
}


extension CWMainBasePageController: UIPageViewControllerDelegate {

    public func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
    }

    public func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let currentIndex = currentIndex, completed {
            scrollIndex = currentIndex
            self.pagingScrollDelegate?.didFinish(self.scrollIndex)
        }
    }
}



