//
//  CWHomeNewsCollectionViewCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 25/05/21.
//

import UIKit
import CWNetworkSDK
import HelperKit

class CWHomeNewsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var holderview: UIView!
    @IBOutlet var imageview: UIImageView!
    @IBOutlet var title: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
        self.holderview.applyHomeCellBorderRadius()
        self.holderview.applyDropShadow()
        self.holderview.backgroundColor = CWStyle.Background.primary
        
        self.title.applyTextAttributes(font: .primary(.bold), withColor: .primary)
        self.time.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        self.author.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        self.imageview.applyHomeCellBorderRadius()
    }
    
    func setData(with model: Article) {
     
        DispatchQueue.global(qos: .background).async {
            do {
                if let url = model.urlToImage, let imageUrl = URL(string: url) {
                    let data = try Data(contentsOf: imageUrl)
                    
                    DispatchQueue.main.async {
                        self.imageview.image = UIImage(data: data)
                    }
                }
            } catch {
                print("Image set Error\(error)")
            }
        }
        
        self.title.text = model.title
                
        let authorName = model.author.safelyUnwrap.isEmpty ? "localize.unknown".localized: model.author.safelyUnwrap
        self.author.text = "news.author.name".localized.replacingOccurrences(of: "$authorname$", with: authorName)
        
        self.time.text = model.publishedAt.convert("hh:mm a, EEEE, MMM d, yyyy")
    }
}
