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
        button.setTitle("Select Universities", for: .normal)
        button.setTitleColor(UIColor(named: "Black"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
//        tabBarController?.tabBar.isHidden = false
//        
//        hidesBottomBarWhenPushed = true

        selectButton.addTarget(self, action: #selector(handlePresentingSelectButton(_:)), for: .touchUpInside)
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        tabBarController?.tabBar.isHidden = false
//    }

    @objc func handlePresentingSelectButton(_ sender: UIButton) {
        UserDefaults.standard.setValue("", forKeyPath: "userDataCity")
        UserDefaults.standard.setValue("", forKeyPath: "userDataStudyArea")
        UserDefaults.standard.setValue([""], forKeyPath: "UserDataSubjects")
        UserDefaults.standard.setValue([0], forKeyPath: "UserDataScores")
        UserDefaults.standard.setValue(0, forKeyPath: "UserDataPayment")
        UserDefaults.standard.setValue("", forKeyPath: "UserDataHostel")
        
//        print("selectButton pressed")
        let rootVC = UserCityViewController()
//        rootVC.modalPresentationStyle = .fullScreen
//        rootVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(rootVC, animated: true)
//        present(rootVC, animated: true)
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
