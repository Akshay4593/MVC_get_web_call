//
//  ListingTVCell.swift
//  AkshayTask(Viraat)
//
//  Created by Akshay Shedge on 24/09/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit
import Kingfisher

class ListingTVCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        imgView?.image = UIImage(contentsOfFile: "ic_news_placeholder")
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(articleDetail: ArticleDetails){
        
        if let title = articleDetail.title {
            self.titleLbl.text = title
        }
        
        if let date = articleDetail.publishedAt {
            self.dateLbl.text = "Published on : \(date)"
        }
        
        if let imageUrl = URL(string: articleDetail.urlToImage ?? "") {
            self.imgView.kf.setImage(with: imageUrl)
        }

    }

}
