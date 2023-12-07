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
        
        sv.addArrangedSubview(toDoTextLabel)
        sv.addArrangedSubview(updateButtonView)
        return sv
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(backView)
        backView.addSubview(stackView)
        
        
        // updateButtonView 내부 정렬
        NSLayoutConstraint.activate([
            dateTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dateTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            updateButton.heightAnchor.constraint(equalToConstant: 26),
            updateButton.widthAnchor.constraint(equalToConstant: 70),
            updateButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            updateButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        
        // stackView, backView 정렬
        NSLayoutConstraint.activate([
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            stackView.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10)
        ])
    }
}
