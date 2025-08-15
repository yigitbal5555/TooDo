//
//  HomeHeaderView.swift
//  TooDo
//
//  Created by Yiğit Bal on 13.07.2025.
//

import UIKit
import SnapKit

class HomeHeaderView: UIView {
    
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = .label
        label.text = "Good Morning!"
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .label
        label.text = "John Doe"
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .secondaryLabel
        return label
    }()
    
    private let progressContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.layer.cornerRadius = 12
        return view
    }()
    
    private let progressBar: UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.text = "Daily Progress"
        return label
    }()
    
    private let progressPercentageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .label
        label.text = "75%"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        updateDate()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        updateDate()
    }
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubview(greetingLabel)
        addSubview(nameLabel)
        addSubview(dateLabel)
        addSubview(progressContainer)
        progressContainer.addSubview(progressBar)
        addSubview(progressLabel)
        addSubview(progressPercentageLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        greetingLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(20)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(20)
        }
        
        progressContainer.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(24)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(24)
        }
        
        progressBar.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(2)
            make.width.equalTo(progressContainer.snp.width).multipliedBy(0.75)
        }
        
        progressLabel.snp.makeConstraints { make in
            make.top.equalTo(progressContainer.snp.bottom).offset(8)
            make.left.equalToSuperview().inset(20)
        }
        
        progressPercentageLabel.snp.makeConstraints { make in
            make.top.equalTo(progressContainer.snp.bottom).offset(8)
            make.right.equalToSuperview().inset(20)
        }
    }
    
    private func updateDate() {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMMM d"
        dateLabel.text = formatter.string(from: Date())
    }
    
    func updateGreeting() {
        let hour = Calendar.current.component(.hour, from: Date())
        
        switch hour {
        case 5..<12:
            greetingLabel.text = "Good Morning!"
        case 12..<17:
            greetingLabel.text = "Good Afternoon!"
        case 17..<22:
            greetingLabel.text = "Good Evening!"
        default:
            greetingLabel.text = "Good Night!"
        }
    }
    
    func updateProgress(_ percentage: Float) {
        let clampedPercentage = max(0, min(1, percentage))
        
        progressBar.snp.remakeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(2)
            make.width.equalTo(progressContainer.snp.width).multipliedBy(clampedPercentage)
        }
        
        progressPercentageLabel.text = "\(Int(clampedPercentage * 100))%"
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
}
