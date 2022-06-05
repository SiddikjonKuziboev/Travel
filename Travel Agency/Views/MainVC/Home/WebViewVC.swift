//
//  WebViewVC.swift
//  Travel Agency
//
//  Created by Kuziboev Siddikjon on 4/28/22.
//

import UIKit
import WebKit


class WebViewVC: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var webUrl: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: webUrl) {
            webView.load(URLRequest(url: url))
            webView.allowsBackForwardNavigationGestures = true
        }
        
    }

    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false

    }

}
