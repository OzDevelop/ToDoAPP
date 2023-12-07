//
//  DetailView.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/6/23.
//

import UIKit

class DetailView: UIView {

    private let redButton: UIButton = {
        let button = UIButton()
        button.setTitle("Red", for: .normal)
        button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.red.rawValue)
        return button
    }()
    
    private let greenButton: UIButton = {
        let button = UIButton()
        button.setTitle("Green", for: .normal)
        button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.green.rawValue)
        return button
    }()
    
    private let blueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Blue", for: .normal)
        button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.blue.rawValue)
        return button
    }()
    
    private let purpleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Purple", for: .normal)
        button.addTarget(self, action: #selector(colorButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = Int(MyColor.purple.rawValue)
        return button
    }()
    
    lazy var buttons: [UIButton] = [redButton, greenButton, blueButton, purpleButton]
    
    private let mainTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
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
    
    //MARK: - button action func
    @objc func colorButtonTapped(sender: UIButton) {
        print(sender.tag)
    }
    
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
