//
//  GameEndViewController.swift
//  QuizApp
//
//  Created by Adil Gumarov on 21.01.2023.
//

import UIKit
import SnapKit

class GameEndViewController: UIViewController {
    
    var score = 0
    
    init(_ score: Int) {
        super.init(nibName: nil, bundle: nil)
        self.score = score
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        navigationController?.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
    }
    
    func initialize() {
        let trophyLabel: UILabel = {
            let label = UILabel()
            label.text = "🏆"
            label.font = UIFont.systemFont(ofSize: 170)
            return label
        }()
        
        view.addSubview(trophyLabel)
        trophyLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(50)
        }
        
        let congratsLabel: UILabel = {
            let label = UILabel()
            label.text = "Congratulations"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            return label
        }()
        
        view.addSubview(congratsLabel)
        congratsLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(trophyLabel.snp.bottom).offset(20)
        }
        
        let yourScoreLabel: UILabel = {
            let label = UILabel()
            label.text = "Your score is: \(score)"
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 30)
            return label
        }()
        
        view.addSubview(yourScoreLabel)
        yourScoreLabel.snp.makeConstraints { make in
            make.top.equalTo(congratsLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }
        
        let goHomeButton: UIButton = {
            let button = UIButton()
            button.setTitle("Back to Home", for: .normal)
            button.backgroundColor = .systemTeal
            button.layer.borderWidth = 2.0
            button.layer.cornerRadius = 12
            button.addTarget(self, action: #selector(goHome), for: .touchUpInside)
            return button
        }()
        view.addSubview(goHomeButton)
        goHomeButton.snp.makeConstraints { make in
            make.top.equalTo(yourScoreLabel.snp.bottom).offset(50)
            make.height.equalTo(50)
            make.width.equalTo(150)
            make.centerX.equalToSuperview()
        }
                                                              
    }
    
    @objc func goHome() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
                                           
                                           
}
