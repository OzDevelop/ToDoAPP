//
//  ToDoCell.swift
//  AllenTodoApp
//
//  Created by 변상필 on 12/7/23.
//

import UIKit

class ToDoCell: UITableViewCell {
    
    let backView: UIView = {
        let backView = UIView()
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        return backView
    }()
    
    let toDoTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let dateTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let updateButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var updateButtonView: UIView = {
        let view = UIView()
        
        view.addSubview(dateTextLabel)
        view.addSubview(updateButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fill
        sv.alignment = .fill
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        sv.addArrangedSubview(toDoTextLabel)
        sv.addArrangedSubview(updateButtonView)
        return sv
    }()
    
    var toDoData: MemoData? {
        didSet {
            configureUIwithData()
        }
    }
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(backView)
        backView.addSubview(stackView)
        print(#function)
        
        // stackView, backView 정렬
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 25),
            backView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -25),
            backView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10)
        ])
        
        // updateButtonView 내부 정렬
        NSLayoutConstraint.activate([
            dateTextLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            dateTextLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0),
            
            updateButton.heightAnchor.constraint(equalToConstant: 26),
            updateButton.widthAnchor.constraint(equalToConstant: 70),
            updateButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            updateButton.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)
        ])
    }
    
    func configureUIwithData() {
        toDoTextLabel.text = toDoData?.memoText
        dateTextLabel.text = toDoData?.dateString
        guard let colorNum = toDoData?.color else { return }
        let color = MyColor(rawValue: colorNum) ?? .red
        updateButton.backgroundColor = color.buttonColor
        backView.backgroundColor = color.backgoundColor
    }
}
