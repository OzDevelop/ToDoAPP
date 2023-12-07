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
        view.backgroundColor = .gray
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
