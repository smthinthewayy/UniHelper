//
//  ViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 30.11.2022.
//

import UIKit
import SnapKit

class WelcomeViewController: UIViewController {
    let appLogoView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Logo")!)
        return imageView
    }()

    let appName: UILabel = {
        let label = UILabel()
        label.text = "UniHelper"
        label.textColor = UIColor(named: "Black")
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()

//    lazy var loginButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = UIColor(named: "Grey")
//        button.layer.cornerRadius = 25
//        button.setTitle("Log In", for: .normal)
//        return button
//    }()
//
//    lazy var registerButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = UIColor(named: "Grey")
//        button.layer.cornerRadius = 25
//        button.setTitle("Register", for: .normal)
//        return button
//    }()
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitle("Get Started", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()

//        loginButton.addTarget(self, action: #selector(handlePresentingLoginButton(_:)), for: .touchUpInside)
//        registerButton.addTarget(self, action: #selector(handlePresentingRegisterButton(_:)), for: .touchUpInside)
        getStartedButton.addTarget(self, action: #selector(handlePresentingGetStartedButton(_:)), for: .touchUpInside)
    }

//    @objc func handlePresentingLoginButton(_ sender: UIButton) {
//        let rootVC = LogInViewController()
//        rootVC.title = "authorization"
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(rootVC, animated: true)
//        present(rootVC, animated: true)
//    }

//    @objc func handlePresentingRegisterButton(_ sender: UIButton) {
//        let rootVC = RegisterViewController()
//        rootVC.title = "registration"
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(rootVC, animated: true)
//        present(rootVC, animated: true)
//    }
    
    @objc func handlePresentingGetStartedButton(_ sender: UIButton) {
        let rootVC = AuthenticationViewController()
        rootVC.modalPresentationStyle = .fullScreen
//        navigationController?.pushViewController(rootVC, animated: true)
        present(rootVC, animated: true)
    }

    private func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        
        view.addSubview(appName)
        view.addSubview(appLogoView)
//        view.addSubview(loginButton)
//        view.addSubview(registerButton)
        view.addSubview(getStartedButton)
    }

    private func setupConstraints() {
        appName.snp.makeConstraints { make in
            make.bottom.equalTo(appLogoView).inset(30)
            make.centerX.equalTo(self.view)
        }
        
        appLogoView.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        
//        loginButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.width.equalTo(300)
//            make.bottom.equalToSuperview().inset(90)
//            make.height.equalTo(50)
//        }
//
//        registerButton.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.width.equalTo(300)
//            make.bottom.equalToSuperview().inset(30)
//            make.height.equalTo(50)
//        }
        
        getStartedButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
}
