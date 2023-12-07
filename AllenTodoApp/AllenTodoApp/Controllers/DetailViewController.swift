//
//  DetailViewController.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/6/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    let toDoManager = CoreDataManager.shared
    
    var toDoData: MemoData? {
        didSet {
            detailView.temporaryNum = toDoData?.color
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view = detailView
        view.backgroundColor = .systemBackground
        
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    func configureUI() {
        // 기존데이터가 있을때
        if let toDoData = self.toDoData {
            self.title = "메모 수정하기"
            
            guard let text = toDoData.memoText else { return }
            detailView.mainTextView.text = text
            
            detailView.mainTextView.textColor = .black
            detailView.saveButton.setTitle("UPDATE", for: .normal)
            detailView.mainTextView.becomeFirstResponder()
            let color = MyColor(rawValue: toDoData.color)
            detailView.setupColorTheme(color: color)
            
        // 기존데이터가 없을때
        } else {
            self.title = "새로운 메모 생성하기"
            
            detailView.mainTextView.text = "텍스트를 여기에 입력하세요."
            detailView.mainTextView.textColor = .lightGray
            detailView.setupColorTheme(color: .red)
        }
        detailView.setupColorButton(num: detailView.temporaryNum ?? 1)
    }

}
