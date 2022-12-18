//
//  LogInViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 30.11.2022.
//

import UIKit
import SnapKit
import FirebaseAuth

class AuthenticationViewController: UIViewController {
    let emailImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "textfield")!)
        return imageView
    }()
    
    let passwordImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "textfield")!)
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Почта"
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = UIColor(named: "Black")
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        textField.isSecureTextEntry = true
        textField.textAlignment = .center
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.textColor = UIColor(named: "Black")
        textField.font = UIFont.systemFont(ofSize: 20)
        return textField
    }()
    
    lazy var loginButtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    lazy var registerButtton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitle("Зарегистрироваться", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "authorization"
        
        setupViews()
        setupConstraints()
        
        loginButtton.addTarget(self, action: #selector(handlePresentingLoginButton(_:)), for: .touchUpInside)
        registerButtton.addTarget(self, action: #selector(handlePresentingregisterButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingLoginButton(_ sender: UIButton) {
        let rootVC = DashboardTabBarController()
        rootVC.modalPresentationStyle = .fullScreen
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    self.emailImageView.shakeByX()
                    self.passwordImageView.shakeByX()
                    
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .default))
                    self.present(alert, animated: true)
                } else {
                    UserDefaults.standard.set(true, forKey: "userLogIn")
                    self.present(rootVC, animated: true)
                }
            }
        }
    }
    
    @objc func handlePresentingregisterButton(_ sender: UIButton) {
        let rootVC = DashboardTabBarController()
        rootVC.modalPresentationStyle = .fullScreen
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.emailTextField.text = ""
                    self.passwordTextField.text = ""
                    self.emailImageView.shakeByX()
                    self.passwordImageView.shakeByX()
                    
                    let alert = UIAlertController(title: "Error", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Continue", style: .default))
                    self.present(alert, animated: true)
                } else {
                    UserDefaults.standard.set(true, forKey: "userLogIn")
                    self.present(rootVC, animated: true)
                }
            }
        }
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(emailImageView)
        view.addSubview(passwordImageView)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButtton)
        view.addSubview(registerButtton)
    }
    
    private func setupConstraints() {
        emailImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(50)
            make.width.equalTo(400)
            make.height.equalTo(125)
        }
        
        passwordImageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailImageView).inset(75)
            make.width.equalTo(400)
            make.height.equalTo(125)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(70)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(emailTextField).inset(75)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        loginButtton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(passwordTextField).inset(80)
            make.height.equalTo(50)
        }
        
        registerButtton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.top.equalTo(loginButtton).inset(60)
            make.height.equalTo(50)
        }
    }
}

extension UIImageView {
    func shakeByX() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 6, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 6, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
    func shakeByY() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 3
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x, y: self.center.y - 6))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x, y: self.center.y + 6))
        self.layer.add(animation, forKey: "position")
    }
}
