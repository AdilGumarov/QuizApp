//
//  ViewController.swift
//  QuizApp
//
//  Created by Adil Gumarov on 16.01.2023.
//

import UIKit
import SnapKit

class MainPageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
//        tabBarController?.tabBar.isHidden = false
        initialize()
    }
    
    @objc func flagsButtonTapped() {
        let flagVC = FlagsModeViewController()
        flagVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(flagVC, animated: true)
        print("flagsButtonTapped")
    }
    
    @objc func capitalsButtonTapped() {
        let capitalVC = CapitalCityModeViewController()
        capitalVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(capitalVC, animated: true)
        print("capitalsButtonTapped")
    }
    
    @objc func shuffleButtonTapped() {
        let shuffleVC = ShuffleModeViewController()
        shuffleVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(shuffleVC, animated: true)
        print("capitalsButtonTapped")
    }
    
    func initialize() {
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.boldSystemFont(ofSize: 50)
            label.text = "Modes"
            label.textColor = .orange
            label.textAlignment = .center
            return label
        }()
        
        let verticalStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
            sv.alignment = .fill
            sv.distribution = .fillEqually
            sv.spacing = 30
            return sv
        }()
        
        let flagsButton: UIButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.setTitle("Flags", for: .normal)
            button.setTitleColor(.orange, for: .normal)
            button.addTarget(self, action: #selector(flagsButtonTapped), for: .touchUpInside)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 12
            return button
        }()
        
        let capitalsButton: UIButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.setTitle("Capitals", for: .normal)
            button.addTarget(self, action: #selector(capitalsButtonTapped), for: .touchUpInside)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 12
            return button
        }()
        
        let shuffleButton: UIButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.setTitle("Shuffle", for: .normal)
            button.addTarget(self, action: #selector(shuffleButtonTapped), for: .touchUpInside)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 12
            return button
        }()
        
        view.addSubview(titleLabel)
        view.addSubview(verticalStackView)
        
        [flagsButton, capitalsButton, shuffleButton] . forEach { i in
            verticalStackView.addArrangedSubview(i)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(100)
            make.width.equalTo(200)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(60)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.bottom.equalToSuperview().multipliedBy(0.8)
        }
    }


}

