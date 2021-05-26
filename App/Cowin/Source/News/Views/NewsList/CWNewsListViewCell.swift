//
//  CWNewsListViewCell.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import UIKit
import CWNetworkSDK

class CWNewsListViewCell: UITableViewCell {

    @IBOutlet var holderview: UIView!
    @IBOutlet var sourcename: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var author: UILabel!
    
    @IBOutlet var imageholder: UIView!
    @IBOutlet var imageview: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.prepareStyles()
    }
    
    private func prepareStyles() {
        self.holderview.backgroundColor = CWStyle.Background.primary
        
        self.title.applyTextAttributes(font: .primary(.bold), withColor: .primary)
        self.time.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        self.sourcename.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        self.author.applyTextAttributes(font: .teritary(.regular), withColor: .teritary)
        
        self.imageholder.layer.cornerRadius = 15.0
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
        self.sourcename.text = model.source.name
        self.author.isHidden = (model.author.isNil) || ((model.author).safelyUnwrap.isEmpty)
        
        self.author.text = "By, \(model.author ?? "localize.unknown".localized)"
        self.time.text = model.publishedAt.convert("hh:mm a, EEEE, MMM d, yyyy")
    }
}
