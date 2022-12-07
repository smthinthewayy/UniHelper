//
//  UserDataViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 03.12.2022.
//

import UIKit
import iOSDropDown

class UserDataViewController: UIViewController {
    let cityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Город: " + (UserDefaults.standard.string(forKey: "userDataCity") ?? "...")
        return label
    }()
    
    let scienceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Наука: " + (UserDefaults.standard.string(forKey: "userDataStudyArea") ?? "...")
        return label
    }()
    
    let subjectsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Предметы: " + (UserDefaults.standard.object(forKey: "UserDataSubjects") as! [String]).joined(separator: ", ")
        return label
    }()
    
    let scoresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Баллы ЕГЭ: " + (UserDefaults.standard.object(forKey: "UserDataScores") as! [Int]).map{String($0)}.joined(separator: ", ")
        return label
    }()
    
    let paymentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Обучение: " + (UserDefaults.standard.bool(forKey: "UserDataPayment") ? "Платное" : "Бюджетное")
        return label
    }()
    
    let hostelLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Общежитие: " + (UserDefaults.standard.bool(forKey: "UserDataHostel") ? "Нужно" : "Не нужно" )
        return label
    }()
    
    let answerButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitle("Next", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        tabBarController?.tabBar.isHidden = true

        setupViews()
        setupConstraints()

        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
//        print("handlePresentingAnswerButton()")
        let rootVC = FilterSearchViewController()
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }

    func setupViews() {
        view.backgroundColor = UIColor(named: "White")

        view.addSubview(answerButton)
        view.addSubview(cityLabel)
        view.addSubview(scienceLabel)
        view.addSubview(subjectsLabel)
        view.addSubview(scoresLabel)
        view.addSubview(paymentLabel)
        view.addSubview(hostelLabel)
    }

    func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalToSuperview().inset(100)
        }
        
        scienceLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(cityLabel).inset(75)
        }
        
        subjectsLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(scienceLabel).inset(75)
        }
        
        scoresLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(subjectsLabel).inset(75)
        }
        
        paymentLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(scoresLabel).inset(75)
        }
        
        hostelLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(paymentLabel).inset(75)
        }
        
        answerButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalToSuperview().inset(100)
            make.height.equalTo(50)
        }
    }
}
