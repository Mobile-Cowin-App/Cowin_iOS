//
//  CWMainBaseTabView.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 22/05/21.
//

import UIKit

class CWMainBaseTabView: UIView {

    @IBOutlet var collectionView: UICollectionView!
    private let identifier = "CWMainBaseTabViewCell"
    
    var selectedIndex: ((Int) -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.collectionView.register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
    
        DispatchQueue.main.async {
            
            self.collectionView.reloadData()
            self.prepareIndicatorHolder()
        }
    }
    
    func prepareIndicatorHolder() -> Void {
        let dividerHolderView = UIView(frame: CGRect(origin: CGPoint(x: 0.0, y: 0.0), size: self.getCellSize()))
        dividerHolderView.backgroundColor = .clear
        dividerHolderView.tag = 10
        self.collectionView.insertSubview(dividerHolderView, at: 0)

        let tabIndicator = UIView(frame: CGRect(x: 0, y: 0, width: 75, height: 40))
        tabIndicator.clipsToBounds = true
        tabIndicator.layer.cornerRadius = 20.0
        tabIndicator.center = dividerHolderView.center
        tabIndicator.backgroundColor = CWStyle.Static.appTheme?.withAlphaComponent(0.25)
        
        dividerHolderView.addSubview(tabIndicator)
        
        self.moveDivider(to: 0)
    }
    
    private func getCellSize() -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 40.0) / 4, height: 60.0)
    }
    
    private func getTabViewIndicator() -> UIView? {
        return self.collectionView.subviews.filter({ return $0.tag == 10}).first
    }
    
    func moveTab(fromIndex: Int, toIndex: Int, percent ratio: CGFloat) {

        guard let tabbarDivider = self.getTabViewIndicator(), let currentItem = self.collectionView.cellForItem(at: IndexPath(item: fromIndex, section: 0)), let nextItem = self.collectionView.cellForItem(at: IndexPath(item: toIndex, section: 0)) else { return }

        tabbarDivider.frame.origin.x = currentItem.frame.origin.x + ((nextItem.frame.origin.x - currentItem.frame.origin.x) * ratio)
    }

    func moveDivider(to index: Int) -> Void {
        guard let tabbarDivider = self.getTabViewIndicator() else { return }
        if let firstCell = self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) {
            let propertyAnimator = UIViewPropertyAnimator.init(duration: 0.3, dampingRatio: 0.85) {
                tabbarDivider.center.x = firstCell.center.x
            }
            propertyAnimator.startAnimation()
        }
    }

    func endedState(_ index: Int) -> Void {
        self.moveDivider(to: index)
        self.collectionView.scrollToItem(at: IndexPath(item: index, section: 0), at: .centeredHorizontally, animated: true)
    }
}


extension CWMainBaseTabView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CWMainBaseTabViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.getCellSize()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndex?(indexPath.item)
        self.moveDivider(to: indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
