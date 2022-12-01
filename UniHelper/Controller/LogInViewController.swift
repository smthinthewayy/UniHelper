//
//  LogInViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 30.11.2022.
//

import UIKit
import SnapKit
import FirebaseAuth

class LogInViewController: UIViewController {
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.text = "a@b.com"
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = UIColor(named: "Black")
        textField.font = UIFont.systemFont(ofSize: 25)
        return textField
    }()

    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.text = "123456"
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = UIColor(named: "Black")
        textField.font = UIFont.systemFont(ofSize: 25)
        return textField
    }()

    lazy var loginButtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitle("Log In", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "authorization"

        setupViews()
        setupConstraints()
        
        loginButtton.addTarget(self, action: #selector(handlePresentingLoginButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingLoginButton(_ sender: UIButton) {
        let rootVC = DashboardTabBarController()
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    print(e)
//                    self.emailView.shakeByX()
//                    self.passwordView.shakeByX()
//                    self.errorLabel.text = e.localizedDescription
                } else {
                    self.navigationController?.pushViewController(rootVC, animated: true)
                }
            }
        }
    }

    private func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButtton)
    }

    private func setupConstraints() {
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(100)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }

        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField).inset(50)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }

        loginButtton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(passwordTextField).inset(75)
            make.height.equalTo(50)
        }
    }
}
