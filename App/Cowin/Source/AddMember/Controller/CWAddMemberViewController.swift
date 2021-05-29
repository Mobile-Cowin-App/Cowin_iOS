//
//  CWAddMemberViewController.swift
//  Cowin
//


import UIKit
import CWNetworkSDK

protocol ICWAddMemberViewController: AnyObject {
    var router: ICWAddMemberRouter? { get set }
    func resultOfAddMember(model: CWBAddMembertModel?)
}

class CWAddMemberViewController: UIViewController {
    var interactor: ICWAddMemberInteractor?
    var router: ICWAddMemberRouter?
    
    @IBOutlet var listview: UITableView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var closeButton: UIButton!
    @IBOutlet var descLabel: UILabel!
    
    var selectedProofIndex: Int? = nil
    
    var proofs = ["Aadhaar Card" ,
                  "Driving License" ,
                  "PAN Card" ,
                  "Passport" ,
                  "Pension Passbook" ,
                  "NPR Smart Card" ,
                  "Voter ID"]
    
    var requestModel: CWAddMemberRequester = CWAddMemberRequester(name: "", idNumber: "", idType: 0, gender: 0, birthYear: "", auth: CWUtility.authTocken)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        self.title = "Register for Vaccination"
        self.titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        self.titleLabel.textColor = .white
        
        self.listview.backgroundColor = .clear
        self.view.backgroundColor = UIColor.systemBlue
        
        self.closeButton.layer.cornerRadius = closeButton.frame.height / 2
        self.closeButton.backgroundColor = .white
        self.closeButton.titleLabel?.font = UIFont.getIconFont(with: 14)
        self.closeButton.setTitle(CWFonts.close.icon, for: .normal)
        self.closeButton.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.black.withAlphaComponent(0.5), radius: 2.0, opacity: 0.35)
        
        
        prepareListView()
    }
    
    fileprivate func prepareListView(){
        self.listview.layer.cornerRadius = 20
        self.listview.dataSource = self
        self.listview.delegate = self
        self.listview.showsVerticalScrollIndicator = false
        self.listview.register(UINib(nibName: "CWAddMemberCell", bundle: nil), forCellReuseIdentifier: "CWAddMemberCell")
        self.listview.register(UINib(nibName: "CWSubmitCell", bundle: nil), forCellReuseIdentifier: "CWSubmitCell")
        self.listview.register(UINib(nibName: "CWGenderCell", bundle: nil), forCellReuseIdentifier: "CWGenderCell")
        
    }
    
    @IBAction func dismissTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CWAddMemberViewController: ICWAddMemberViewController {
    func resultOfAddMember(model: CWBAddMembertModel?) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension CWAddMemberViewController: UITableViewDelegate , UITableViewDataSource {
    // do someting...
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 5 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CWSubmitCell") as!  CWSubmitCell
            cell.addTapped = {
                self.interactor?.triggerAddMember(model: self.requestModel)
            }
            return cell
            
        } else if indexPath.section == 4 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CWGenderCell") as!  CWGenderCell
            cell.genderCB = { index in
                self.requestModel.gender = index
            }
            return cell
            
        } else {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CWAddMemberCell") as! CWAddMemberCell
            cell.isShowDropDown = indexPath.section == .zero
            
            switch indexPath.section {
            case 0:
                let value = self.selectedProofIndex == nil ? "Select Your Proof" : proofs[self.selectedProofIndex ?? 0]
                cell.setDropDownTitle(value: value)
                
                cell.dropDowntapped = {
                    self.showActionSheet()
                }
                break
            case 1:
                let value = self.selectedProofIndex == nil ? "Enter Proof Number" : "Enter \(proofs[self.selectedProofIndex ?? 0]) Number"
                
                cell.setPlaceHolderText(value: value)
                
                cell.contentDidChange = { newValue in
                    self.requestModel.idNumber = newValue
                }
                
                break
            case 2:
                let value = self.selectedProofIndex == nil ? "Enter You Name" : "Enter \(proofs[self.selectedProofIndex ?? 0]) of Your Proper Name"
                cell.setPlaceHolderText(value: value)
                
                cell.contentDidChange = { newValue in
                    self.requestModel.name = newValue
                }
                break
            case 3:
                let value = self.selectedProofIndex == nil ? "Enter Year Of Birth" : "Enter \(proofs[self.selectedProofIndex ?? 0]) of Your Year of Birth"
                
                cell.setPlaceHolderText(value: value)
                
                cell.contentDidChange = { newValue in
                    self.requestModel.birthYear = newValue
                }
                break
            default:
                break
            }
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 5 {return 60}
        else if indexPath.section == 4 {return 120}
        return 80
    }
}

extension CWAddMemberViewController {
    func showActionSheet() {
        let alert = UIAlertController(title: "Photo ID Proof", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        proofs.enumerated().forEach { index , titlevalue in
            alert.addAction(UIAlertAction(title: titlevalue, style: .default , handler:{ (UIAlertAction)in
                self.requestModel.idType = index + 1
                self.selectedProofIndex = index
                self.listview.performBatchUpdates {
                    self.listview.reloadData()
                } completion: { _ in
                    
                }
            }))
        }
        
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
