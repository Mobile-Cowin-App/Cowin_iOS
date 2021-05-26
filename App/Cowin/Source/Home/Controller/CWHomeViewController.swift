//
//  CWHomeViewController.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWHomeViewController: AnyObject {
	var router: ICWHomeRouter? { get set }
    
    func success()
    func failure()
}

class CWHomeViewController: UIViewController {
	var interactor: ICWHomeInteractor?
	var router: ICWHomeRouter?
    
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
        
        self.interactor?.fetchStats(for: CWUtility.today)
    }
    
    private func prepareViews() {
        let headerview: CWMainPageTitleView = .loadFromXib()
        headerview.setValue(title: "title.home".localized, icon: CWFonts.notification)
        
        self.titleHolderView.addSubview(headerview)
        headerview.g_pinEdges()
    }
    
    private func prepareStyles() {
        
        self.view.backgroundColor = .clear
        self.tableView.backgroundColor = .clear
        
        self.topHolderView.backgroundColor = CWStyle.Background.primary
        self.topHolderView.applyHomeTopViewBorderRadius()
    }
    
    private func registerXib() {
        
        ["CWHomePageTodayStatsCell", "CWHomePageVaccinatedCell", "CWHomePageBannerCell", "CWHomePageNewsCell"].forEach({
            self.tableView.register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0)
        })
    }
}

extension CWHomeViewController: ICWHomeViewController {
	// do someting...
    
    func success() {
        self.tableView.reloadData()
    }
    
    func failure() {
        
    }
}

extension CWHomeViewController: UITableViewDelegate, UITableViewDataSource {
	// do someting...
    
    func getDataSource() -> [CWHomePageDataSource]? {
        return self.interactor?.datasource
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.getDataSource()?.count ?? .defaultValue
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch self.getDataSource()?[indexPath.row] {
        
        case .TodayStatsModel(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CWHomePageTodayStatsCell", for: indexPath) as! CWHomePageTodayStatsCell
            cell.setData(with: model)
            
            cell.refreshTapped = {[weak self] in
                self?.interactor?.fetchStats(for: CWUtility.today)
            }
            
            return cell
            
        case .VaccinatedStatus(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CWHomePageVaccinatedCell", for: indexPath) as! CWHomePageVaccinatedCell
            cell.setData(with: model)
            return cell

        case .Banner(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CWHomePageBannerCell", for: indexPath) as! CWHomePageBannerCell
            cell.setData(with: model)
            return cell
            
        case .News(let model):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CWHomePageNewsCell", for: indexPath) as! CWHomePageNewsCell
            cell.router = self.router
            cell.setData(with: model)
            return cell

            
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.getDataSource()?[indexPath.row] {
        
        case .TodayStatsModel( _):
            return 400
            
        case .VaccinatedStatus( _):
            return 120
            
        case .Banner( _):
            return 200
            
        case .News( _):
            return 340
            
        default:
            break
        }
        
        return .defaultValue
    }
}
