//
//  SettingViewController.swift
//  QuizApp
//
//  Created by Adil Gumarov on 18.01.2023.
//

import Foundation
import UIKit

class SettingViewController: UIViewController {
    
    let tableView = UITableView()
    
    var quizBrain = QuizBrain()
    
    let segmentedControl: UISegmentedControl =  {
        let sc = UISegmentedControl(items: ["Flag", "Capital", "Shuffle"])
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Ranking"
        navigationItem.titleView?.tintColor = .black
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(barButtonTapped))
        
        initialize()
        addObservers()
        quizBrain.getDataFromCoreData()
    }
    
    @objc func barButtonTapped() {
        
    }
    
    func addObservers() {
        NotificationCenter.default.addObserver(forName: .NSManagedObjectContextObjectsDidChange, object: nil, queue: nil) { [weak self] _ in
            print("Core data changed")
            self?.quizBrain.getDataFromCoreData()
            self?.tableView.reloadData()
        }
    }
    
    func initialize() {
        
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(15)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        quizBrain.getNumberOfUsers()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingTableViewCell
        
        cell.userNameLabel.text = quizBrain.getName(at: indexPath.row)
        cell.scoreLabel.text = String(quizBrain.getScore(at: indexPath.row))
        
        return cell
    }
    
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        70.0
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, complectionHandler) in
            
            self.quizBrain.removeUser(at: indexPath.row)
//             self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            complectionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

class SettingTableViewCell: UITableViewCell {
    let userNameLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let vStack: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.alignment = .center
        sv.distribution = .equalSpacing
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(vStack)
        vStack.addArrangedSubview(userNameLabel)
        vStack.addArrangedSubview(scoreLabel)
        
        vStack.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
