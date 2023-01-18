//
//  FlagsModeViewController.swift
//  QuizApp
//
//  Created by Adil Gumarov on 17.01.2023.
//

import UIKit
import SnapKit

class FlagsModeViewController: UIViewController {
    
    let timerProgressBar = UIProgressView()
    var timer = Timer()
    var totalTime = 10
    var secondPassed = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        initialize()
        
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    func initialize() {
        
        let topView = UIView()
        topView.backgroundColor = .systemTeal
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.45)
        }
        
        let fiftyFiftyButton: UIButton = {
            let button = UIButton()
            button.setTitle(" 50/50? ", for: .normal)
            button.addTarget(self, action: #selector(getFiftyFiftyAnswer), for: .touchUpInside)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 8
            return button
        }()
        topView.addSubview(fiftyFiftyButton)
        fiftyFiftyButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(30)
        }
        
        let flagLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 200)
            label.text = "🇩🇪"
            return label
        }()
        topView.addSubview(flagLabel)
        flagLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        
        timerProgressBar.progress = 0
        timerProgressBar.progressTintColor = .systemYellow
        timerProgressBar.trackTintColor = .systemGreen
        timerProgressBar.layer.borderWidth = 1.0
//        timerProgressBar.layer.cornerRadius = 8
        topView.addSubview(timerProgressBar)
        timerProgressBar.snp.makeConstraints { make in
            make.top.equalTo(flagLabel.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(10)
        }
        
        
//        ========================
        
        let variantStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
//            sv.backgroundColor = .systemTeal
            sv.alignment = .fill
            sv.distribution = .fillEqually
            sv.spacing = 30
            return sv
        }()
        view.addSubview(variantStackView)
        variantStackView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(10)
            make.top.equalTo(topView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        let firstButton: UIButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 8
            button.setTitle("Option A", for: .normal)
            return button
        }()
        
        let secondButton: UIButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 8
            button.setTitle("Option B", for: .normal)
            return button
        }()
        
        let thirdButton: UIButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 8
            button.setTitle("Option C", for: .normal)
            return button
        }()
        
        let fourthButton: UIButton = {
            let button = UIButton()
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 8
            button.setTitle("Option D", for: .normal)
            return button
        }()
        
        [firstButton, secondButton, thirdButton, fourthButton] . forEach { button in
            variantStackView.addArrangedSubview(button)
        }
    }
    
    @objc func getFiftyFiftyAnswer() {
        print("Unavailable function")
    }
    
    @objc func updateTimer() {
        if secondPassed < totalTime {
            secondPassed += 1
            timerProgressBar.progress = Float(secondPassed) / Float(totalTime)
        } else {
            timer.invalidate()
            print("Уакыт битти 667")
        }
        
    }
    
}
