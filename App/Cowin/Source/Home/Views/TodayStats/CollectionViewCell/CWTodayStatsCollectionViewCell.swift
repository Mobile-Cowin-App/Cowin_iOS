//
//  CWTodayStatsCollectionViewCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 23/05/21.
//

import UIKit
import HelperKit

class CWTodayStatsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var layerView: UIView!
    @IBOutlet var percentage: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var count: UILabel!
    
    private let animativelayer = CAShapeLayer()
    private let baselayer = CAShapeLayer()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
        
        self.title.applyTextAttributes(font: .teritary(.semibold), withColor: .primary)
        self.count.applyTextAttributes(font: .secondary(.regular), withColor: .secondary)
        
        self.percentage.applyTextAttributes(font: .primary(.bold), withColor: .primary)
    }

    func setData(with model: CWHomeTodayStatsData) {
        
        self.title.text = model.gender
        self.count.text = (model.count?.toInt())?.convertDelimiterFormat()
        
        let percent = model.count.safelyUnwrap / model.totalVaccinated.safelyUnwrap
        self.percentage.text = "\(round(percent * 100).toInt()) %"
        
        DispatchQueue.main.async {
            self.drawLayer(with: model.color)
            self.animateLayer(value: percent.toCGFloat())
        }
    }
}

extension CWTodayStatsCollectionViewCell {

    func drawLayer(with color: UIColor) {
        // MARK: - Empty state color
        self.layerView.drawAppleHealth(self.baselayer, withRadius: self.layerView.frame.width * 0.45, strokeColor: color.withAlphaComponent(0.1).cgColor, lineWidth: 8.0)

        // MARK: - Data Render time color
        self.layerView.drawAppleHealth(self.animativelayer, withRadius: self.layerView.frame.width * 0.45, strokeColor: color.cgColor, lineWidth: 8.0)

        self.layerView.layer.addSublayer(self.baselayer)
    }

    private func animateLayer(value: CGFloat) {
        self.layerView.animateAppleHealth(for: self.animativelayer, fromValue: 0, toValue: value)
    }
}
