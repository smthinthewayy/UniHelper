//
//  FilterSearchViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit

class FilterSearchViewController: UIViewController {
    var filteredDirections: [Direction] = []
    
    var selectedDirection: Direction? = nil
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor(named: "White")
        table.rowHeight = UITableView.automaticDimension;
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        loadDirections()
        
        navigationItem.title = "Подходящие направления"
        
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadDirections() {
        let city: String = UserDefaults.standard.string(forKey: "userDataCity")!
        let faculty: String = UserDefaults.standard.string(forKey: "userDataStudyArea")!
        let subjects: [String] = (UserDefaults.standard.object(forKey: "UserDataSubjects") as! [String]?)!
        let scores: [Int] = UserDefaults.standard.object(forKey: "UserDataScores") as! [Int]
//        let payment: Bool = UserDefaults.standard.bool(forKey: "UserDataPayment")
//        let hostel: Bool = UserDefaults.standard.bool(forKey: "UserDataHostel")
        for direction in UniversitiesManager.universities[0].directions {
//            print(direction.city)
//            print(city)
//            print(direction.faculty)
//            print(faculty)
            if direction.city.lowercased() == city.lowercased() {
                if direction.faculty.lowercased() == faculty.lowercased() {
                    let sourceSubjects = direction.subjects.sorted()
                    let userSubjects = subjects.sorted()
                    var flag = true
                    
                    for i in 0 ... min(sourceSubjects.count, userSubjects.count) - 1 {
                        if !sourceSubjects[i].contains(userSubjects[i]) {
                            flag = false
                            break
                        }
                    }
                    
                    if flag {
                        if scores.reduce(0, +) >= direction.scores {
                            filteredDirections.append(direction)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
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

extension FilterSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredDirections.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let direction: Direction!
        let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath)
        
        direction = filteredDirections[indexPath.row]
        
        cell.textLabel?.text = direction.name
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.backgroundColor = .clear
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension FilterSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedDirection = filteredDirections[indexPath.row]
        
        let rootVC = DirectionViewController()
        rootVC.direction = selectedDirection!
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
}
