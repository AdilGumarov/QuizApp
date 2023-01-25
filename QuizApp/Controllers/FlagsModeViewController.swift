//
//  FlagsModeViewController.swift
//  QuizApp
//
//  Created by Adil Gumarov on 17.01.2023.
//

import UIKit
import SnapKit

class FlagsModeViewController: UIViewController {
    
    let flagLabel = UILabel()
    let levelLabel = UILabel()
    let fiftyFiftyButton = UIButton()
    
    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()
    
    let timerProgressBar = UIProgressView()
    var timer = Timer()
    var totalTime = 10
    var secondPassed = 0
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() { 
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        initialize()
        updateUI()
    }
    
    func initialize() {
        
        let topView = UIView()
        topView.backgroundColor = .systemTeal
        view.addSubview(topView)
        topView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.bottom.equalToSuperview().multipliedBy(0.45)
        }
        
        fiftyFiftyButton.setTitle(" 50/50? ", for: .normal)
        fiftyFiftyButton.addTarget(self, action: #selector(getFiftyFiftyAnswer), for: .touchUpInside)
        fiftyFiftyButton.layer.borderWidth = 2.0
        fiftyFiftyButton.layer.cornerRadius = 8
        topView.addSubview(fiftyFiftyButton)
        fiftyFiftyButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).inset(30)
        }
        
        flagLabel.font = UIFont.systemFont(ofSize: 200)
        flagLabel.text = "🇩🇿"
        topView.addSubview(flagLabel)
        flagLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        levelLabel.text = "1/140"
        levelLabel.textColor = .white
        levelLabel.font = UIFont.systemFont(ofSize: 20)
        topView.addSubview(levelLabel)
        levelLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).inset(30)
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
        
        firstButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        firstButton.layer.borderWidth = 2.0
        firstButton.layer.cornerRadius = 8
        firstButton.setTitle("Option A", for: .normal)
        firstButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        secondButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        secondButton.layer.borderWidth = 2.0
        secondButton.layer.cornerRadius = 8
        secondButton.setTitle("Option A", for: .normal)
        secondButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        thirdButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        thirdButton.layer.borderWidth = 2.0
        thirdButton.layer.cornerRadius = 8
        thirdButton.setTitle("Option A", for: .normal)
        thirdButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
        fourthButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        fourthButton.layer.borderWidth = 2.0
        fourthButton.layer.cornerRadius = 8
        fourthButton.setTitle("Option A", for: .normal)
        fourthButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        
    
        
        [firstButton, secondButton, thirdButton, fourthButton] . forEach { button in
            variantStackView.addArrangedSubview(button)
        }
    }
    
    @objc func getFiftyFiftyAnswer() {
        var buttons = [firstButton, secondButton, thirdButton, fourthButton]
        buttons.shuffle()
//        fiftyFiftyButton.isHidden = true
        print("Function test")
    }
    
    @objc func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotITRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotITRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        print(userAnswer)
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
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
    
    @objc func updateUI() {
        
        if quizBrain.hasNextQuestion {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            let variants = quizBrain.updateValues()
            
            flagLabel.text = variants[0]
            
            firstButton.setTitle(variants[1], for: .normal)
            secondButton.setTitle(variants[2], for: .normal)
            thirdButton.setTitle(variants[3], for: .normal)
            fourthButton.setTitle(variants[4], for: .normal)
            levelLabel.text = "\(quizBrain.getNumberOfLevel()+1)/\(quizBrain.getTotalNumberOfLevel())"
            timerProgressBar.progress = 0
            secondPassed = 0
            
            [firstButton, secondButton, thirdButton, fourthButton] . forEach { button in
                button.backgroundColor = UIColor.clear
                button.isHidden = false
            }
            print(variants)
        } else {
            let endGameVC = GameEndViewController(quizBrain.getScore())
            navigationController?.pushViewController(endGameVC, animated: true)
            print("Game over")
        }
        
        
    }
    
}
