//
//  ShuffleModeViewController.swift
//  QuizApp
//
//  Created by Adil Gumarov on 26.01.2023.
//

import Foundation
import UIKit

class ShuffleModeViewController: UIViewController {
    let shuffleLabel = UILabel()
    let levelLabel = UILabel()
    let fiftyFiftyButton = UIButton()

    let firstButton = UIButton()
    let secondButton = UIButton()
    let thirdButton = UIButton()
    let fourthButton = UIButton()

    let timerProgressBar = UIProgressView()
    var timer = Timer()
    var totalTime = 15
    var secondPassed = 0

    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemCyan
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        initialize()
        quizBrain.newGameStarted()
        updateUI()
    }

    func setButtonParameters(_ button: UIButton) {
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.layer.borderWidth = 2.0
        button.layer.cornerRadius = 8
        button.titleLabel?.numberOfLines = 0
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.titleLabel?.lineBreakMode = .byWordWrapping
        button.setTitle("Option A", for: .normal)
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
    }

    func initialize() {
        
        let topView = UIView()
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
        
        shuffleLabel.font = UIFont.systemFont(ofSize: 200)
        shuffleLabel.textAlignment = .center
        shuffleLabel.textColor = .white
        shuffleLabel.numberOfLines = 0
        shuffleLabel.adjustsFontSizeToFitWidth = true
        shuffleLabel.lineBreakMode = .byWordWrapping
        topView.addSubview(shuffleLabel)
        shuffleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
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
        topView.addSubview(timerProgressBar)
        timerProgressBar.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).inset(40)
            make.leading.trailing.equalToSuperview().inset(40)
            make.height.equalTo(10)
        }
        
        
    //        ========================
        
        let variantStackView: UIStackView = {
            let sv = UIStackView()
            sv.axis = .vertical
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
        
        [firstButton, secondButton, thirdButton, fourthButton] . forEach { button in
            setButtonParameters(button)
            variantStackView.addArrangedSubview(button)
        }
    }

    func showGameOverVC(message: String) {
        let endGameVC = GameEndViewController(quizBrain.getScore())
        navigationController?.pushViewController(endGameVC, animated: true)
        print("Game over")
        endGameVC.textCongrat = message
    }

    @objc func getFiftyFiftyAnswer() {
        let correctAnswer = quizBrain.getCorrectAnswer()
        var buttons = [firstButton, secondButton, thirdButton, fourthButton]
        buttons.shuffle()
        
        var counter = 0
        for button in buttons {
            if button.currentTitle != correctAnswer {
                button.titleLabel?.textColor = .clear
                button.isUserInteractionEnabled = false
                counter += 1
            }
            if counter == 2 {
                break
            }
        }
        fiftyFiftyButton.isHidden = true
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
            if quizBrain.hasNextQuestion {
                showGameOverVC(message: "Game Over")
            }
        }
    }

    @objc func updateUI() {
        
        if quizBrain.hasNextQuestion {
            timer.invalidate()
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            
            var variants = [String]()
            let randomNumber = Int.getUniqueRandomNumbers(min: 1, max: 2, count: 1)
            switch randomNumber[0] {
            case 1:
                variants = quizBrain.updateValues()
                shuffleLabel.font = UIFont.systemFont(ofSize: 200)
            case 2:
                variants = quizBrain.updateValuesForCapitalMode()
                shuffleLabel.font = UIFont.systemFont(ofSize: 45)
            default:
                print("haha")
            }
            
            
            shuffleLabel.text = variants[0]
            
            firstButton.setTitle(variants[1], for: .normal)
            secondButton.setTitle(variants[2], for: .normal)
            thirdButton.setTitle(variants[3], for: .normal)
            fourthButton.setTitle(variants[4], for: .normal)
            levelLabel.text = "\(quizBrain.getNumberOfLevel()+1)/\(quizBrain.getTotalNumberOfLevel())"
            timerProgressBar.progress = 0
            secondPassed = 0
            
            [firstButton, secondButton, thirdButton, fourthButton] . forEach { button in
                button.backgroundColor = UIColor.clear
                button.isUserInteractionEnabled = true
                button.isHidden = false
            }
            print(variants)
        } else {
            showGameOverVC(message: "Congratulations")
        }
        
        
    }
}


