//
//  UserHostelViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit

class UserHostelViewController: UIViewController {
    let questionView: UILabel = {
        let text = UILabel()
        text.text = "Нужно ли Вам общежитие?"
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
    
    let hostelTrueButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitleColor(UIColor(named: "Black"), for: .normal)
        button.setTitle("Нужно", for: .normal)
        return button
    }()
    
    let hostelFalseButton: UIButton = {
        let button = UIButton()
//        button.backgroundColor = UIColor(named: "Grey")
        button.setTitleColor(UIColor(named: "Black"), for: .normal)
        button.layer.cornerRadius = 25
        button.setTitle("Не нужно", for: .normal)
        return button
    }()
    
    var hostel: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tabBarController?.tabBar.isHidden = true
        
        setupView()
        setupConstraints()
        
//        tableView.dataSource = self
//        tableView.delegate = self
        
        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
        hostelTrueButton.addTarget(self, action: #selector(handlePresentingPaymentButton(_:)), for: .touchUpInside)
        hostelFalseButton.addTarget(self, action: #selector(handlePresentingPaymentButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
        UserDefaults.standard.set(hostel, forKey: "UserDataHostel")
//        print(UserDefaults.standard.bool(forKey: "UserDataHostel"))
        
        let rootVC = UserDataViewController()
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    @objc func handlePresentingPaymentButton(_ sender: UIButton) {
        hostelFalseButton.backgroundColor = UIColor(named: "White")
        hostelFalseButton.setTitleColor(UIColor(named: "Grey"), for: .normal)
        hostelTrueButton.backgroundColor = UIColor(named: "White")
        hostelTrueButton.setTitleColor(UIColor(named: "Grey"), for: .normal)
        sender.backgroundColor = UIColor(named: "Grey")
        sender.setTitleColor(UIColor(named: "White"), for: .normal)
        if sender.titleLabel!.text == "Не нужно" {
            hostel = false
        } else {
            hostel = true
        }
    }

    func setupView() {
        view.backgroundColor = UIColor(named: "White")
        
        view.addSubview(questionView)
        view.addSubview(answerButton)

        view.addSubview(hostelFalseButton)
        view.addSubview(hostelTrueButton)
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
        
        hostelTrueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalToSuperview().inset(300)
            make.height.equalTo(50)
        }
        
        hostelFalseButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalToSuperview().inset(400)
            make.height.equalTo(50)
        }
    }
}
