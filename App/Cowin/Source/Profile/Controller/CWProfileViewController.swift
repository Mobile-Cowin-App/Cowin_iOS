//
//  CWProfileViewController.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWProfileViewController: AnyObject {
	var router: ICWProfileRouter? { get set }
    func benificiaryModel(model: CWBeneficiaryListModel?)
}

class CWProfileViewController: UIViewController {
	var interactor: ICWProfileInteractor?
	var router: ICWProfileRouter?

    @IBOutlet var listview: UITableView!
    @IBOutlet var listHolderView: UIView!
    
    
    var listmodel: CWBeneficiaryListModel? = nil
    
    
	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        prepareNavigationBar()
        prepareTableViewCell()
        verificationCompleted()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    fileprivate func prepareNavigationBar() {
        self.title = "PROFILE"
        self.view.backgroundColor = .white
        self.listview.backgroundColor = .clear
        self.listHolderView.backgroundColor = CWStyle.Static.appTheme
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.listHolderView.addShadow(offset: CGSize.init(width: 3, height: 3), color: CWStyle.Static.appTheme, radius: 20.0, opacity: 0.35)
        self.listHolderView.layer.cornerRadius = 50
        self.navigationController?.view.backgroundColor = .white
    }
    
    fileprivate func registerCell() {
        self.listview.register(UINib(nibName: "CWMembersDataCell", bundle: nil), forCellReuseIdentifier: "CWMembersDataCell")
        self.listview.register(UINib(nibName: "CWLoginEmptyDataCell", bundle: nil), forCellReuseIdentifier: "CWLoginEmptyDataCell")
    }
    
    fileprivate func prepareTableViewCell() {
        self.listview.dataSource = self
        self.listview.delegate = self
        self.listview.showsVerticalScrollIndicator = false
        self.registerCell()
    }
    
    @IBAction func addMemberAction() {
        self.router?.navigateToAddMemberScreen()
    }
}

extension CWProfileViewController: ICWProfileViewController {
	// do someting...
    func benificiaryModel(model: CWBeneficiaryListModel?) {
        self.listmodel = model
        self.listview.reloadData()
    }
    
}

extension CWProfileViewController: UITableViewDataSource , UITableViewDelegate {
	
    func numberOfSections(in tableView: UITableView) -> Int {
        return CWUtility.authTocken.isEmpty ? 1 : self.listmodel?.beneficiaries.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if CWUtility.authTocken.isEmpty || self.listmodel == nil{
            return self.prepareLoginEmptyDataCell(tableView, cellForRowAt: indexPath)
        } else {
            return self.prepareMemberDataCell(tableView, cellForRowAt: indexPath)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.listmodel == nil {return 500}
        return CWUtility.authTocken.isEmpty ? 500 : UITableView.automaticDimension
    }
}

extension CWProfileViewController {
    
    fileprivate func prepareLoginEmptyDataCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CWLoginEmptyDataCell") as! CWLoginEmptyDataCell
        cell.backgroundColor = .white
        cell.loginCB = {
            self.navigateToLoginpage()
        }
        return cell
    }
    
    fileprivate func prepareMemberDataCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CWMembersDataCell") as! CWMembersDataCell
        cell.backgroundColor = .white
        if let model = self.listmodel?.beneficiaries[indexPath.section] {
            cell.setData(name: model.name, yob: model.birthYear, proof: model.photoIDNumber , prooftype: model.photoIDType)
            
            cell.removeTappedCB = {
                self.interactor?.triggerRemoveMember(memberID: model.beneficiaryReferenceID, onCompletion: { isCompleted in
                    self.listmodel?.beneficiaries.remove(at: indexPath.section)
                    self.listview.performBatchUpdates {
                        self.listview.reloadData()
                    } completion: { _ in
                        
                    }
                })
            }
        }
        
        
        
        return cell
    }
    
    fileprivate func navigateToLoginpage(){
        let controller = OTPLoginConfiguration.setup()
        controller.modalPresentationStyle = .overFullScreen
        controller.hero.isEnabled = true
        controller.delegate = self
        self.hero.isEnabled = true
        controller.hero.modalAnimationType = .cover(direction: .down)
        self.present(controller, animated: true, completion: nil)
    }
    
}

extension CWProfileViewController: OTPVerificationDelegate {
    
    func verificationCompleted() {
        if CWUtility.authTocken.isEmpty {return}
        self.interactor?.triggerMembersList(auth: CWUtility.authTocken)
    }
    
    
}
