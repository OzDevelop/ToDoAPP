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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = MainView()
        
        setupNaviBar()
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
        mainView.tableView.register(ToDoCell.self, forCellReuseIdentifier: "ToDoCell")
        mainView.tableView.separatorStyle = .none
    }

    
    @objc func plusButtonTapped() {
        print("plus Button Tapped")
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(#function)
        return toDoManager.getTodoListFromCoreData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function)
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        let todoData = toDoManager.getTodoListFromCoreData()
        
        cell.toDoData = todoData[indexPath.row]
        
        return UITableViewCell()
    }
}
