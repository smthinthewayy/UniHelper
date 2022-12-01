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
        
        selectButton.addTarget(self, action: #selector(handlePresentingSelectButton(_:)), for: .touchUpInside)
    }
    
    @objc func handlePresentingSelectButton(_ sender: UIButton) {
        print("selectButton pressed")
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
