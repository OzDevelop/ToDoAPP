//
//  ViewController.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/6/23.
//

import UIKit

class ViewController: UIViewController{

    
    
    private let mainView = MainView()

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
        
        mainView.tableView.separatorStyle = .none
    }

    
    @objc func plusButtonTapped() {
        print("plus Button Tapped")
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
