//
//  UniversitiesViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 01.12.2022.
//

import UIKit
import FirebaseFirestore

//protocol UniversityDelegate {
//    func loadUniversity()
//}

class SearchViewController: UIViewController {
    let searchController: UISearchController = {
        let search = UISearchController()
        search.loadViewIfNeeded()
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
    
    var db = Firestore.firestore()
    
    var universities: [University] = [
        University(
            name: "Московский Политехнический",
            directions: [
                Direction(city: "Москва", faculty : "Факультет Информационных Технологий", name: "Прикладная Информатика. Корпоративные Информационные Системы", subjects: ["Математика (профиль)", "Информатика/Физика", "Русский язык"], scores: 247, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Транспортный факультет", name: "Спортивные транспортные средства", subjects: ["Математика (профиль)", "Информатика/Физика", "Русский язык "], scores: 234, budgetPlaces: 20, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Факультет Химической Технологии и Биотехнологии", name: "Биотехнология", subjects: ["Математика (профиль)", "Биология/Химия", "Русский язык"], scores: 237, budgetPlaces: 33, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Факультет урбанистики и городского хозяйства", name: "Промышленное и гражданское строительство (Строительство)", subjects: ["Математика (профиль)", "Информатика/Физика", "Русский язык"], scores: 208, budgetPlaces: 57,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Факультет экономики и управления", name: "Реклама и связи с общественностью в цифровых медиа", subjects: ["Обществознание", "История/Иностранный язык", "Русский язык"], scores: 282, budgetPlaces: 15, payment: 223500, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Факультет экономики и управления", name: "Интегрированные бренд-коммуникации (Реклама и связи с общественностью)", subjects: ["Обществознание", "История/Иностранный язык", "Русский язык"], scores: 282, budgetPlaces: 15,payment: 223500, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Химической техноллогии и биотехнологии", name: "Безотходные производственные технологии (Техносферная безопасность)", subjects: ["Математика (профиль)", "Физика/Химия", "Русский язык"], scores: 175, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Химической техноллогии и биотехнологии", name: "Экологическая безопасность и охрана труда (Техносферная безопасность)", subjects: ["Математика (профиль)", "Физика/Химия", "Русский язык"], scores: 152, budgetPlaces: 55, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Промышленное и гражданское строительство (Строительство)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 208, budgetPlaces: 57,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Автоматизированные энергетические установки (Энергетическое машиностроение)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 177, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Системы дальней связи (Радиотехника)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 191, budgetPlaces: 25, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Строительство уникальных зданий и сооружений", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 215, budgetPlaces: 30, payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Теплоэнергетика и теплотехника", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 186, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Урабанистики и городского хозяйства", name: "Электроэнергетика и электротехника", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 210, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Транспортный", name: "Интеллектуальные системы управления транспортом (Прикладная математика и информатика)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 238, budgetPlaces: 31,payment: 223500, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Транспортный", name: "Компьютерный инжиниринг в автомобилестроении (Наземные транспортно-технологические средства)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 185, budgetPlaces: 20,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Транспортный", name: "Перспективные транспортные средства (Наземные транспортно-технологические средства)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 221, budgetPlaces: 20,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Транспортный", name: "Программирование и цифровые технологии в динамике и прочности (Прикладная механика)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 212, budgetPlaces: 20,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Транспортный", name: "Энергоустановки для транспорта и малой энергетики (Энергетическое машиностроение)", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 185, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Полиграфический", name: "Технологии упраковочного производства", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Полиграфический", name: "Информационные системы автоматизированных комплексов медиаиндустрии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 238, budgetPlaces: 25,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Полиграфический", name: "Бизнес-процессы печатной и упаковочной индустрии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Полиграфический", name: "Дизайн и проектирование мультимедиа и визуального контента", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Полиграфический", name: "Материаловедение и цифровые технологии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика/Химия", "Русский язык"], scores: 170, budgetPlaces: 19,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Полиграфический", name: "Ресурсное обеспечение печатной и упаковочной индустрии", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 201, budgetPlaces: 85,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107"),
                Direction(city: "Москва", faculty : "Полиграфический", name: "Управление качеством на производстве", subjects: ["Математика (профиль)", "Информатика и ИКТ/Физика", "Русский язык"], scores: 192, budgetPlaces: 19,payment: 251100, hostel: "предоставляется  всем студентам за трассой А107")])
    ]
    
    var filteredUniversities = [University]()
    
    var selectedUniversity: University = University(name: "", directions: [Direction(city: "", faculty: "", name: "", subjects: [""], scores: 0, budgetPlaces: 0, payment: 0, hostel: "")])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        //        loadUniversities()
        
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = true
        
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        searchController.searchResultsUpdater = self
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadUniversities() {
        db.collection("Universities").getDocuments { querySnapshot, error in
            if let e = error {
                let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Continue", style: .default))
                self.present(alert, animated: true)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let universityName = data["name"] as? String, let universityDirections = data["directions"] as? [Direction] {
                            let newUniversity = University(name: universityName, directions: universityDirections)
                            self.universities.append(newUniversity)
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
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
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DirectionsViewController else { return }
        destination.university = selectedUniversity
        print(selectedUniversity)
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
        
        cell.textLabel?.text = university.name
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
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
        
        //        delegate?.onPizzaReady(type: "Овощная пицца")
        
        let rootVC = DirectionsViewController()
        rootVC.university = selectedUniversity
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
        //        performSegue(withIdentifier: K.universitiesSegue, sender: self)
    }
}

// MARK: - UISearchBarDelegate

//extension SearchViewController: UISearchBarDelegate {
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


//}

// MARK: - UniversityCellDelegator
//extension UniversitiesViewController: UniversityCellDelegator {
//    func callSegueFromCell() {
//        self.performSegue(withIdentifier: K.universitiesSegue, sender: self)
//    }
//}

// MARK: - UISearchResultsUpdating, UISearchBarDelegate
extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if let searchText = searchBar.text {
            filterForSearchText(searchText)
        }
    }
    
    func filterForSearchText(_ searchText: String) {
        filteredUniversities = universities.filter { university in
            if searchController.searchBar.text != "" {
                let searchTextMath = university.name.lowercased().contains(searchText.lowercased())
                return searchTextMath
            } else {
                return false
            }
        }
        tableView.reloadData()
    }
    
    //    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    //        print(searchText)
    //    }
}
