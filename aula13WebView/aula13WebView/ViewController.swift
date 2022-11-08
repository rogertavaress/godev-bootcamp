//
//  ViewController.swift
//  aula13WebView
//
//  Created by Rogério Tavares on 28/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    lazy var webview: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let web = WKWebView(frame: .zero, configuration: webConfiguration)
        web.navigationDelegate = self
        web.translatesAutoresizingMaskIntoConstraints = false
        return web
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray2
        title = "Site do Roger"
        configureUI()
        setupWebView()
    }
    
    private func setupWebView() {
        guard let url = URL(string: "https://www.rogeriotavares.dev") else { return }
        let request = URLRequest(url: url)
        webview.load(request)
    }

    private func configureUI() {
        view.addSubview(webview)
        
        NSLayoutConstraint.activate([
            webview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            webview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupNavBar() {
        
        let forwardBarItem = UIBarButtonItem(image: UIImage(systemName: "arrow.right"), style: .plain, target: self, action: #selector(forwardAction))
        let backBarItem = UIBarButtonItem(image: UIImage(systemName: "arrow.backward"), style: .plain, target: self, action: #selector(backAction))
        let reloadBarItem = UIBarButtonItem(image: UIImage(systemName: "arrow.counterclockwise"), style: .plain, target: self, action: #selector(reloadAction))
        
        
        navigationItem.rightBarButtonItems = [reloadBarItem]
        navigationItem.leftBarButtonItems = [backBarItem, forwardBarItem]
    }
}

extension ViewController {
    @objc
    private func forwardAction() {
        if webview.canGoForward {
            webview.goForward()
        }
    }
    
    
    @objc
    private func backAction() {
        if webview.canGoBack {
            webview.goBack()
        }
    }
    
    @objc
    private func reloadAction() {
        webview.reload()
    }
}

extension ViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("iniciando!")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Terminou")
    }
}
