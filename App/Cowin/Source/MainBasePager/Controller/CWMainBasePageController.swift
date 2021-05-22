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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.dataSource = self
        
        self.controllers = [ self.preparHomeViewController(),
                     self.prepareStatsViewController(),
                     self.prepareBookingViewController(),
                     self.prepareProfileViewController() ]
        
        self.scrollView?.delegate = self
        self.scrollView?.isDirectionalLockEnabled = true
        self.scrollView?.panGestureRecognizer.maximumNumberOfTouches = 1

        self.pushtoVC(index: 0, forwardNav: true, animate: false)
    }
    
    func pushtoVC(index:Int, forwardNav: Bool, animate: Bool) {
        guard let viewControllers = [self.viewControllerAtIndex(index)] as? [UIViewController] else { return }
        
        if forwardNav {
            self.setViewControllers(viewControllers, direction: .forward, animated: animate, completion: {done in })
        }
        else {
            self.setViewControllers(viewControllers, direction: .reverse, animated: animate, completion: {done in })
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
        controller.view.backgroundColor = .red
        return controller
    }
    
    func prepareStatsViewController() -> UIViewController {
        let controller = CWStatsConfiguration.setup()
        controller.view.backgroundColor = .orange
        return controller
    }
    
    func prepareBookingViewController() -> UIViewController {
        let controller = CWBookingConfiguration.setup()
        controller.view.backgroundColor = .yellow
        return controller
    }
    
    func prepareProfileViewController() -> UIViewController {
        let controller = CWProfileConfiguration.setup()
        controller.view.backgroundColor = .blue
        return controller
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

private extension UIPageViewController {

    var scrollView: UIScrollView? {

        return view.subviews.filter { $0 is UIScrollView }.first as? UIScrollView
    }
}
