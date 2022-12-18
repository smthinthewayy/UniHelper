//
//  DirectionViewController.swift
//  UniHelper
//
//  Created by Danila Belyi on 06.12.2022.
//

import UIKit

class DirectionViewController: UIViewController {
    let cityLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Город: "
        return label
    }()
    
    let facultyLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Факультет: "
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Наименование: "
        return label
    }()
    
    let subjectsLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Предметы: "
        return label
    }()
    
    let scoresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Проходной балл: "
        return label
    }()
    
    let budgetPlacesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Бюджетных мест: "
        return label
    }()
    
    let paymentLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Стоимость обучения: "
        return label
    }()
    
    let hostelLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.text = "Общежитие: "
        return label
    }()
    
    var direction: Direction? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        loadDirection()
        
        navigationItem.title = direction!.name
    }
    
    func loadDirection() {
        cityLabel.text = cityLabel.text! + direction!.city
        facultyLabel.text = facultyLabel.text! + direction!.faculty
        nameLabel.text = nameLabel.text! + direction!.name
        subjectsLabel.text = subjectsLabel.text! + direction!.subjects.joined(separator: ", ")
        scoresLabel.text = scoresLabel.text! + String(direction!.scores)
        budgetPlacesLabel.text = budgetPlacesLabel.text! + String(direction!.budgetPlaces)
        paymentLabel.text = paymentLabel.text! + String(direction!.payment)
        hostelLabel.text = hostelLabel.text! + direction!.hostel
    }
    
    func setupViews() {
        view.backgroundColor = UIColor(named: "White")
        view.addSubview(cityLabel)
        view.addSubview(facultyLabel)
        view.addSubview(nameLabel)
        view.addSubview(subjectsLabel)
        view.addSubview(scoresLabel)
        view.addSubview(budgetPlacesLabel)
        view.addSubview(paymentLabel)
        view.addSubview(hostelLabel)
    }
    
    func setupConstraints() {
        cityLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalToSuperview().inset(100)
        }
        
        facultyLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(cityLabel).inset(50)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(facultyLabel).inset(50)
        }
        
        subjectsLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(nameLabel).inset(50)
        }
        
        scoresLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(subjectsLabel).inset(50)
        }
        
        budgetPlacesLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(scoresLabel).inset(50)
        }
        
        paymentLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(budgetPlacesLabel).inset(50)
        }
        
        hostelLabel.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(50)
            make.left.equalTo(25)
            make.top.equalTo(paymentLabel).inset(50)
        }
    }
}
