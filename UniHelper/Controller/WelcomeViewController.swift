//
//  ViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 30.11.2022.
//

import UIKit
import SnapKit
import SwiftUI

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
    
    lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(named: "Grey")
        button.layer.cornerRadius = 25
        button.setTitle("Начать", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        
        getStartedButton.addTarget(self, action: #selector(handlePresentingGetStartedButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingGetStartedButton(_ sender: UIButton) {
        let rootVC = AuthenticationViewController()
        rootVC.modalPresentationStyle = .fullScreen
        present(rootVC, animated: true)
    }
    
    private func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(appName)
        view.addSubview(appLogoView)
        view.addSubview(getStartedButton)
    }
    
    private func setupConstraints() {
        appLogoView.snp.makeConstraints { make in
            make.center.equalTo(self.view)
            make.height.equalTo(300)
            make.width.equalTo(300)
        }
        
        appName.snp.makeConstraints { make in
            make.bottom.equalTo(appLogoView).inset(30)
            make.centerX.equalTo(self.view)
        }
        
        getStartedButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(300)
            make.bottom.equalToSuperview().inset(50)
            make.height.equalTo(50)
        }
    }
}

struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> WelcomeViewController {
            return WelcomeViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
