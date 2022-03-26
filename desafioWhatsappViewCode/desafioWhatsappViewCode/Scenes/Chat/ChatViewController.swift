//
//  ViewController.swift
//  desafioWhatsappViewCode
//
//  Created by Rogério Tavares on 25/03/22.
//

import UIKit

class ChatViewController: UIViewController {
    
    private var chats = [Chat]()
    
    lazy var tableview: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //    private var safeArea: UILayoutGuide!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        configureTopBar()
        registerCells()
        configureView()
        addSubViews()
        configureSubViews()
        getList()
    }
    
    private func delegates() {
        tableview.delegate = self
        tableview.dataSource = self
    }
    
    private func registerCells() {
        tableview.register(ChatItemTableViewCell.self, forCellReuseIdentifier: ChatItemTableViewCell.identifier)
        tableview.register(ChatHeaderTableView.self, forHeaderFooterViewReuseIdentifier: ChatHeaderTableView.identifier)
    }
    
    private func configureTopBar() {
        title = "Conversas"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let leftButton = UIBarButtonItem(title: "Editar", style: .plain, target: nil, action: nil)
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "plus.square"), style: .plain, target: nil, action: nil)
        navigationItem.rightBarButtonItem = rightButton
    }
    
    private func configureView() {
        view.backgroundColor = .white
        //        safeArea = view.layoutMarginsGuide
    }
    
    private func addSubViews() {
        view.addSubview(tableview)
    }
    
    private func configureSubViews() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func getList() {
        GetChatDataService.shared.execute { result in
            switch result {
            case .success(let response):
                self.chats = response
                self.onListUpdate()
            case .failure(_):
                let alertController = UIAlertController(title: "Falha", message: "Não conseguimos carregar a lista de conversas", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Fechar", style: .default))
                self.present(alertController, animated: true)
            }
        }
    }
    
    private func onListUpdate() {
        tableview.reloadData()
    }
}

extension ChatViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChatHeaderTableView.identifier) else { return UIView() }
        
        return header
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChatItemTableViewCell.identifier, for: indexPath) as? ChatItemTableViewCell else { return UITableViewCell() }
        
        cell.configure(with: chats[indexPath.row])
        
        return cell
    }
    
    
}
