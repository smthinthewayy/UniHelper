//
//  UserPaymentViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit

class UserPaymentViewController: UIViewController {
    let questionView: UILabel = {
        let text = UILabel()
        text.text = "Бюджетное обучение или платное?"
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
    
    let paymentTrueButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        button.setTitle("Бюджетное обучение", for: .normal)
        return button
    }()
    
    let paymentFalseButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 25
        button.setTitle("Платное обучение", for: .normal)
        return button
    }()
    
    var payment: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        setupView()
        setupConstraints()
        
        navigationItem.title = "Обучение"
        
        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
        paymentTrueButton.addTarget(self, action: #selector(handlePresentingPaymentButton(_:)), for: .touchUpInside)
        paymentFalseButton.addTarget(self, action: #selector(handlePresentingPaymentButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
        UserDefaults.standard.set(payment, forKey: "UserDataPayment")
        
        let rootVC = UserHostelViewController()
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    @objc func handlePresentingPaymentButton(_ sender: UIButton) {
        paymentFalseButton.backgroundColor = UIColor(named: "White")
        paymentFalseButton.setTitleColor(UIColor(named: "Grey"), for: .normal)
        paymentTrueButton.backgroundColor = UIColor(named: "White")
        paymentTrueButton.setTitleColor(UIColor(named: "Grey"), for: .normal)
        sender.backgroundColor = UIColor(named: "Grey")
        sender.setTitleColor(UIColor(named: "White"), for: .normal)
        if sender.titleLabel!.text == "Бюджетное обучение" {
            payment = false
        } else {
            payment = true
        }
    }

    func setupView() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(questionView)
        view.addSubview(answerButton)
        view.addSubview(paymentTrueButton)
        view.addSubview(paymentFalseButton)
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
        
        paymentTrueButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalToSuperview().inset(300)
            make.height.equalTo(50)
        }
        
        paymentFalseButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.top.equalToSuperview().inset(400)
            make.height.equalTo(50)
        }
    }
}
