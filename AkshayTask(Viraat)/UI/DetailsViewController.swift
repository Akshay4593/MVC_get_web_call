//
//  DetailsViewController.swift
//  AkshayTask(Viraat)
//
//  Created by Akshay Shedge on 24/09/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit
import Kingfisher

class DetailsViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    var articleDetail: ArticleDetails?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Details"
        imgView?.image = UIImage(contentsOfFile: "ic_news_placeholder")
        setData()

        
    }
    
     func setData(){
        
        if let newsTitle = articleDetail?.title {
            self.titleLbl.text = newsTitle
        }
        
        if let author = articleDetail?.author {
            self.authorLbl.text = "Author : \(author)"
        }
        
        if let date = articleDetail?.publishedAt {
            self.dateLbl.text = "Published on : \(date)"
        }
        
        if let content = articleDetail?.content {
            self.contentLbl.text = content
        }
        
        if let imageUrl = URL(string: articleDetail?.urlToImage ?? "") {
            self.imgView.kf.setImage(with: imageUrl)
        }
    }
    

}
