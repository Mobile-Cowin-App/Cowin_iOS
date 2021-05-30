//
//  CWSlotDataCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 29/05/21.
//

import UIKit
import CWNetworkSDK

class CWSlotDataCell: UITableViewCell {
    
    @IBOutlet var holderview: UIView!
    @IBOutlet var name: UILabel!
    @IBOutlet var feetype: UILabel!
    @IBOutlet var feetypeHolder: UIView!
    @IBOutlet var address: UILabel!
    @IBOutlet var pincode: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    private var datasource: [CWSlotData] = .defaultValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
        self.prepareCollectionView()
    }
    
    private func prepareStyles() {
        
        self.name.applyTextAttributes(font: .primary(.semibold), withColor: .primary)
        self.address.applyTextAttributes(font: .secondary(.regular), withColor: .secondary)
        self.pincode.applyTextAttributes(font: .secondary(.regular), withColor: .secondary)
        
        self.holderview.backgroundColor = CWStyle.Background.primary
        self.holderview.applyHomeCellBorderRadius()
        
        self.feetypeHolder.backgroundColor = CWStyle.Static.appTheme
        self.feetypeHolder.layer.cornerRadius = 6.0
        self.feetype.applyTextAttributes(font: .teritary(.bold), withColor: .custom)
        self.feetype.textColor = .white
        self.feetypeHolder.isHidden = true
    }
    
    func prepareCollectionView() {
        self.collectionView.register(UINib(nibName: "CWSlotDataCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CWSlotDataCollectionViewCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setData(with model: Center) {
        
        self.name.text = model.name
        self.address.text = "\(model.address), \(model.districtName), \(model.stateName)"
        self.pincode.text = model.pincode.toString()
        
        self.feetype.text = "localize.paid".localized
        self.feetypeHolder.isHidden = model.feeType == "localize.paid".localized
        
        self.generateDataSource(with: model)
    }
    
    private func generateDataSource(with model: Center) {
        
        self.datasource = model.sessions?.map({
            CWSlotData(vaccine: $0.vaccine, minAgeLimit: $0.minAgeLimit, availableCapacity: $0.availableCapacity)
        }) ?? .defaultValue
        
        if self.datasource.isNotEmpty {
            self.collectionView.reloadData()
        }
    }
}

extension CWSlotDataCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CWSlotDataCollectionViewCell", for: indexPath) as! CWSlotDataCollectionViewCell
        
        cell.setData(with: self.datasource[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3), height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
}
