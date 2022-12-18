//
//  ServicesViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 01.12.2022.
//

import UIKit

class ServicesViewController: UIViewController {
    let selectButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("Выбрать Направление", for: .normal)
        button.setTitleColor(UIColor(named: "Black"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()

        selectButton.addTarget(self, action: #selector(handlePresentingSelectButton(_:)), for: .touchUpInside)
    }

    @objc func handlePresentingSelectButton(_ sender: UIButton) {
        UserDefaults.standard.setValue("", forKeyPath: "userDataCity")
        UserDefaults.standard.setValue("", forKeyPath: "userDataStudyArea")
        UserDefaults.standard.setValue([""], forKeyPath: "UserDataSubjects")
        UserDefaults.standard.setValue([0], forKeyPath: "UserDataScores")
        UserDefaults.standard.setValue(0, forKeyPath: "UserDataPayment")
        UserDefaults.standard.setValue("", forKeyPath: "UserDataHostel")
        
        let rootVC = UserCityViewController()
        navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(selectButton)
    }
    
    func setupConstraints() {
        selectButton.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(150)
        }
    }
}
