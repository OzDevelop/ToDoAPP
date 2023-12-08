//
//  ViewController.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/6/23.
//

import UIKit

class ViewController: UIViewController{

    private let mainView = MainView()
    let toDoManager = CoreDataManager.shared

    
    //MARK: - ViewDidLoad(), viewWillAppear()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = mainView
        
        setupNaviBar()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
            self.mainView.tableView.reloadData()
    }
    
    //MARK: - setup 메서드
    func setupNaviBar() {
        let plusBtn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(plusButtonTapped))
        
        self.title = "MEMO"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = plusBtn
    }
    
    func setupTableView() {
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.register(ToDoCell.self, forCellReuseIdentifier: "ToDoCell")
        
//        mainView.tableView.separatorStyle = .none
    }

    
    @objc func plusButtonTapped() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        print(toDoManager.getTodoListFromCoreData().count)
        return toDoManager.getTodoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        let todoData = toDoManager.getTodoListFromCoreData()
        
        cell.toDoData = todoData[indexPath.row]
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
}
