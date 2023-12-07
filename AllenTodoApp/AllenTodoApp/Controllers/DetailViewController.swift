//
//  DetailViewController.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/6/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    

}
