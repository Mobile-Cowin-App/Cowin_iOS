//
//  CWSearchSlotViewController.swift
//  Cowin
//

import UIKit
import CWNetworkSDK

protocol ICWSearchSlotViewController: AnyObject {
	var router: ICWSearchSlotRouter? { get set }
    
    func success()
    func failure()
}

class CWSearchSlotViewController: UIViewController {
	var interactor: ICWSearchSlotInteractor?
	var router: ICWSearchSlotRouter?

    @IBOutlet var topHolderView: UIView!
    @IBOutlet var titleHolderView: UIView!
    @IBOutlet var tableView: UITableView!

    lazy var searchview: CWRegistrationSearchView = .loadFromXib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        
        self.prepareStyles()
        self.prepareViews()
        self.registerXib()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func prepareViews() {
        let headerview: CWMainPageTitleView = .loadFromXib()
        headerview.setValue(title: "title.registration".localized, icon: CWFonts.notification)

        headerview.iconClicked = {[weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
        
        self.titleHolderView.addSubview(headerview)
        headerview.g_pinEdges()
    }
    
    private func prepareStyles() {
                
        self.topHolderView.applyHomeTopViewBorderRadius()
    }
    
    private func registerXib() {
        
        ["CWSlotDataCell"].forEach({
            self.tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        })
    }
}

extension CWSearchSlotViewController: ICWSearchSlotViewController {
    // do someting...
    
    func success() {
        self.tableView.reloadData()
    }
    
    func failure() {
        
    }
}

extension CWSearchSlotViewController: UITableViewDelegate, UITableViewDataSource {
    // do someting...
    
    func getDataSource() -> [Center]? {
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CWSlotDataCell", for: indexPath) as! CWSlotDataCell
        
        cell.setData(with: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        searchview.interactor = self.interactor
        searchview.router = self.router
        
        return searchview
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
