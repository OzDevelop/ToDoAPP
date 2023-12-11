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
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 10
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        return backView
    }()
    
    let toDoTextLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0 // 여러 줄로 표시되도록
        label.setContentHuggingPriority(UILayoutPriority(752), for: .vertical)
        
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
        
        // NSAttributedString 생성
        let attributedString = NSMutableAttributedString()
        
        let title = "UPDATE"
        let symbol = UIImage(systemName: "pencil.tip")

        // 이미지 부분 추가 (텍스트 앞에)
        if let symbol = symbol {
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = symbol
            
            // 이미지 크기 설정
//            let imageSize = CGSize(width: 20, height: 20)
//            imageAttachment.bounds = CGRect(origin: .zero, size: imageSize)

            // 이미지 색상 설정
            let coloredImage = symbol.withTintColor(.white, renderingMode: .alwaysOriginal)
            imageAttachment.image = coloredImage
            
            let imagePart = NSAttributedString(attachment: imageAttachment)
            attributedString.append(imagePart)
        }

        // 텍스트 부분 추가
        let textPart = NSAttributedString(string: title, attributes: [.font : UIFont.systemFont(ofSize: 9), .foregroundColor : UIColor.white])
        attributedString.append(textPart)

        // 버튼에 NSAttributedString 설정
        
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        
        button.setAttributedTitle(attributedString, for: .normal)
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
        // 주의사항
        self.addSubview(backView)
        self.contentView.addSubview(backView)
        // 위 두개는 차이가 있음. 풀로 채우고 싶으면 contentView에 넣어줘야 함
        backView.addSubview(stackView)
        
        // stackView, backView 정렬
        NSLayoutConstraint.activate([
            toDoTextLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 50),
            
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
            updateButtonView.heightAnchor.constraint(equalToConstant: 30),
            
            dateTextLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
            dateTextLabel.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0),
            
            updateButton.heightAnchor.constraint(equalToConstant: 26),
            updateButton.widthAnchor.constraint(equalToConstant: 70),
            updateButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
            updateButton.bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 0)
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
