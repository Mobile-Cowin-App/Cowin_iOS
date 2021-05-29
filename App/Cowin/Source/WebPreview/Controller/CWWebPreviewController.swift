//
//  CWWebPreviewController.swift
//  Cowin
//
//  Created by Basheer Ahamed.S on 29/05/21.
//

import UIKit
import WebKit

class CWWebPreviewController: UIViewController {
    
    @IBOutlet var topHolderView: UIView!
    @IBOutlet var titleHolderView: UIView!
    @IBOutlet var webView: WKWebView!
    @IBOutlet var loader: UIActivityIndicatorView!

    // Have to use via router...
    var content: String = .defaultValue
    var url: String = .defaultValue
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.prepareStyles()
        self.prepareViews()
        self.startLoader()
        
        if self.url.isNotEmpty {
            self.loadWebView(withUrl: self.url)
        } else if self.content.isNotEmpty {
            self.loadWebView(withContent: self.content)
        }
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
    
    private func loadWebView(withUrl: String) {
        if let url = URL(string: withUrl) {
            webView.load(URLRequest(url: url))
        } else {
            // do something
        }
    }
    
    private func loadWebView(withContent: String) {
        webView.loadHTMLString(getContent(with: withContent), baseURL: nil)
    }
    
    private func prepareStyles() {
        self.view.backgroundColor = CWStyle.Background.secondary
        
        self.webView.backgroundColor = UIColor.clear
        self.webView.isOpaque = false
        self.webView.scrollView.backgroundColor = UIColor.clear
        self.webView.navigationDelegate = self
    }
    
    private func startLoader() {
        DispatchQueue.main.async {
            
            self.loader.isHidden = false
            self.loader.startAnimating()
        }
    }
    
    private func stopLoader() {
        DispatchQueue.main.async {
            
            self.loader.stopAnimating()
            self.loader.isHidden = true
        }
    }
}

extension CWWebPreviewController: WKNavigationDelegate {
 
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.startLoader()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.stopLoader()
    }
}

private extension CWWebPreviewController {
    
    func getContent(with content: String) -> String {
        
        return """
        <head>
        
        <style>
        
        blockquote {
            padding-left: 6px;
            margin-left: 10px;
        }
        
        #content {
            transform: translateZ(0); /*for older browsers*/
            will-change: transform;
            line-height: 21px;
            word-break: break-word;
        }
        
        img, iframe {
            max-width:100%;
            height:auto !important;
        }
        
        a {
            text-decoration:none;
        }
        
        </style>
        
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <meta name="viewport" content="width=device-width; user-scalable=1; initial-scale=1.0;"/>
        <meta name="apple-mobile-web-app-capable" content="yes"/>
        
        </head>
        
        <body>
        
        <div id='content'>
            \(content)
        </div>
        
        </body>
        """
    }
}
