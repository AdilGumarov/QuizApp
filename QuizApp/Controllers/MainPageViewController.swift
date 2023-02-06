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
        view.backgroundColor = .systemIndigo
//        tabBarController?.tabBar.isHidden = false
        initialize()
    }
    
    @objc func modeButtonTapped(_ button: UIButton) {
        guard let mode = button.currentTitle else {return}
        let gameVC = GameViewController(mode)
        gameVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(gameVC, animated: true)
    }
    
    func setDefaultButtonSettings(_ button: UIButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(modeButtonTapped), for: .touchUpInside)
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 12
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
            button.setTitle("Flags", for: .normal)
            return button
        }()
        
        let capitalsButton: UIButton = {
            let button = UIButton()
            button.setTitle("Capitals", for: .normal)
            return button
        }()
        
        let shuffleButton: UIButton = {
            let button = UIButton()
            button.setTitle("Shuffle", for: .normal)
            return button
        }()
        
        [flagsButton, capitalsButton, shuffleButton].forEach { button in
            setDefaultButtonSettings(button)
            verticalStackView.addArrangedSubview(button)
        }
        
        let adilLabel: UILabel = {
            let label = UILabel()
            label.text = "game created by Adil Gumarov  "
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 12)
            return label
        }()
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(200)
            make.height.equalTo(100)
            make.width.equalTo(200)
        }
        
        view.addSubview(verticalStackView)
        verticalStackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(60)
            make.top.equalTo(titleLabel.snp.bottom).offset(50)
            make.bottom.equalToSuperview().multipliedBy(0.8)
        }
        
        view.addSubview(adilLabel)
        adilLabel.snp.makeConstraints { make in
            make.top.equalTo(verticalStackView.snp.bottom).offset(60)
            make.trailing.equalToSuperview()
        }
    }
}

