//
//  UniversitiesViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 01.12.2022.
//

import UIKit
//import FirebaseFirestore

class SearchViewController: UIViewController {
    let searchController: UISearchController = {
        let search = UISearchController()
        search.loadViewIfNeeded()
        search.searchBar.placeholder = "Найти"
        search.searchBar.setValue("Отмена", forKey: "cancelButtonText")
        search.searchBar.enablesReturnKeyAutomatically = false
        search.searchBar.returnKeyType = UIReturnKeyType.done
        search.obscuresBackgroundDuringPresentation = false
        return search
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor(named: "White")
        table.rowHeight = UITableView.automaticDimension;
        return table
    }()
    
//    var db = Firestore.firestore()
    
    var filteredUniversities = [University]()
    
    var selectedUniversity: University? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
//        loadUniversities()
        
        navigationItem.title = "Университеты"
        
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
//    func loadUniversities() {
//        db.collection("Universities").getDocuments { querySnapshot, error in
//            if let e = error {
//                let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
//                alert.addAction(UIAlertAction(title: "Continue", style: .default))
//                self.present(alert, animated: true)
//            } else {
//                if let snapshotDocuments = querySnapshot?.documents {
//                    for doc in snapshotDocuments {
//                        let data = doc.data()
//                        if let universityName = data["name"] as? String, let universityDirections = data["directions"] as? [Direction] {
//                            let newUniversity = University(name: universityName, directions: universityDirections)
//                            self.universities.append(newUniversity)
//                            DispatchQueue.main.async {
//                                self.tableView.reloadData()
//                            }
//                        }
//                    }
//                }
//            }
//        }
//    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DirectionsViewController else { return }
        destination.university = selectedUniversity!
    }
}

// MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredUniversities.count
        }
        return UniversitiesManager.universities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let university: University!
        let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath)
        
        if searchController.isActive {
            university = filteredUniversities[indexPath.row]
        } else {
            university = UniversitiesManager.universities[indexPath.row]
        }
        
        cell.textLabel?.text = university.name
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.imageView?.image = UIImage(systemName: "house")
//        cell.imageView?.image = UIImage(named: "poli")
        cell.backgroundColor = .clear
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if searchController.isActive {
            selectedUniversity = filteredUniversities[indexPath.row]
        } else {
            selectedUniversity = UniversitiesManager.universities[indexPath.row]
        }
        
        let rootVC = DirectionsViewController()
        rootVC.university = selectedUniversity!
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
}

// MARK: - UISearchResultsUpdating, UISearchBarDelegate
extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if let searchText = searchBar.text {
            filterForSearchText(searchText)
        }
    }
    
    func filterForSearchText(_ searchText: String) {
        filteredUniversities = UniversitiesManager.universities.filter { university in
            if searchController.searchBar.text != "" {
                let searchTextMath = university.name.lowercased().contains(searchText.lowercased())
                return searchTextMath
            } else {
                return false
            }
        }
        tableView.reloadData()
    }
}
