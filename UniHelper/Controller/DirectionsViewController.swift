//
//  DirectionsViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit

class DirectionsViewController: UIViewController {
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor(named: "White")
        return table
    }()
    
    var university: University? = nil
        
    var selectedDirection: Direction? = nil
    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        navigationItem.title = "Направления"
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDataSource
extension DirectionsViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return university!.directions.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let direction = university!.directions[indexPath.row].name
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
       
       cell.textLabel?.text = direction
       cell.textLabel?.numberOfLines = 0
       cell.textLabel?.lineBreakMode = .byWordWrapping
//       cell.imageView?.image = UIImage(systemName: "house")
       cell.backgroundColor = .clear
       
       return cell
   }
}

// MARK: - UITableViewDelegate

extension DirectionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        selectedDirection = university!.directions[indexPath.row]
        
        let rootVC = DirectionViewController()
        rootVC.direction = selectedDirection!
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
}
