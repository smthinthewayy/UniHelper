//
//  ProfileViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 01.12.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    let logoutButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("Выйти", for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        logoutButton.addTarget(self, action: #selector(handlePresentingLogoutButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingLogoutButton(_ sender: UIButton) {
        UserDefaults.standard.set(false, forKey: "userLogIn")
        
        let vc = WelcomeViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(logoutButton)
    }
    
    func setupConstraints() {
        logoutButton.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
