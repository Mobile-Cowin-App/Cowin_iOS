//
//  CWNewsViewController.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 26/05/21.
//

import UIKit
import CWNetworkSDK

protocol ICWNewsViewController: AnyObject {
    var router: ICWNewsRouter? { get set }
    
    func success()
    func failure()
}

class CWNewsViewController: UIViewController {
    var interactor: ICWNewsInteractor?
    var router: ICWNewsRouter?
    
    @IBOutlet var topHolderView: UIView!
    @IBOutlet var titleHolderView: UIView!
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        self.prepareStyles()
        self.prepareViews()
        self.registerXib()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.interactor?.fetchNews(for: CWUtility.today)
    }
    
    private func prepareViews() {
        let headerview: CWTopNavigationView = .loadFromXib()
        headerview.setValue(title: "title.news".localized)
        
        headerview.iconClicked = {[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        
        self.titleHolderView.addSubview(headerview)
        headerview.g_pinEdges()
    }
    
    private func prepareStyles() {
        
        self.view.backgroundColor = CWStyle.Background.secondary
        self.tableView.backgroundColor = .clear
        
        self.topHolderView.backgroundColor = CWStyle.Background.primary
//        self.topHolderView.applyHomeTopViewBorderRadius()
        
        self.tableView.separatorInset = .zero
        self.tableView.separatorStyle = .singleLine
        self.tableView.separatorColor = CWStyle.Border.primary
    }
    
    private func registerXib() {
        
        ["CWNewsListViewCell"].forEach({
            self.tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        })
    }
}

extension CWNewsViewController: ICWNewsViewController {
    // do someting...
    
    func success() {
        self.tableView.reloadData()
    }
    
    func failure() {
        
    }
}

extension CWNewsViewController: UITableViewDelegate, UITableViewDataSource {
    // do someting...
    
    func getDataSource() -> [Article]? {
        return self.interactor?.datasource
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getDataSource()?.count ?? .defaultValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.getDataSource() else { return UITableViewCell() }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CWNewsListViewCell", for: indexPath) as! CWNewsListViewCell
        
        cell.setData(with: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
