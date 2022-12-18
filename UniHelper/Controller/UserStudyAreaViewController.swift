//
//  UserStudyAreaViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit

class UserStudyAreaViewController: UIViewController {
    let questionView: UILabel = {
        let text = UILabel()
        text.text = "Выберите интересующий вас факультет:"
        text.numberOfLines = 0
        text.lineBreakMode = NSLineBreakMode.byWordWrapping
        text.font = UIFont.boldSystemFont(ofSize: 30.0)
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
    
    var selectedstudyArea: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
        navigationItem.title = "Факультет"
        
        tableView.dataSource = self
        tableView.delegate = self
        
        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
        UserDefaults.standard.set(selectedstudyArea, forKey: "userDataStudyArea")
        
        let rootVC = UserSubjectsViewController()
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
            make.height.equalTo(200)
            make.top.equalToSuperview().inset(50)
            make.width.equalToSuperview().inset(30)
            make.centerX.equalToSuperview()
        }
        
        answerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(215)
            make.bottom.equalToSuperview().inset(175)
        }
    }
}

// MARK: - UITableViewDataSource

extension UserStudyAreaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UniversitiesManager.faculties.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let studyArea: String!
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        studyArea = UniversitiesManager.faculties[indexPath.row]
        
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
        selectedstudyArea = UniversitiesManager.faculties[indexPath.row]
    }
}
