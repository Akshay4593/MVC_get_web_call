//
//  ViewController.swift
//  AkshayTask(Viraat)
//
//  Created by Akshay Shedge on 23/09/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var articleDetails: [ArticleDetails]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUI()
        webCall()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    private func setUI(){
        
        title = "Home"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
        tableView.separatorStyle = .none
        
    }
    
    private func webCall(){
        
        showSpinner(onView: self.view)
        Request(country: Params.country.value, apiKey: Params.apiKey.value).response(completion: {
            (result) in
            
            switch result {
            case .success(let response):
                
                self.removeSpinner()
                guard let articleDetails = response.articles else {
                    return
                }
                self.articleDetails = articleDetails
                self.tableView.reloadData()
                break
            
            case .failure(let error):
                self.removeSpinner()
                print("Error ==>> \(error.localizedDescription)")
                self.show(message: error.localizedDescription)
                
                break
                
            }
        })
        
    }

}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleDetails?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListingTVCell", for: indexPath) as! ListingTVCell
        
        if let articleDetail = articleDetails?[indexPath.row] {
            cell.setData(articleDetail: articleDetail)
        }
        return cell
    }
    
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let articleDetails = self.articleDetails?[indexPath.row] {
            let viewController = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
            viewController.articleDetail = articleDetails
            self.navigationController?.pushViewController(viewController, animated: true)
            
        }
        
    }
    
}
