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

        addColorButtonAction()
        configureUI()
        
        clearButtonColors()
        setupColorTheme()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.buttons.forEach { button in
            button.clipsToBounds = true
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    //MARK: - button func
    
    func addColorButtonAction() {
        detailView.redButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        detailView.greenButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        detailView.blueButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        detailView.purpleButton.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
    }
    
    @objc func colorButtonTapped(sender: UIButton) {
        print(sender.tag)
        
        detailView.temporaryNum = Int64(sender.tag)
        
        let color = MyColor(rawValue: Int64(sender.tag))
        setupColorTheme(color: color)
        
        clearButtonColors()
        setupColorButton(num: Int64(sender.tag))
    }
    
    func setupColorTheme(color: MyColor? = .red) {
        detailView.backgroundView.backgroundColor = color?.backgoundColor
        detailView.saveButton.backgroundColor = color?.buttonColor
    }
    
    func clearButtonColors() {
        detailView.redButton.backgroundColor = MyColor.red.backgoundColor
        detailView.redButton.setTitleColor(MyColor.red.buttonColor, for: .normal)
        detailView.greenButton.backgroundColor = MyColor.green.backgoundColor
        detailView.greenButton.setTitleColor(MyColor.green.buttonColor, for: .normal)
        detailView.blueButton.backgroundColor = MyColor.blue.backgoundColor
        detailView.blueButton.setTitleColor(MyColor.blue.buttonColor, for: .normal)
        detailView.purpleButton.backgroundColor = MyColor.purple.backgoundColor
        detailView.purpleButton.setTitleColor(MyColor.purple.buttonColor, for: .normal)
    }
    
    func setupColorButton(num: Int64) {
        switch num {
        case 1:
            detailView.redButton.backgroundColor = MyColor.red.buttonColor
            detailView.redButton.setTitleColor(.white, for: .normal)
        case 2:
            detailView.greenButton.backgroundColor = MyColor.green.buttonColor
            detailView.greenButton.setTitleColor(.white, for: .normal)
        case 3:
            detailView.blueButton.backgroundColor = MyColor.blue.buttonColor
            detailView.blueButton.setTitleColor(.white, for: .normal)
        case 4:
            detailView.purpleButton.backgroundColor = MyColor.purple.buttonColor
            detailView.purpleButton.setTitleColor(.white, for: .normal)
        default:
            detailView.redButton.backgroundColor = MyColor.red.buttonColor
            detailView.redButton.setTitleColor(.white, for: .normal)
        }
    }
    
    
    //MARK: - configureUI
    
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
            setupColorTheme(color: color)
            
        // 기존데이터가 없을때
        } else {
            self.title = "새로운 메모 생성하기"
            
            detailView.mainTextView.text = "텍스트를 여기에 입력하세요."
            detailView.mainTextView.textColor = .lightGray
            setupColorTheme(color: .red)
        }
        setupColorButton(num: detailView.temporaryNum ?? 1)
    }
    
    

}
