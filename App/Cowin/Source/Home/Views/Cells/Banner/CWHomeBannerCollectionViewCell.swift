//
//  CWHomeBannerCollectionViewCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 24/05/21.
//

import UIKit

class CWHomeBannerCollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet var imageview: UIImageView!
    
    func setData(with url: String) {
        
        self.imageview.image = UIImage(named: url)
        
//        do {
//            if let imageUrl = URL(string: url) {
//                let data = try Data(contentsOf: imageUrl)
//                self.imageview.image = UIImage(data: data)
//            }
//        } catch {
//            print("Image set Error\(error)")
//        }
    }
}
