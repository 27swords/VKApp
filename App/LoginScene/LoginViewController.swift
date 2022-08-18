//
//  LoginViewController.swift
//  App
//
//  Created by Alexander Chervoncev on 29.07.22.
//

import UIKit
import WebKit

class LoginViewController: UIViewController {
    
    //MARK: - Outlets
    private lazy var webView: WKWebView = {
        
        let config = WKWebViewConfiguration()
        let view = WKWebView(frame: .zero, configuration: config)
        return view
    }()
    
    //MARK: - Life Cycle
    override func loadView() {
        super.loadView()
        view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureWebView()
        loadAuth()
    }
}

//MARK: - Extensions
extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment
        else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params["access_token"], let id = params["user_id"] {
            Singleton.instance.id = Int(id)
            Singleton.instance.token = token
            
            print(token)
            
            decisionHandler(.cancel)
            let vc = TabBarViewController()
            navigationController?.pushViewController(vc, animated: false)
        }
    }
}

//MARK: - Private Extensions
private extension LoginViewController {
    func configureWebView() {
        navigationController?.navigationBar.isHidden = true
        webView.navigationDelegate = self
    }
    
    func loadAuth() {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
        URLQueryItem(name: "client_id", value: "51397857"),
        URLQueryItem(name: "display", value: "mobile"),
        URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
        URLQueryItem(name: "scope", value: "offline, friends, photos, groups"),
        URLQueryItem(name: "response_type", value: "token"),
        URLQueryItem(name: "revoke", value: "0"),
        URLQueryItem(name: "v", value: "5.131")
        ]
        
        guard let url = urlComponents.url else { return }
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
