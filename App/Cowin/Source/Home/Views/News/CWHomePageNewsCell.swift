//
//  CWHomePageNewsCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 25/05/21.
//

import UIKit
import CWNetworkSDK

class CWHomePageNewsCell: UITableViewCell {

    @IBOutlet var holderview: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var title: UILabel!
        
    var router: ICWHomeRouter?
    lazy var tapGesture: UITapGestureRecognizer = {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(gestureAction(_:)))
        gesture.numberOfTapsRequired = 1
        return gesture
    }()
    
    private let limit = 5
    private var datasource: [Article] = .defaultValue

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
        self.prepareCollectionView()
    }
    
    private func prepareStyles() {
        self.backgroundColor = .clear
        
        self.title.applyTextAttributes(font: .primary(.heavy), withColor: .primary)
        self.title.text = "localize.title.breakingNews".localized
    }
    
    func prepareCollectionView() {
        self.collectionView.register(UINib(nibName: "CWHomeNewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CWHomeNewsCollectionViewCell")
        self.collectionView.register(UINib(nibName: "CWHomePageNewsSeeMoreView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "CWHomePageNewsSeeMoreView")

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false

    }
    
    func setData(with model: CWFeedsModel?) {
        
        if let article = model?.articles {
            self.datasource = article
            self.collectionView.reloadData()
        }
    }
}


extension CWHomePageNewsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(self.limit, self.datasource.count)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CWHomeNewsCollectionViewCell", for: indexPath) as! CWHomeNewsCollectionViewCell
        
        cell.setData(with: self.datasource[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 1.5), height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return self.datasource.count > self.limit ? CGSize(width: (collectionView.frame.width / 2.5), height: collectionView.frame.height): .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = self.datasource[indexPath.row]
        if model.url.isNotEmpty {
            self.router?.navigateNewsDetail(url: model.url)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {

        case UICollectionView.elementKindSectionFooter:
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CWHomePageNewsSeeMoreView", for: indexPath) as! CWHomePageNewsSeeMoreView
            
            footerView.isUserInteractionEnabled = true
            footerView.addGestureRecognizer(tapGesture)
            tapGesture.removeTarget(self, action: #selector(gestureAction(_:)))
            tapGesture.addTarget(self, action: #selector(gestureAction(_:)))
            
            return footerView

        default:
            return UICollectionReusableView(frame: CGRect.zero)
        }
    }
    
    @objc func gestureAction(_ gesture: UITapGestureRecognizer) {
        self.router?.navigateNewsList()
    }
}
