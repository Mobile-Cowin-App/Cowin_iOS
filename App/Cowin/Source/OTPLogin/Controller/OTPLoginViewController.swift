//
//  OTPLoginViewController.swift
//  Cowin
//


import UIKit
import Hero
import CWNetworkSDK

protocol IOTPLoginViewController: AnyObject {
    var router: IOTPLoginRouter? { get set }
    func triggerOTPResult(model: CWOTPRequestModel?)
    func triggerValidateOTPResult(model: CWOTPValidateModel?)
}

class OTPLoginViewController: UIViewController {
    var interactor: IOTPLoginInteractor?
    var router: IOTPLoginRouter?
    
    
    @IBOutlet var contentHolderView: UIView!
    @IBOutlet var loginButtonHolderView: UIView!
    @IBOutlet var phonenumberfield: UITextField!
    
    @IBOutlet var otpHolderView: UIView!
    @IBOutlet var otpfield: UITextField!
    
    var txnID: String = ""
    
    var activityLoader: UIActivityIndicatorView = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // do someting...
        
        self.prepareStyle()
    }
    
    fileprivate func prepaerLoader() {
        self.view.addSubview(activityLoader)
        activityLoader.g_pinEdges()
        activityLoader.hidesWhenStopped = true
    }
    
    fileprivate func startLoader() {
        DispatchQueue.main.async {
            self.activityLoader.startAnimating()
        }
    }
    
    fileprivate func stopLoader() {
        DispatchQueue.main.async {
            self.activityLoader.stopAnimating()
        }
    }
    
    @IBAction func backTapped() {
        self.hero.modalAnimationType = .zoomOut
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func getOTPTapped() {
        if self.otpHolderView.isHidden {
            if self.phonenumberfield.text?.isEmpty ?? true {return}
            self.interactor?.triggerOTP(mobile: phonenumberfield.text ?? "")
            self.otpHolderView.isHidden = false
            self.startLoader()
        } else {
            if self.otpfield.text?.isEmpty ?? true {return}
            self.interactor?.validateOTP(txnID: self.txnID, otp: otpfield.text ?? "")
            self.startLoader()
        }
    }
    
}

extension OTPLoginViewController: IOTPLoginViewController {
    func triggerOTPResult(model: CWOTPRequestModel?) {
        self.txnID = model?.txnID ?? ""
        self.stopLoader()
    }
    func triggerValidateOTPResult(model: CWOTPValidateModel?) {
        self.navigateToHomeScreen(auth: model?.token ?? "")
    }
}

extension OTPLoginViewController {
    // do someting...
    
    func navigateToHomeScreen(auth: String = "") {
        DispatchQueue.main.async {
            let controller = CWMainBaseControllerConfiguration.setup()
            controller.authTocken = auth
            controller.hero.isEnabled = true
            controller.hero.modalAnimationType = .zoom
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
        }
    }
    
}

//MARK:- KEYBOARD UIToolbar
extension OTPLoginViewController {
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: CWStringConstant.login.done.rawValue , style: .done, target: self, action: #selector(self.doneButtonAction))
        
        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()
        
        phonenumberfield.inputAccessoryView = doneToolbar
        otpfield.inputAccessoryView = doneToolbar
    }
    
    @objc func doneButtonAction(){
        phonenumberfield.resignFirstResponder()
        otpfield.resignFirstResponder()
    }
}
