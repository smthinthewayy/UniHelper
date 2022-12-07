//
//  UserStudyAreaViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit
import iOSDropDown

class UserStudyAreaViewController: UIViewController {
    let questionView: UILabel = {
        let text = UILabel()
        text.text = "Выберите интересующую вас науку:"
        text.numberOfLines = 0
        text.lineBreakMode = NSLineBreakMode.byWordWrapping
        return text
    }()
    
    let answerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitle("Next", for: .normal)
        return button
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = UIColor(named: "White")
        table.rowHeight = UITableView.automaticDimension;
        return table
    }()
    
    private var studyAreas = [
        "Математические и естественные науки",
        "Инженерное дело, технологии и технические науки",
        "Здравоохранение и медицинские науки",
        "Сельское хозяйство и сельскохозяйственные науки",
        "Науки об обществе",
        "Образование и педагогические науки",
        "Гуманитарные науки",
        "Искусство и культура"
    ]
    
    var selectedstudyArea: String = ""
    
//    let dropDownList: DropDown = {
//        let list = DropDown(frame: CGRect(x: 25, y: 450, width: 350, height: 30))
//        list.placeholder = "Выберите науку"
//        list.selectedRowColor = .gray
//        list.rowBackgroundColor = UIColor(named: "White")!
//        list.optionArray = ["Математические и \n естественные науки",
//                            "Инженерное дело, технологии и технические науки",
//                            "Здравоохранение и медицинские науки",
//                            "Сельское хозяйство и сельскохозяйственные науки",
//                            "Науки об обществе",
//                            "Образование и педагогические науки",
//                            "Гуманитарные науки",
//                            "Искусство и культура"
//        ]
//        return list
//    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tabBarController?.tabBar.isHidden = true
        
        setupView()
        setupConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        handlePresentingDropDownList()
        
        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
        UserDefaults.standard.set(selectedstudyArea, forKey: "userDataStudyArea")
//        print(UserDefaults.standard.string(forKey: "userDataStudyArea")!)
        
        let rootVC = UserSubjectsViewController()
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
//    func handlePresentingDropDownList() {
//        dropDownList.didSelect{ (selectedText, index, id)  in
//            UserDefaults.standard.set(selectedText, forKey: "userDataStudyArea")
//            print(UserDefaults.standard.string(forKey: "userDataStudyArea")!)
//        }
//    }
    
    func setupView() {
        view.backgroundColor = UIColor(named: "White")
        
        view.addSubview(questionView)
        view.addSubview(answerButton)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        questionView.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
        }
        
        answerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.width.equalToSuperview()
//            make.height.equalTo(500)
            make.top.equalToSuperview().inset(200)
            make.bottom.equalToSuperview().inset(150)
        }
    }
}

// MARK: - UITableViewDataSource

extension UserStudyAreaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studyAreas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studyArea: String!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        studyArea = studyAreas[indexPath.row]
        
        cell.textLabel?.text = studyArea
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.backgroundColor = .clear
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension UserStudyAreaViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedstudyArea = studyAreas[indexPath.row]
    }
}
