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
    
    var university: University = University(name: "", directions: [Direction(city: "", faculty: "", name: "", subjects: [""], scores: 0, budgetPlaces: 0, payment: 0, hostel: "")])
        
    var selectedDirection = Direction(city: "", faculty: "", name: "", subjects: [""], scores: 0, budgetPlaces: 0, payment: 0, hostel: "")

    
    override func viewDidLoad() {
        setupViews()
        setupConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        print("completionHandler возвращает \(completionHandler?(university))")
        
        navigationItem.title = "Search"
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
       return university.directions.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let direction = university.directions[indexPath.row].name
       let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.delegate = self
//       cell.backgroundColor = UIColor.clear
//       cell.largeContentTitle = direction
//       var content = cell.defaultContentConfiguration()
       
       
       cell.textLabel?.text = direction
       cell.textLabel?.numberOfLines = 0
       cell.textLabel?.lineBreakMode = .byWordWrapping
       cell.imageView?.image = UIImage(systemName: "house")
       cell.backgroundColor = .clear
       
//       content.text = direction
//       cell.contentConfiguration = content
       return cell
   }
}

// MARK: - UITableViewDelegate

extension DirectionsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDirection = university.directions[indexPath.row]
        
        let rootVC = DirectionViewController()
        rootVC.direction = selectedDirection
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
}
