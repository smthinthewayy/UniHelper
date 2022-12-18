//
//  UserCityViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit
import iOSDropDown

class UserCityViewController: UIViewController {
    let questionView: UILabel = {
        let text = UILabel()
        text.text = "В каком городе Вы хотите учиться?"
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
    
    let dropDownList: DropDown = {
        let list = DropDown(frame: CGRect(x: 150, y: 400, width: 200, height: 30))
        list.placeholder = "Select city"
        list.selectedRowColor = .gray
        list.rowBackgroundColor = UIColor(named: "White")!
        list.optionArray = ["Москва", "Санкт-Петербург", "Сочи", "Калининград", "Владикавказ", "Мурманск", "Череповец", "Екатеринбург"]
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupConstraints()
        
        navigationItem.title = "Город"
        
        handlePresentingDropDownList()
        
        answerButton.addTarget(self, action: #selector(handlePresentingAnswerButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingAnswerButton(_ sender: UIButton) {
        let rootVC = UserStudyAreaViewController()
        rootVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func handlePresentingDropDownList() {
        dropDownList.didSelect{ (selectedText, index, id)  in
            UserDefaults.standard.set(selectedText, forKey: "userDataCity")
        }
    }
    
    func setupView() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(questionView)
        view.addSubview(answerButton)
        view.addSubview(dropDownList)
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
    }
}
