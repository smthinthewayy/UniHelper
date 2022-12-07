//
//  UserSubjectsViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit
import iOSDropDown

class UserSubjectsViewController: UIViewController {
    let questionView: UILabel = {
        let text = UILabel()
        text.text = "Выберите предметы которые вы планируете сдавать/сдавали:"
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
        table.allowsMultipleSelection = true
        table.allowsSelectionDuringEditing = true
        table.allowsMultipleSelectionDuringEditing = true
        return table
    }()
    
    private var subjects = [
        "Математика (база)",
        "Математика (профиль)",
        "Русский язык",
        "Физика",
        "Химия",
        "История",
        "Обществознание",
        "Информатика и ИКТ",
        "Биология",
        "География",
        "Английский язык",
        "Немецкий язык",
        "Французский язык",
        "Испанский язык",
        "Китайский язык"
    ]
    
    var selectedSubjects = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tabBarController?.tabBar.isHidden = true
        
        setupView()
        setupConstraints()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
        UserDefaults.standard.set(selectedSubjects, forKey: "UserDataSubjects")
//        print(UserDefaults.standard.object(forKey: "UserDataSubjects"))
        
        let rootVC = UserScoresViewController()
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
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
            make.bottom.equalToSuperview().inset(200)
        }
    }
}

// MARK: - UITableViewDataSource

extension UserSubjectsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjects.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let subject: String!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        subject = subjects[indexPath.row]
        
        cell.textLabel?.text = subject
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.backgroundColor = .clear
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension UserSubjectsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSubjects.append(subjects[indexPath.row])
    }
}
