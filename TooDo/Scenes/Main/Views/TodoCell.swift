//
//  TodoCell.swift
//  TooDo
//
//  Created by Yiğit Bal on 13.07.2025.
//

import UIKit
import SnapKit

class TodoCell: UICollectionViewCell {
    
    static let identifier = "TodoCell"
    
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBackground
        view.layer.cornerRadius = 16
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 8
        return view
    }()
    
    private let checkBoxButton: UIButton = {
        let button = UIButton(type: .custom)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.systemGray4.cgColor
        button.layer.cornerRadius = 12
        button.backgroundColor = .clear
        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.text = "Complete project"
        return label
    }()
    
    private let priorityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .white
        label.backgroundColor = .systemRed
        label.layer.cornerRadius = 8
        label.layer.masksToBounds = true
        label.text = "HIGH"
        label.textAlignment = .center
        return label
    }()
    
    private let dueDateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .secondaryLabel
        label.text = "Due: Today"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(checkBoxButton)
        containerView.addSubview(titleLabel)
        containerView.addSubview(priorityLabel)
        containerView.addSubview(dueDateLabel)
        
        setupConstraints()
        setupActions()
    }
    
    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        checkBoxButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(checkBoxButton.snp.right).offset(12)
            make.top.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
        }
        
        priorityLabel.snp.makeConstraints { make in
            make.left.equalTo(titleLabel)
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.width.equalTo(40)
            make.height.equalTo(16)
        }
        
        dueDateLabel.snp.makeConstraints { make in
            make.left.equalTo(priorityLabel.snp.right).offset(8)
            make.centerY.equalTo(priorityLabel)
            make.bottom.equalToSuperview().offset(-16)
        }
    }
    
    private func setupActions() {
        checkBoxButton.addTarget(self, action: #selector(checkBoxTapped), for: .touchUpInside)
    }
    
    @objc private func checkBoxTapped() {
        let isCompleted = checkBoxButton.backgroundColor == .systemGreen
        updateCheckBoxState(!isCompleted)
    }
    
    private func updateCheckBoxState(_ isCompleted: Bool) {
        if isCompleted {
            checkBoxButton.backgroundColor = .systemGreen
            checkBoxButton.layer.borderColor = UIColor.systemGreen.cgColor
            checkBoxButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            checkBoxButton.tintColor = .white
            
            titleLabel.attributedText = NSAttributedString(
                string: titleLabel.text ?? "",
                attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
            )
        } else {
            checkBoxButton.backgroundColor = .clear
            checkBoxButton.layer.borderColor = UIColor.systemGray4.cgColor
            checkBoxButton.setImage(nil, for: .normal)
            
            titleLabel.attributedText = NSAttributedString(string: titleLabel.text ?? "")
        }
    }
    
    func configure(with todo: Todo) {
        titleLabel.text = todo.title
        priorityLabel.text = todo.priority.rawValue
        priorityLabel.backgroundColor = todo.priority.color
        dueDateLabel.text = "Due: \(todo.dueDate)"
        updateCheckBoxState(todo.isCompleted)
    }
}

struct Todo {
    let title: String
    let priority: Priority
    let dueDate: String
    let isCompleted: Bool
}

enum Priority: String, CaseIterable {
    case low = "LOW"
    case medium = "MED"
    case high = "HIGH"
    
    var color: UIColor {
        switch self {
        case .low: return .systemGreen
        case .medium: return .systemOrange
        case .high: return .systemRed
        }
    }
}
