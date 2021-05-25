//
//  CWHomePageBannerCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 23/05/21.
//

import UIKit

class CWHomePageBannerCell: UITableViewCell {

    @IBOutlet var holderview: UIView!
    @IBOutlet var collectionView: UICollectionView!
    
    private var datasource: [String] = .defaultValue

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
        self.prepareData()
        self.prepareCollectionView()
    }
    
    private func prepareData() {
        
    }
    
    private func prepareStyles() {
        self.backgroundColor = .clear
        
        self.holderview.backgroundColor = .clear
    }
    
    func prepareCollectionView() {
        self.collectionView.register(UINib(nibName: "CWHomeBannerCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CWHomeBannerCollectionViewCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false

    }
    
    func setData(with model: [String]) {
        
        self.datasource = model
        self.collectionView.reloadData()
    }
}


extension CWHomePageBannerCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CWHomeBannerCollectionViewCell", for: indexPath) as! CWHomeBannerCollectionViewCell
        
        cell.setData(with: self.datasource[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 30.0), height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8.0, bottom: 0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
