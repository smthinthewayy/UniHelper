//
//  UniversitiesViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 01.12.2022.
//

import UIKit
import FirebaseFirestore

class SearchViewController: UIViewController {

    let searchController: UISearchController = {
        let search = UISearchController()
        search.loadViewIfNeeded()
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.enablesReturnKeyAutomatically = false
        search.searchBar.returnKeyType = UIReturnKeyType.done
        return search
    }()

    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor(named: "White")
        return table
    }()

    var db = Firestore.firestore()

    var universities = [University]()

    var filteredUniversities = [University]()

    var selectedUniversity = University(name: "", directions: [Direction(name: "")])

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()

        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true

        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self

        tableView.dataSource = self
        tableView.delegate = self
    }
    
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
}

// MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return filteredUniversities.count
        }
        return universities.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let university: University!
        let cell = tableView.dequeueReusableCell( withIdentifier: "cell", for: indexPath)

        if searchController.isActive {
            university = filteredUniversities[indexPath.row]
        } else {
            university = universities[indexPath.row]
        }
        
        cell.textLabel?.text = "University \(indexPath.row + 1)"
        cell.imageView?.image = UIImage(systemName: "house")
        cell.backgroundColor = .clear
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if searchController.isActive {
            selectedUniversity = filteredUniversities[indexPath.row]
        } else {
            selectedUniversity = universities[indexPath.row]
        }
        
//        performSegue(withIdentifier: K.universitiesSegue, sender: self)
    }
}

// MARK: - UISearchBarDelegate

extension SearchViewController: UISearchBarDelegate {
//    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//        search(shouldShow: false)
//    }
//
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        print("searchBarTextDidBeginEditing")
//    }
//
//    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//        print("searchBarTextDidEndEditing")
//    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
