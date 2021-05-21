//
//  CWOnboardViewController.swift
//  Cowin
//
//  Created by Aravindhan Natarajan on 21/05/21.


import UIKit

protocol ICWOnboardViewController: AnyObject {
	var router: ICWOnboardRouter? { get set }
}

class CWOnboardViewController: UIViewController {
	var interactor: ICWOnboardInteractor?
	var router: ICWOnboardRouter?

    
    @IBOutlet var otpField: UITextField!
    
    var tranxID: String = ""
	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
        
        self.view.backgroundColor = .secondarySystemBackground
        
//        self.prepareOTP()
        self.reportAPI()
    }
    
    @IBAction func otpTaped() {
        self.validateOTP()
    }
    
}

extension CWOnboardViewController: ICWOnboardViewController {
	// do someting...
}

extension CWOnboardViewController {
    
    fileprivate func prepareOTP() {
        CWNetworkManager.requester.triggerGenerateOTP(mobile: "8883311311") { otpModel, errorDesc in
            self.tranxID = otpModel?.txnID ?? ""
            print(self.tranxID)

        }
    }
    
    fileprivate func validateOTP() {
        CWNetworkManager.requester.triggerValidateOTP(txnID: self.tranxID, otpValue: otpField.text ?? "") { otpModel, errorDesc in
            print(otpModel?.token ?? "")
        }
    }
    
    fileprivate func reportAPI() {
        CWNetworkManager.requester.triggerStatsReport(stateID: "", districtID: "", date: "") { statsModel, errorDesc in
             
        }
    }
    
}

extension CWOnboardViewController {
	// do someting...
}
