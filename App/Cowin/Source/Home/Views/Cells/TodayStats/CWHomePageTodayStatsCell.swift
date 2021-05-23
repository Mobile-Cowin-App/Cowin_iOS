//
//  CWHomePageTodayStatsCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 23/05/21.
//

import UIKit

struct CWHomeTodayStatsData {
    
    var totalVaccinated: Double?
    
    var gender: String = .defaultValue
    var color: UIColor = .defaultValue
    var count: Double?
}

class CWHomePageTodayStatsCell: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var lastupdated: UILabel!
    
    @IBOutlet var totalHolderView: UIView!
    @IBOutlet var totalTitle: UILabel!
    @IBOutlet var totalCount: UILabel!
    
    @IBOutlet var refresh: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    
    private var datasource: [CWHomeTodayStatsData] = .defaultValue
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
        self.prepareCollectionView()
        self.prepareData()
    }
    
    private func prepareStyles() {
        self.backgroundColor = CWStyle.Background.primary
        
        self.title.applyTextAttributes(font: .primary(.bold), withColor: .primary)
        self.lastupdated.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        self.refresh.applyIconTextAttributes(fontSize: 10.0, withColor: .teritary)
        
        self.totalTitle.applyTextAttributes(font: .primary(.bold), withColor: .primary)
        self.totalCount.applyTextAttributes(font: .primary(.semibold), withColor: .secondary)

        self.totalHolderView.backgroundColor = .white
        self.totalHolderView.layer.cornerRadius = 5.0
                
        self.collectionView.backgroundColor = .white
        self.collectionView.layer.cornerRadius = 5.0
        
        [self.collectionView, self.totalHolderView].forEach({
            $0?.applyDropShadow()
        })
    }

    private func prepareData() {
        
        self.title.text = Date().convert("EEEE, MMM d, yyyy")
        self.refresh.text = "i"
        self.totalTitle.text = "Total Vaccination Doses"
    }
    
    func prepareCollectionView() {
        self.collectionView.register(UINib(nibName: "CWTodayStatsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CWTodayStatsCollectionViewCell")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.isScrollEnabled = true
        self.collectionView.showsHorizontalScrollIndicator = false

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(with model: CWHomeTodayVaccinationStats) {
        
        self.lastupdated.text = "Last updated, few mins ago"
        
        self.totalCount.text = (model.total?.toInt())?.toString()
        
        self.generateDataSource(with: model)
    }
    
    private func generateDataSource(with model: CWHomeTodayVaccinationStats) {
        
        self.datasource.append(CWHomeTodayStatsData(totalVaccinated: model.total, gender: "Male", color: CWStyle.Static.orange, count: model.male))
        
        self.datasource.append(CWHomeTodayStatsData(totalVaccinated: model.total, gender: "Female", color: CWStyle.Static.green, count: model.female))

        self.datasource.append(CWHomeTodayStatsData(totalVaccinated: model.total, gender: "Others", color: CWStyle.Static.blue, count: model.others))

    }
}

extension CWHomePageTodayStatsCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datasource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CWTodayStatsCollectionViewCell", for: indexPath) as! CWTodayStatsCollectionViewCell
        
        cell.setData(with: self.datasource[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3 - 10.0), height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }
}
