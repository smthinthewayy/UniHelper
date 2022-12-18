//
//  UserScoresViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit

class UserScoresViewController: UIViewController {
    let questionView: UILabel = {
        let text = UILabel()
        text.text = "Заполните Ваши баллы ЕГЭ:"
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
    
    var subject_1: UILabel = {
        let text = UILabel()
        return text
    }()
    
    var textField_1: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.autocapitalizationType = .none
        textField.placeholder = "0...100"
        textField.autocorrectionType = .no
        return textField
    }()
    
    var subject_2: UILabel = {
        let text = UILabel()
        return text
    }()
    
    var textField_2: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.placeholder = "0...100"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    var subject_3: UILabel = {
        let text = UILabel()
        return text
    }()
    
    var textField_3: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.placeholder = "0...100"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    var subject_4: UILabel = {
        let text = UILabel()
        return text
    }()

    var textField_4: UITextField = {
        let textField = UITextField()
        textField.textAlignment = .left
        textField.placeholder = "0...100"
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        return textField
    }()
    
    var scores: [Int] = []
    
    let subjects = UserDefaults.standard.object(forKey: "UserDataSubjects") as! [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
        navigationItem.title = "ЕГЭ"
        
        loadSubjects()
        
        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
    }
    
    func loadSubjects() {
        if subjects.count >= 1 {
            subject_1.text = subjects[0]
        }
        
        if subjects.count >= 2 {
            subject_2.text = subjects[1]
        }
        
        if subjects.count >= 3 {
            subject_3.text = subjects[2]
        }
        
        if subjects.count >= 4 {
            subject_4.text = subjects[3]
        }
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
        if subjects.count >= 1 {
            scores.append(Int(textField_1.text ?? "0") ?? 0)
        }
        
        if subjects.count >= 2 {
            scores.append(Int(textField_2.text ?? "0") ?? 0)
        }
        
        if subjects.count >= 3 {
            scores.append(Int(textField_3.text ?? "0") ?? 0)
        }
        
        if subjects.count >= 4 {
            scores.append(Int(textField_4.text ?? "0") ?? 0)
        }
        
        UserDefaults.standard.set(scores, forKey: "UserDataScores")
        
        let rootVC = UserPaymentViewController()
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func setupView() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(questionView)
        view.addSubview(answerButton)
        
        if subjects.count >= 1 {
            view.addSubview(subject_1)
            view.addSubview(textField_1)
        }
        
        if subjects.count >= 2 {
            view.addSubview(subject_2)
            view.addSubview(textField_2)
        }

        if subjects.count >= 3 {
            view.addSubview(subject_3)
            view.addSubview(textField_3)
        }
        
        if subjects.count >= 4 {
            view.addSubview(subject_4)
            view.addSubview(textField_4)
        }
    }
    
    func setupConstraints() {
        let subjects = UserDefaults.standard.object(forKey: "UserDataSubjects") as! [String]
        
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
        
        if subjects.count >= 1 {
            subject_1.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(300)
                make.top.equalToSuperview().inset(250)
                make.left.equalToSuperview().inset(50)
            }
            
            textField_1.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(100)
                make.top.equalToSuperview().inset(300)
                make.left.equalToSuperview().inset(50)
            }
        }
        
        if subjects.count >= 2 {
            subject_2.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(300)
                make.top.equalToSuperview().inset(350)
                make.left.equalToSuperview().inset(50)
            }
            
            textField_2.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(100)
                make.top.equalToSuperview().inset(400)
                make.left.equalToSuperview().inset(50)
            }
        }
        
        if subjects.count >= 3 {
            subject_3.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(300)
                make.top.equalToSuperview().inset(450)
                make.left.equalToSuperview().inset(50)
            }
            
            textField_3.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(100)
                make.top.equalToSuperview().inset(500)
                make.left.equalToSuperview().inset(50)
            }
        }
        
        if subjects.count >= 4 {
            subject_4.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(300)
                make.top.equalToSuperview().inset(550)
                make.left.equalToSuperview().inset(50)
            }
            
            textField_4.snp.makeConstraints { make in
                make.height.equalTo(50)
                make.width.equalTo(100)
                make.top.equalToSuperview().inset(600)
                make.left.equalToSuperview().inset(50)
            }
        }
    }
}
