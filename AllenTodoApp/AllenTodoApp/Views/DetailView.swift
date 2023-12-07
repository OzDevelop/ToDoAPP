//
//  DetailView.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/6/23.
//

import UIKit

class DetailView: UIView {

    let redButton: UIButton = {
        let button = UIButton()
        button.setTitle("Red", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.red.rawValue)
        return button
    }()
    
    let greenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Green", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.green.rawValue)
        return button
    }()
    
    let blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Blue", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.blue.rawValue)
        return button
    }()
    
    let purpleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Purple", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.purple.rawValue)
        return button
    }()
    
    lazy var buttons: [UIButton] = [redButton, greenButton, blueButton, purpleButton]
    
    let mainTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save Button", for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let stackView: UIStackView = {
        let stView = UIStackView()
        stView.axis = .horizontal
        stView.distribution = .fillEqually
        stView.alignment = .fill
        stView.spacing = 15
        stView.translatesAutoresizingMaskIntoConstraints = false
        
        return stView
    }()
    
    var temporaryNum: Int64? = 1
    
//    //MARK: - button action func
//    @objc func colorButtonTapped(sender: UIButton) {
//        print(sender.tag)
//        
//        self.temporaryNum = Int64(sender.tag)
//        
//        let color = MyColor(rawValue: Int64(sender.tag))
//        setupColorTheme(color: color)
//        
//        clearButtonColors()
//        setupColorButton(num: Int64(sender.tag))
//    }
//    
//    func setupColorTheme(color: MyColor? = .red) {
//        backgroundView.backgroundColor = color?.backgoundColor
//        saveButton.backgroundColor = color?.buttonColor
//    }
//    
//    func clearButtonColors() {
//        redButton.backgroundColor = MyColor.red.backgoundColor
//        redButton.setTitleColor(MyColor.red.buttonColor, for: .normal)
//        greenButton.backgroundColor = MyColor.green.backgoundColor
//        greenButton.setTitleColor(MyColor.green.buttonColor, for: .normal)
//        blueButton.backgroundColor = MyColor.blue.backgoundColor
//        blueButton.setTitleColor(MyColor.blue.buttonColor, for: .normal)
//        purpleButton.backgroundColor = MyColor.purple.backgoundColor
//        purpleButton.setTitleColor(MyColor.purple.buttonColor, for: .normal)
//    }
//    
//    func setupColorButton(num: Int64) {
//        switch num {
//        case 1:
//            redButton.backgroundColor = MyColor.red.buttonColor
//            redButton.setTitleColor(.white, for: .normal)
//        case 2:
//            greenButton.backgroundColor = MyColor.green.buttonColor
//            greenButton.setTitleColor(.white, for: .normal)
//        case 3:
//            blueButton.backgroundColor = MyColor.blue.buttonColor
//            blueButton.setTitleColor(.white, for: .normal)
//        case 4:
//            purpleButton.backgroundColor = MyColor.purple.buttonColor
//            purpleButton.setTitleColor(.white, for: .normal)
//        default:
//            redButton.backgroundColor = MyColor.red.buttonColor
//            redButton.setTitleColor(.white, for: .normal)
//        }
//    }
//    
//    @objc func saveButtonTapped() {
//        
//    }
    
    //MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStackViewLayout()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - setupLayout
    func setupStackViewLayout() {
        self.addSubview(stackView)
        buttons.forEach {
            stackView.addArrangedSubview($0)
        }

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
//            stackView.bottomAnchor.constraint(equalTo: self.backgroundView.topAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    func setupLayout() {
        self.addSubview(backgroundView)
        self.addSubview(saveButton)
        backgroundView.addSubview(mainTextView)
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 40),
            backgroundView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            backgroundView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            backgroundView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -40),
            backgroundView.heightAnchor.constraint(equalToConstant: 200),
            
            mainTextView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 8),
            mainTextView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 15),
            mainTextView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -15),
            mainTextView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -8),
            
            saveButton.topAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: 40),
            saveButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            saveButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            saveButton.heightAnchor.constraint(equalToConstant: 40)

        ])
        
    }
    
}
